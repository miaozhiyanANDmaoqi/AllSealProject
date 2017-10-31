package com.dao;

import com.domain.eneity.GoodsInfo;
import com.domain.eneity.GoodsMessage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMessageMapper {
    /**
     * 查询留言
     * @param goodsInfo
     * @return
     */
    public List<GoodsMessage> findMSG(GoodsInfo goodsInfo);

    /**
     * 添加留言
     * @param goodsMessage
     * @return
     */
    public int insertGoodsMSG(GoodsMessage goodsMessage);
}
