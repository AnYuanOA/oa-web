package com.anyuan.oa.model;

import java.io.Serializable;

/**
 * @author huyang8
 */
public class User implements Serializable{
    private static final long serialVersionUID = 2287770235148924509L;
    /**
     * 主键
     */
    private int id;

    /**
     * 账号
     */
    private String account;

    /**
     * 密码
     */
    private String password;

    /**
     * 微信openId
     */
    private String openId;

    /**
     * 微信昵称
     */
    private String chatNick;

    /**
     * 用户状态
     */
    private int status;


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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
