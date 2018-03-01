package com.anyuan.oa.model.request;

import java.io.Serializable;

/**
 * Created by pengkan on 2018/2/8.
 */
public class OldOALeaveRequest implements Serializable{
    private static final long serialVersionUID = 4850339960372286599L;
    private String appID;
    private String attL_ID;
    /**
     * 申请者中文名
     */
    private String applyUserChnName;
    /**
     * 请假类型ID
     */
    private int attLT_ID;
    /**
     * 请假类型名称
     */
    private String attLT_Name;
    /**
     * 流程标题
     */
    private String workflowTitle;
    /**
     * 请假开始日期 yyyy-MM-dd
     */
    private String rest_start_date;
    /**
     * 开始类型  上午/下午
     */
    private String startType;
    /**
     * 请假结束日期
     */
    private String rest_end_date;
    /**
     * 结束类型  上午/下午
     */
    private String endType;
    /**
     * 请假原因
     */
    private String attL_Reason;
    private int in_sp_id;
    /**
     * 请假天数  单位：天
     */
    private double rest_day_num;
    /**
     * 是否是新流程  新增为新，更改不为新
     */
    private boolean isNew;

    public String getAppID() {
        return appID;
    }

    public void setAppID(String appID) {
        this.appID = appID;
    }

    public String getAttL_ID() {
        return attL_ID;
    }

    public void setAttL_ID(String attL_ID) {
        this.attL_ID = attL_ID;
    }

    public String getApplyUserChnName() {
        return applyUserChnName;
    }

    public void setApplyUserChnName(String applyUserChnName) {
        this.applyUserChnName = applyUserChnName;
    }

    public int getAttLT_ID() {
        return attLT_ID;
    }

    public void setAttLT_ID(int attLT_ID) {
        this.attLT_ID = attLT_ID;
    }

    public String getAttLT_Name() {
        return attLT_Name;
    }

    public void setAttLT_Name(String attLT_Name) {
        this.attLT_Name = attLT_Name;
    }

    public String getWorkflowTitle() {
        return workflowTitle;
    }

    public void setWorkflowTitle(String workflowTitle) {
        this.workflowTitle = workflowTitle;
    }

    public String getRest_start_date() {
        return rest_start_date;
    }

    public void setRest_start_date(String rest_start_date) {
        this.rest_start_date = rest_start_date;
    }

    public String getStartType() {
        return startType;
    }

    public void setStartType(String startType) {
        this.startType = startType;
    }

    public String getRest_end_date() {
        return rest_end_date;
    }

    public void setRest_end_date(String rest_end_date) {
        this.rest_end_date = rest_end_date;
    }

    public String getEndType() {
        return endType;
    }

    public void setEndType(String endType) {
        this.endType = endType;
    }

    public String getAttL_Reason() {
        return attL_Reason;
    }

    public void setAttL_Reason(String attL_Reason) {
        this.attL_Reason = attL_Reason;
    }

    public int getIn_sp_id() {
        return in_sp_id;
    }

    public void setIn_sp_id(int in_sp_id) {
        this.in_sp_id = in_sp_id;
    }

    public double getRest_day_num() {
        return rest_day_num;
    }

    public void setRest_day_num(double rest_day_num) {
        this.rest_day_num = rest_day_num;
    }

    public boolean isNew() {
        return isNew;
    }

    public void setNew(boolean aNew) {
        isNew = aNew;
    }
}
