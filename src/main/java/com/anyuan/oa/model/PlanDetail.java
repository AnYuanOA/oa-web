package com.anyuan.oa.model;

import java.io.Serializable;

public class PlanDetail implements Serializable{
    private static final long serialVersionUID = 2371266561925530103L;

    /**
     * 重要级别
     */
    private String levelName;

    /**
     * 一级分类
     */
    private String typeName1;

    /**
     * 二级分类
     */
    private String typeName2;

    /**
     * 三级分类
     */
    private String typeName3;

    /**
     * 目标值
     */
    private String target;

    /**
     * 承办部门
     */
    private String deptXg;

    /**
     * 承办人
     */
    private String empXg;

    /**
     * 责任部门
     */
    private String deptZr;

    /**
     * 责任人
     */
    private String empZr;

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    public String getTypeName1() {
        return typeName1;
    }

    public void setTypeName1(String typeName1) {
        this.typeName1 = typeName1;
    }

    public String getTypeName2() {
        return typeName2;
    }

    public void setTypeName2(String typeName2) {
        this.typeName2 = typeName2;
    }

    public String getTypeName3() {
        return typeName3;
    }

    public void setTypeName3(String typeName3) {
        this.typeName3 = typeName3;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getDeptZr() {
        return deptZr;
    }

    public void setDeptZr(String deptZr) {
        this.deptZr = deptZr;
    }

    public String getEmpZr() {
        return empZr;
    }

    public void setEmpZr(String empZr) {
        this.empZr = empZr;
    }

    public String getDeptXg() {
        return deptXg;
    }

    public void setDeptXg(String deptXg) {
        this.deptXg = deptXg;
    }

    public String getEmpXg() {
        return empXg;
    }

    public void setEmpXg(String empXg) {
        this.empXg = empXg;
    }
}
