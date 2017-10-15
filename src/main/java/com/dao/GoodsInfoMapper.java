package com.dao;

import com.domain.eneity.GoodsInfo;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface GoodsInfoMapper {
    public List<GoodsInfo> listGoods(GoodsInfo goodsInfo);

    public int insertGoods(GoodsInfo goodsInfo);
}
