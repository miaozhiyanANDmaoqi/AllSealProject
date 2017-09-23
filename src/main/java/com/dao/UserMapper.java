package com.dao;

import com.domain.eneity.User;

public interface UserMapper {

    public int insertUser(User user);

    public int updatePwd(User user);

    public User findUserByManyElement(User user);
}
