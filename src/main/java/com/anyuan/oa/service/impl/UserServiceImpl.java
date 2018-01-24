package com.anyuan.oa.service.impl;

import com.anyuan.oa.dao.UserDao;
import com.anyuan.oa.model.User;
import com.anyuan.oa.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Resource
    private UserDao userDao;

    public List<User> findAllUser() {
        return userDao.findAllUser();
    }

    public User findUserById(int id) {
        return userDao.findUserById(id);
    }

    public User findUserByOpenId(String openId) {
        return userDao.findUserByOpenId(openId);
    }

    public User findUserByAccount(String account) {
        return userDao.findUserByAccount(account);
    }
}
