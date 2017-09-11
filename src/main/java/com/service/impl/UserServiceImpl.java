package com.service.impl;

import com.dao.UserDao;
import com.domain.eneity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
   private UserDao userDao;

    public User findUserByAccount(String acc){
        return userDao.findUserByAccount(acc);
    }

    public int registerAccount(User user) {
        if(userDao.findUserByAccount(user.getAccount())!=null){
            return 1;
        }
        return 0;

    }
}
