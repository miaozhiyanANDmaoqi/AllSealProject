package com.dao.DaoImpl;

import com.dao.UserDao;
import com.domain.eneity.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao{
    public User findUserByAccount(String acc) {
        return null;
    }
}
