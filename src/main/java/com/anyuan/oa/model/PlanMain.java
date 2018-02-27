package com.anyuan.oa.model;

import java.io.Serializable;
import java.util.List;

public class PlanMain implements Serializable{
    private static final long serialVersionUID = 2685770254326567439L;

    /**
     * 主键
     */
    private String op05Id;

    /**
     * 时间
     */
    private String planDate;

    /**
     * 标题
     */
    private String planTitle;

    /**
     * 计划明细
     */
    private List<PlanDetail> planDetails;

    public String getOp05Id() {
        return op05Id;
    }

    public void setOp05Id(String op05Id) {
        this.op05Id = op05Id;
    }

    public String getPlanDate() {
        return planDate;
    }

    public void setPlanDate(String planDate) {
        this.planDate = planDate;
    }

    public String getPlanTitle() {
        return planTitle;
    }

    public void setPlanTitle(String planTitle) {
        this.planTitle = planTitle;
    }

    public List<PlanDetail> getPlanDetails() {
        return planDetails;
    }

    public void setPlanDetails(List<PlanDetail> planDetails) {
        this.planDetails = planDetails;
    }
}
