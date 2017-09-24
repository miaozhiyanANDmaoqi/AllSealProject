package com.dao;

import com.domain.eneity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    public int insertUser(User user);

    public int updatePwd(User user);

    public int updateUser(User user);

    public User findUserByManyElement(User user);
}
