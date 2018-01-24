package com.anyuan.oa.dao;

import com.anyuan.oa.model.User;

import java.util.List;

/**
 * @author huyang8
 */
public interface UserDao {

    List<User> findAllUser();

    User findUserById(int id);

    User findUserByOpenId(String openId);

    User findUserByAccount(String account);
}
