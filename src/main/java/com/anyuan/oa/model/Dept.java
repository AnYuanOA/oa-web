package com.anyuan.oa.model;

import java.io.Serializable;
import java.util.List;

public class Dept implements Serializable {
    private static final long serialVersionUID = 6489464344587910299L;

    /**
     * 部门表主键id
     */
    private String id;

    /**
     * 公司别
     */
    private String companyId;

    /**
     * 部门名称
     */
    private String name;

    /**
     * 父部门id
     */
    private String parentId;

    /**
     * 部门下属部门
     */
    private List<Dept> childDepts;

    /**
     * 部门下属人员
     */
    private List<User> childUsers;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public List<Dept> getChildDepts() {
        return childDepts;
    }

    public void setChildDepts(List<Dept> childDepts) {
        this.childDepts = childDepts;
    }

    public List<User> getChildUsers() {
        return childUsers;
    }

    public void setChildUsers(List<User> childUsers) {
        this.childUsers = childUsers;
    }
}
