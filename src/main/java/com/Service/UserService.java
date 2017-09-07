package com.Service;

import com.dao.UserDao;
import com.domain.eneity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
   private UserDao userDao;

    public User findUserByAccount(String acc){
        return userDao.findUserByAccount(acc);
    }
}
