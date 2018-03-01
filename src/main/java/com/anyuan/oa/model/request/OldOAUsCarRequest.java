package com.anyuan.oa.model.request;

import java.io.Serializable;

/**
 * Created by pengkan on 2018/2/9.
 */
public class OldOAUsCarRequest implements Serializable{
    private static final long serialVersionUID = -3140191785613535117L;
    private String appID;
    private int in_sp_id;
    private String applyUserChnName;
    private String applyUserDeptName;
    private String applyUserCellphone;
    private String applyUsingType;
    private int applyUsingTypeID;
    private boolean driverIsOverWork;
    private String overwork;
    private String inCarNums;
    private String carUsingHours;
    private String usingCarTime;
    private String usingCarRange;
    private String dest;
    private String startPoint;
    private String usingReason;
    private String vehiAID;
    private String workflowTitle;
    private boolean isNew;

    public String getAppID() {
        return appID;
    }

    public void setAppID(String appID) {
        this.appID = appID;
    }

    public int getIn_sp_id() {
        return in_sp_id;
    }

    public void setIn_sp_id(int in_sp_id) {
        this.in_sp_id = in_sp_id;
    }

    public String getApplyUserChnName() {
        return applyUserChnName;
    }

    public void setApplyUserChnName(String applyUserChnName) {
        this.applyUserChnName = applyUserChnName;
    }

    public String getApplyUserDeptName() {
        return applyUserDeptName;
    }

    public void setApplyUserDeptName(String applyUserDeptName) {
        this.applyUserDeptName = applyUserDeptName;
    }

    public String getApplyUserCellphone() {
        return applyUserCellphone;
    }

    public void setApplyUserCellphone(String applyUserCellphone) {
        this.applyUserCellphone = applyUserCellphone;
    }

    public String getApplyUsingType() {
        return applyUsingType;
    }

    public void setApplyUsingType(String applyUsingType) {
        this.applyUsingType = applyUsingType;
    }

    public int getApplyUsingTypeID() {
        return applyUsingTypeID;
    }

    public void setApplyUsingTypeID(int applyUsingTypeID) {
        this.applyUsingTypeID = applyUsingTypeID;
    }

    public boolean isDriverIsOverWork() {
        return driverIsOverWork;
    }

    public void setDriverIsOverWork(boolean driverIsOverWork) {
        this.driverIsOverWork = driverIsOverWork;
    }

    public String getOverwork() {
        return overwork;
    }

    public void setOverwork(String overwork) {
        this.overwork = overwork;
    }

    public String getInCarNums() {
        return inCarNums;
    }

    public void setInCarNums(String inCarNums) {
        this.inCarNums = inCarNums;
    }

    public String getCarUsingHours() {
        return carUsingHours;
    }

    public void setCarUsingHours(String carUsingHours) {
        this.carUsingHours = carUsingHours;
    }

    public String getUsingCarTime() {
        return usingCarTime;
    }

    public void setUsingCarTime(String usingCarTime) {
        this.usingCarTime = usingCarTime;
    }

    public String getUsingCarRange() {
        return usingCarRange;
    }

    public void setUsingCarRange(String usingCarRange) {
        this.usingCarRange = usingCarRange;
    }

    public String getDest() {
        return dest;
    }

    public void setDest(String dest) {
        this.dest = dest;
    }

    public String getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(String startPoint) {
        this.startPoint = startPoint;
    }

    public String getUsingReason() {
        return usingReason;
    }

    public void setUsingReason(String usingReason) {
        this.usingReason = usingReason;
    }

    public String getVehiAID() {
        return vehiAID;
    }

    public void setVehiAID(String vehiAID) {
        this.vehiAID = vehiAID;
    }

    public String getWorkflowTitle() {
        return workflowTitle;
    }

    public void setWorkflowTitle(String workflowTitle) {
        this.workflowTitle = workflowTitle;
    }

    public boolean isNew() {
        return isNew;
    }

    public void setNew(boolean aNew) {
        isNew = aNew;
    }
}
