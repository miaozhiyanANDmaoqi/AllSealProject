package com.dao;

import com.domain.eneity.GoodsInfo;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface GoodsMapper {
    public List<GoodsInfo> listGoods(GoodsInfo goodsInfo);
}
