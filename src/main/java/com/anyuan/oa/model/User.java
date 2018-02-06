package com.anyuan.oa.model;

import java.io.Serializable;

/**
 * @author huyang8
 */
public class User implements Serializable {
    private static final long serialVersionUID = 2287770235148924509L;

    //*******账号信息*******//
    /**
     * 安源OA账号
     */
    private String userName;

    /**
     * 中文名
     */
    private String cName;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 手机
     */
    private String mobile;

    /**
     * 安源OA密码
     */
    private String password;

    /**
     * 用户状态
     */
    private int enabled;

    /**
     * 部门id
     */
    private String deptId;


    //*******账号微信关联表信息*******//
    /**
     * 微信号关联表主键id
     */
    private int id;

    /**
     * 安源OA账号
     */
    private String account;

    /**
     * 微信openId
     */
    private String openId;

    /**
     * 微信昵称
     */
    private String chatNick;

    /**
     * 登录秘钥
     */
    private String wPassword;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getChatNick() {
        return chatNick;
    }

    public void setChatNick(String chatNick) {
        this.chatNick = chatNick;
    }

    public String getwPassword() {
        return wPassword;
    }

    public void setwPassword(String wPassword) {
        this.wPassword = wPassword;
    }
}
