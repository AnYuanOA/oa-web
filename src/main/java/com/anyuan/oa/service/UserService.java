package com.anyuan.oa.service;

import com.anyuan.oa.model.User;

import java.util.List;

public interface UserService {

    /**
     * 查询所以用户
     * @return
     */
    List<User> findAllUser();

    /**
     * 根据主键查询用户
     * @param id
     * @return
     */
    User findUserById(int id);

    /**
     * 根据微信openId查询用户
     * @param openId
     * @return
     */
    User findUserByOpenId(String openId);

    /**
     * 根据账号查询用户
     * @return
     */
    User findUserByAccount(String account);
}
