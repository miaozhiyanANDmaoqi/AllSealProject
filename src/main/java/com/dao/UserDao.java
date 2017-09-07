package com.dao;

import com.domain.eneity.User;

public interface UserDao {
    public User findUserByAccount(String acc);
}
