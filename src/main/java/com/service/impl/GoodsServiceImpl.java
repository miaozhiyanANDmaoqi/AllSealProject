package com.service.impl;

import com.dao.GoodsInfoMapper;
import com.domain.eneity.GoodsInfo;
import com.service.GoodsService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService{
    @Autowired
    private GoodsInfoMapper goodsInfoMapper;

    public int addGoods(GoodsInfo goodsInfo) {
        //设置上传日期
        goodsInfo.setOnline_time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        //设置商品的id
        Random random = new Random();
        Integer gid = random.nextInt(Integer.MAX_VALUE)+goodsInfo.getUid()*31;
        goodsInfo.setGid(gid);
        //插入商品表
        return goodsInfoMapper.insertGoods(goodsInfo);
    }

    public List<GoodsInfo> listGoods(GoodsInfo goodsInfo) {
        List<GoodsInfo> goodsInfoList = goodsInfoMapper.listGoods(goodsInfo);
        return goodsInfoList;
    }

    public void uploadFile(HttpServletRequest request){
        try {
            /*
            fileupload 组件提供上传组件，可以解析request.getInputStream()
            */
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(factory);

            List<FileItem> fileItems = servletFileUpload.parseRequest(request);
            for (FileItem fileItem : fileItems){
                if (fileItem.isFormField()){
                    //普通表单项
                    processFormField(fileItem);
                }else{
                    //上传文件表单项
                    processUploadField(fileItem,request);
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }


    private void processUploadField(FileItem fileItem,HttpServletRequest request){
        String fileName = fileItem.getName();
        if(fileName!=null){
            fileName= FilenameUtils.getName(fileName);//只取最后的文件名
        }
        fileName = UUID.randomUUID()+"_"+fileName;//防止同名文件覆盖

        String dateDir=new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        //存WEB-INF下安全
        String dirRealPath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
        dirRealPath=dirRealPath+ File.separator+dateDir;
        File directory = new File(dirRealPath);
        if(!directory.exists()){
            directory.mkdirs();//若不存在，则创建目录
        }
        File file = new File(directory,fileName);//真正上传的文件应该存入的此文件
        try {
            fileItem.write(file);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    private void processFormField(FileItem fileItem){
        String fieldName = fileItem.getFieldName();
        String fieldValue = fileItem.getString();
    }
}
