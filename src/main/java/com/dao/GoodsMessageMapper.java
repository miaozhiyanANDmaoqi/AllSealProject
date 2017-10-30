package com.dao;

import com.domain.eneity.GoodsInfo;
import com.domain.eneity.GoodsMessage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMessageMapper {
    public List<GoodsMessage> findMSG(GoodsInfo goodsInfo);
}
