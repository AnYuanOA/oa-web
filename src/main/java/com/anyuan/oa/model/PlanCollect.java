package com.anyuan.oa.model;

import java.io.Serializable;

public class PlanCollect implements Serializable{
    private static final long serialVersionUID = -3260442831986888197L;

    /**
     * 计划类别
     */
    private String planType;

    /**
     * 计划总数量
     */
    private int planNum;

    public String getPlanType() {
        return planType;
    }

    public void setPlanType(String planType) {
        this.planType = planType;
    }

    public int getPlanNum() {
        return planNum;
    }

    public void setPlanNum(int planNum) {
        this.planNum = planNum;
    }
}
