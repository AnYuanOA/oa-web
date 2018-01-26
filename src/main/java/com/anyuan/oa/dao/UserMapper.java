package com.anyuan.oa.dao;

import com.anyuan.oa.model.User;

import java.util.List;

public interface UserMapper {
    /**
     * 查询所有用户
     * @return
     */
    List<User> findAllUser();

    /**
     * 根据微信openId查询用户
     * @param openId
     * @return
     */
    User findUserByOpenId(String openId);

    /**
     * 根据账号查询用户
     * @param account
     * @return
     */
    User findUserByAccount(String account);

    /**
     * 根据部门deptId查询用户
     * @param deptId
     * @return
     */
    List<User> findUserByDeptId(String deptId);

    /**
     * 绑定时插入用户绑定表
     * @param user
     */
    void insertWeChatUser(User user);
}