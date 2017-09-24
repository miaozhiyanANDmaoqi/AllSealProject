package com.dao;

import com.domain.eneity.UserInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface UserInfoMapper {
    public int insertUserInfo(UserInfo userInfo);

    public UserInfo findUserInfo(UserInfo userInfo);
}
