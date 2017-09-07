package com.dao;

import com.domain.eneity.User;
import org.springframework.stereotype.Service;


public interface UserDao {
    public User findUserByAccount(String acc);
}
