package com.dao;

import com.domain.eneity.User;
import org.springframework.stereotype.Service;

@Service
public interface UserDao {
    public User findUserByAccount(String acc);
}
