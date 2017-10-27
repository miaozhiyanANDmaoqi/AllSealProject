package com.controller.indexOfLucene;

import com.domain.eneity.GoodsInfo;
import com.service.GoodsService;
import com.service.impl.GoodsServiceImpl;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
@Controller
public class IndexManager {
    @Autowired
    GoodsService goodsService;
    @RequestMapping("lucene")
    public void createIndex() throws IOException{
        //1 采集数据
        GoodsInfo null_goodsInfo = new GoodsInfo();
        List<GoodsInfo> goodsInfoList = goodsService.listGoods(null_goodsInfo);

        //2 将采集到的数据封装到document对象中
        List<Document> documentList = new ArrayList<Document>();
        Document document;
        for(GoodsInfo goodsInfo : goodsInfoList){
            document = new Document();
            Field gid = new TextField("gid",goodsInfo.getGid().toString(), Field.Store.YES);//gid为域名称。Store.YES说明存储到文档与中。为NO则不保存到文档域（索引域依然有）
            Field uid = new TextField("uid",goodsInfo.getUid().toString(), Field.Store.YES);
            Field goodsname = new TextField("goodsname",goodsInfo.getGoodsName(), Field.Store.YES);
            //将field域设置到document对象中
            document.add(gid);
            document.add(uid);
            document.add(goodsname);
            documentList.add(document);
        }
        //3 创建分词器
        Analyzer analyzer = new StandardAnalyzer();

        //4 创建IndexWriter
        IndexWriterConfig writerConfig = new IndexWriterConfig(analyzer);
        //指定索引库的地址
        Directory directory = FSDirectory.open(Paths.get("D:\\AllSeal\\AllSealProject\\target\\WeSeal\\indexOfLucene"));
        IndexWriter writer = new IndexWriter(directory,writerConfig);
        //通过indexWriter对象将document写入到索引库中
        for(Document doc : documentList){
            writer.addDocument(doc);
        }
        writer.close();
    }
}
