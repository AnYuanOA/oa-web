package com.anyuan.oa.model.response;

/**
 * Created by pengkan on 2018/3/1.
 */
public class OldOAMessageSubType {
    /**
     * 子类型ID
     */
    private String msgSubTypeID;
    /**
     * 子类型名称
     */
    private String subTypeName;
    /**
     * 主类型ID
     */
    private String msgTypeMainID;

    public String getMsgSubTypeID() {
        return msgSubTypeID;
    }

    public void setMsgSubTypeID(String msgSubTypeID) {
        this.msgSubTypeID = msgSubTypeID;
    }

    public String getSubTypeName() {
        return subTypeName;
    }

    public void setSubTypeName(String subTypeName) {
        this.subTypeName = subTypeName;
    }

    public String getMsgTypeMainID() {
        return msgTypeMainID;
    }

    public void setMsgTypeMainID(String msgTypeMainID) {
        this.msgTypeMainID = msgTypeMainID;
    }
}
