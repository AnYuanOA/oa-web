package com.anyuan.oa.model.response;

import java.util.List;

/**
 * Created by pengkan on 2018/2/7.
 */
public class OldOAToDoStepInfo {
    private String nextStepID;
    private String nextStepName;
    private String smsFlag;
    private String callFlag;
    private String isMulti;
    private String transactMode;
    private String mes;
    private List<OldOAToDoAcceptUserInfo> acceptUserInfo;
    private int success;

    public String getNextStepID() {
        return nextStepID;
    }

    public void setNextStepID(String nextStepID) {
        this.nextStepID = nextStepID;
    }

    public String getNextStepName() {
        return nextStepName;
    }

    public void setNextStepName(String nextStepName) {
        this.nextStepName = nextStepName;
    }

    public String getSmsFlag() {
        return smsFlag;
    }

    public void setSmsFlag(String smsFlag) {
        this.smsFlag = smsFlag;
    }

    public String getCallFlag() {
        return callFlag;
    }

    public void setCallFlag(String callFlag) {
        this.callFlag = callFlag;
    }

    public String getIsMulti() {
        return isMulti;
    }

    public void setIsMulti(String isMulti) {
        this.isMulti = isMulti;
    }

    public String getTransactMode() {
        return transactMode;
    }

    public void setTransactMode(String transactMode) {
        this.transactMode = transactMode;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public List<OldOAToDoAcceptUserInfo> getAcceptUserInfo() {
        return acceptUserInfo;
    }

    public void setAcceptUserInfo(List<OldOAToDoAcceptUserInfo> acceptUserInfo) {
        this.acceptUserInfo = acceptUserInfo;
    }

    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }
}
