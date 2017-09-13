package com.dao;

import com.domain.eneity.User;

public interface UserMapper {
    public User findUserByAccount(String acc);

    public int insertUser(User user);

    public User findUserByTel(String tel);
}
