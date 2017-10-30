package com.service.impl;

import com.dao.GoodsMessageMapper;
import com.domain.eneity.GoodsInfo;
import com.domain.eneity.GoodsMessage;
import com.service.GoodsMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GoodsMessageServiceImpl implements GoodsMessageService {
    @Autowired
    GoodsMessageMapper goodsMessageMapper;
    @Override
    public List<GoodsMessage> queryMSG(GoodsInfo goodsInfo) {
        List<GoodsMessage> result;
        result= goodsMessageMapper.findMSG(goodsInfo);
        return result;
    }
}
