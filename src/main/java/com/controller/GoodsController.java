package com.controller;

import com.alibaba.fastjson.JSONArray;
import com.domain.eneity.GoodsInfo;
import com.domain.po.User_AllInfo;
import com.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Controller
@RequestMapping("Goods")
public class GoodsController {
    @Autowired
    GoodsService goodsService;

    @RequestMapping("uploadGood")
    public String uploadGood(HttpServletRequest request){
        goodsService.uploadFile(request);
        return "jsp/myInfo";
    }

    @RequestMapping("/listGoods")
    public void listGoods(HttpServletResponse response,HttpServletRequest request){
        GoodsInfo goodsInfo = new GoodsInfo();
        String typeStr = request.getParameter("goodstype");
        if(null != typeStr && !typeStr.equals("0")){
            goodsInfo.setGoodstype(Integer.parseInt(typeStr));
        }
        List goodslist = goodsService.listGoods(goodsInfo);
        try {
            response.setContentType("application/json;charset=UTF-8");
            String jsonList = JSONArray.toJSONString(goodslist);
            response.getWriter().write(jsonList);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("addGoods")
    public String addGoods(GoodsInfo goodsInfo){
        goodsService.addGoods(goodsInfo);
        return "jsp/transaction";
    }
    @RequestMapping("uploadGoodsIMG")
    public void uploadGoodsIMG(HttpServletRequest request,HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
            MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
            CommonsMultipartFile cf = (CommonsMultipartFile) multipartRequest.getFile("file");//根据文件名获得文件对象
            byte[] b = cf.getBytes();//获得文件上传流
            Integer uid = ((User_AllInfo) request.getSession().getAttribute("Account")).getId();
            String fileOriginalName = cf.getOriginalFilename();//获得上传的文件名称
            String suffix = fileOriginalName.substring(fileOriginalName.lastIndexOf(".") + 1);//获得后缀扩展名

            //上传到服务器
            String dirRealPath = request.getSession().getServletContext().getRealPath("/upload/Goods");
            //如果目录文件不存在，则生成目录文件
            File directory = new File(dirRealPath);
            if (!directory.exists()) {
                directory.mkdirs();//若不存在，则创建目录
            }
            File goodsimg = new File(directory, 1 + "." + suffix);//真正上传的文件应该存入的此文件
            OutputStream outputStream = new FileOutputStream(goodsimg);
            outputStream.write(b);

            //ajax回显
            String fullPath = goodsimg.getPath();
            response.getWriter().write(goodsimg.getName());
        } catch (Exception e) {
        }
    }


    @RequestMapping("uploadGoods")
    public String uploadGoods(){
        return "jsp/uploadGoods";
    }
}
