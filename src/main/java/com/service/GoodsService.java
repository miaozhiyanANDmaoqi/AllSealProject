package com.service;

import com.domain.eneity.GoodsInfo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface GoodsService {
    /**
     * 上传商品文件
     * @param request
     */
    public void uploadFile(HttpServletRequest request);

    /**
     * 展示商品列表
     */
    public List<GoodsInfo> listGoods(GoodsInfo goodsInfo);
}
