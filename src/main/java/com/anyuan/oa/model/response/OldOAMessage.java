package com.anyuan.oa.model.response;

/**
 * Created by pengkan on 2018/3/2.
 */
public class OldOAMessage {
    /**
     * "msgID": 1114,
     "msgContent": null,
     "createTime": "2018-01-04",
     "updateTime": "0001-01-01T00:00:00",
     "creatorUserID": "ay0016",
     "creatorUserRealName": "杨迎",
     "creatorUserName": "yangying",
     "msgTitle": "公司主编的两项行业标准正式发布",
     "readScopes": null,
     "stringReadScopes": "",
     "portalMainTypeID": "00000000-0000-0000-0000-000000000000",
     "portalMainTypeName": null,
     "portalSubTypeID": "00000000-0000-0000-0000-000000000000",
     "portalSubTypeName": null,
     "isRead": false,
     */

    private int msgID;
    private String msgContent;
    private String createTime;
    private String updateTime;
    private String creatorUserID;
    private String creatorUserRealName;
    private String creatorUserName;
    private String msgTitle;
    private boolean isRead;

    public int getMsgID() {
        return msgID;
    }

    public void setMsgID(int msgID) {
        this.msgID = msgID;
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getCreatorUserID() {
        return creatorUserID;
    }

    public void setCreatorUserID(String creatorUserID) {
        this.creatorUserID = creatorUserID;
    }

    public String getCreatorUserRealName() {
        return creatorUserRealName;
    }

    public void setCreatorUserRealName(String creatorUserRealName) {
        this.creatorUserRealName = creatorUserRealName;
    }

    public String getCreatorUserName() {
        return creatorUserName;
    }

    public void setCreatorUserName(String creatorUserName) {
        this.creatorUserName = creatorUserName;
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }
}
