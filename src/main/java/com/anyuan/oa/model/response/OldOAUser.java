package com.anyuan.oa.model.response;

import java.util.List;

/**
 * Created by pengkan on 2018/3/2.
 */
public class OldOAUser {
    /**
     * {
     "userName": "pengkan",
     "roleNames": null,
     "roleDisplay": null,
     "permissions": null,
     "companyName": null,
     "webSite": null,
     "userID": "pengkan",
     "cellphone": null,
     "mail": null,
     "userChnName": "pengkan",
     "deptID": "1008",
     "deptName": "外聘专家",
     "dutyID": null,
     "dutyName": null,
     "stationID": "1081",
     "stationName": "外聘专家",
     "stations": [{
     "stationID": "1081",
     "stationName": "外聘专家",
     "isPrime": true
     }],
     "stationString": "1081;",
     "positionID": "1081",
     "positionName": "外聘专家"
     }
     */
    private String userName;
    private String roleNames;
    private String roleDisplay;
    private String permissions;
    private String companyName;
    private String webSite;
    private String userID;
    private String cellphone;
    private String mail;
    private String userChnName;
    private String deptID;
    private String deptName;
    private String dutyID;
    private String dutyName;
    private String stationID;
    private String stationName;
    private String stationString;
    private String positionID;
    private String positionName;
    private List<OldOAUserStation> stations;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRoleNames() {
        return roleNames;
    }

    public void setRoleNames(String roleNames) {
        this.roleNames = roleNames;
    }

    public String getRoleDisplay() {
        return roleDisplay;
    }

    public void setRoleDisplay(String roleDisplay) {
        this.roleDisplay = roleDisplay;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getUserChnName() {
        return userChnName;
    }

    public void setUserChnName(String userChnName) {
        this.userChnName = userChnName;
    }

    public String getDeptID() {
        return deptID;
    }

    public void setDeptID(String deptID) {
        this.deptID = deptID;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDutyID() {
        return dutyID;
    }

    public void setDutyID(String dutyID) {
        this.dutyID = dutyID;
    }

    public String getDutyName() {
        return dutyName;
    }

    public void setDutyName(String dutyName) {
        this.dutyName = dutyName;
    }

    public String getStationID() {
        return stationID;
    }

    public void setStationID(String stationID) {
        this.stationID = stationID;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public String getStationString() {
        return stationString;
    }

    public void setStationString(String stationString) {
        this.stationString = stationString;
    }

    public String getPositionID() {
        return positionID;
    }

    public void setPositionID(String positionID) {
        this.positionID = positionID;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public List<OldOAUserStation> getStations() {
        return stations;
    }

    public void setStations(List<OldOAUserStation> stations) {
        this.stations = stations;
    }
}
