package com.dao;

import com.domain.eneity.UserInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface UserInfoMapper {
    /**
     * 添加用户信息
     * @param userInfo
     * @return
     */
    public int insertUserInfo(UserInfo userInfo);

    public UserInfo findUserInfo(UserInfo userInfo);

    public int updateUserInfo(UserInfo userInfo);
}
