package com.service;

import com.domain.eneity.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {
    public User findUserByAccount(String acc);

    public int registerAccount(User user);

    public int loginCheck(User user, HttpServletRequest request);

    public int signInCheck(User user);

    public void logout(HttpServletRequest request, HttpServletResponse response);

    public void updatePwd(User user);
}
