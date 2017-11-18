package com.service.impl;

import com.dao.GoodsMessageMapper;
import com.domain.eneity.GoodsInfo;
import com.domain.eneity.GoodsMessage;
import com.domain.po.VoteReq;
import com.service.GoodsMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

import java.util.List;
@Service
@Transactional
public class GoodsMessageServiceImpl implements GoodsMessageService {
    @Autowired
    GoodsMessageMapper goodsMessageMapper;
    @Autowired
    private ShardedJedisPool shardedJedisPool;

    @Override
    public List<GoodsMessage> queryMSG(GoodsInfo goodsInfo) {
        List<GoodsMessage> result;
        result= goodsMessageMapper.findMSG(goodsInfo);
        return result;
    }

    @Override
    public int addMessage(GoodsMessage goodsMessage) {
        return goodsMessageMapper.insertGoodsMSG(goodsMessage);
    }

    @Override
    public String voteForGoods(VoteReq voteReq) {
        String result = null;
        ShardedJedis shardedJedis = shardedJedisPool.getResource();
        //判断是否否该uid的投票信息
        if(!shardedJedis.exists(voteReq.getGid()+"")){
            //如果没有，就设置一下
            shardedJedis.lpush(voteReq.getGid()+"","");
            shardedJedis.expire(voteReq.getGid()+"",24*60*60);//设置生存时间 1天
        }
        List<String> list = shardedJedis.lrange(String.valueOf(voteReq.getGid()),0,-1);//首先获取该所有投了该gid的uid，放入list中
        for(String uid : list){//遍历逐个判断是否已经记录了有该uid记录，若有，则返回repeatVote
            if (uid.equals(  String.valueOf(voteReq.getUid())   )){
                return result = "repeatVote";
            }
        }
        //没有该uid，则可以投票
        Long res = shardedJedis.lpush(  String.valueOf(voteReq.getGid())  ,  String.valueOf(voteReq.getUid())   );//投票后就加入该list中，key为gid
        if(res.equals(0L)){
            result="error!";
        }else{
            result="success";
        }
        return result;
    }
}
