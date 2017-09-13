package com.service;

import com.domain.eneity.User;

public interface UserService {
    public User findUserByAccount(String acc);

    public int registerAccount(User user);
}
