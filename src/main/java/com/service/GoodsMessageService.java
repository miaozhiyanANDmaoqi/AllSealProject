package com.service;

import com.domain.eneity.GoodsInfo;
import com.domain.eneity.GoodsMessage;
import com.domain.po.VoteReq;

import java.util.List;

public interface GoodsMessageService {
    /**
     * 通过gid查找所有留言
     */
    public List<GoodsMessage> queryMSG(GoodsInfo goodsInfo);

    /**
     * 添加留言
     */
    public int addMessage(GoodsMessage goodsMessage);

    /**
     * 投票接口
     * @return
     */
    public String voteForGoods(VoteReq voteReq);
}
