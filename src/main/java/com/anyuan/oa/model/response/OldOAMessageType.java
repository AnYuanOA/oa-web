package com.anyuan.oa.model.response;

import java.util.List;

/**
 * Created by pengkan on 2018/3/1.
 */
public class OldOAMessageType {
    /**
     * 主类型ID
     */
    private String msgTypeMainID;
    /**
     * 主类型名称
     */
    private String mainTypeName;
    /**
     * 子类型集合
     */
    private List<OldOAMessageSubType> subTypes;
    /**
     * 排序号
     */
    private int sortID;
    /**
     * 未读消息数量
     */
    private int unreadCount;

    public String getMsgTypeMainID() {
        return msgTypeMainID;
    }

    public void setMsgTypeMainID(String msgTypeMainID) {
        this.msgTypeMainID = msgTypeMainID;
    }

    public String getMainTypeName() {
        return mainTypeName;
    }

    public void setMainTypeName(String mainTypeName) {
        this.mainTypeName = mainTypeName;
    }

    public List<OldOAMessageSubType> getSubTypes() {
        return subTypes;
    }

    public void setSubTypes(List<OldOAMessageSubType> subTypes) {
        this.subTypes = subTypes;
    }

    public int getSortID() {
        return sortID;
    }

    public void setSortID(int sortID) {
        this.sortID = sortID;
    }

    public int getUnreadCount() {
        return unreadCount;
    }

    public void setUnreadCount(int unreadCount) {
        this.unreadCount = unreadCount;
    }
}
