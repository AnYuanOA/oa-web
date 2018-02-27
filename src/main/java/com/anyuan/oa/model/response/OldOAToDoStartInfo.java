package com.anyuan.oa.model.response;

import java.util.List;

/**
 * Created by pengkan on 2018/2/7.
 */
public class OldOAToDoStartInfo {
    private String isAvailability;
    private String httOperationType;
    private String flowVersion;
    private String flowInstanceID;
    private String condition;
    private String groupCode;
    private String httCurUserID;
    private String httAppID;
    private String httAppDName;
    private String appTitle;
    private String httAppTID;
    private String httAppDID;
    private String httAppOID;
    private String isShwoTitle;
    private String mes;
    private int success;
    private List<OldOAAppButton> appButton;

    public String getIsAvailability() {
        return isAvailability;
    }

    public void setIsAvailability(String isAvailability) {
        this.isAvailability = isAvailability;
    }

    public String getHttOperationType() {
        return httOperationType;
    }

    public void setHttOperationType(String httOperationType) {
        this.httOperationType = httOperationType;
    }

    public String getFlowVersion() {
        return flowVersion;
    }

    public void setFlowVersion(String flowVersion) {
        this.flowVersion = flowVersion;
    }

    public String getFlowInstanceID() {
        return flowInstanceID;
    }

    public void setFlowInstanceID(String flowInstanceID) {
        this.flowInstanceID = flowInstanceID;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getHttCurUserID() {
        return httCurUserID;
    }

    public void setHttCurUserID(String httCurUserID) {
        this.httCurUserID = httCurUserID;
    }

    public String getHttAppID() {
        return httAppID;
    }

    public void setHttAppID(String httAppID) {
        this.httAppID = httAppID;
    }

    public String getHttAppDName() {
        return httAppDName;
    }

    public void setHttAppDName(String httAppDName) {
        this.httAppDName = httAppDName;
    }

    public String getAppTitle() {
        return appTitle;
    }

    public void setAppTitle(String appTitle) {
        this.appTitle = appTitle;
    }

    public String getHttAppTID() {
        return httAppTID;
    }

    public void setHttAppTID(String httAppTID) {
        this.httAppTID = httAppTID;
    }

    public String getHttAppDID() {
        return httAppDID;
    }

    public void setHttAppDID(String httAppDID) {
        this.httAppDID = httAppDID;
    }

    public String getHttAppOID() {
        return httAppOID;
    }

    public void setHttAppOID(String httAppOID) {
        this.httAppOID = httAppOID;
    }

    public String getIsShwoTitle() {
        return isShwoTitle;
    }

    public void setIsShwoTitle(String isShwoTitle) {
        this.isShwoTitle = isShwoTitle;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    public List<OldOAAppButton> getAppButton() {
        return appButton;
    }

    public void setAppButton(List<OldOAAppButton> appButton) {
        this.appButton = appButton;
    }
}
