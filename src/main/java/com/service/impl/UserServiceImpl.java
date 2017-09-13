package com.service.impl;

import com.dao.UserMapper;
import com.domain.eneity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
   private UserMapper userMapper;

    public User findUserByAccount(String acc){
        return userMapper.findUserByAccount(acc);
    }

    public int registerAccount(User user) {
        if(userMapper.findUserByAccount(user.getAccount())!=null){
            return 1;
        }
        return 0;

    }
}
