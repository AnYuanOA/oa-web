package com.anyuan.oa.controller;

import com.anyuan.oa.controller.base.BaseController;
import com.anyuan.oa.model.User;
import com.anyuan.oa.service.OpenFireService;
import com.anyuan.oa.utils.ConstantUtil;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author huyang8
 */
@Controller
@RequestMapping("/group")
public class GroupController extends BaseController{

    @RequestMapping("/findGroup")
    @ResponseBody
    public Map<String,Object> findGroup(String groupName){
        if(StringUtils.isEmpty(groupName)){
            return coverErrorMessage(ConstantUtil.REQUEST_PARAM_ERROR);
        }
        try {
            boolean isExist=OpenFireService.findGroup(groupName);
            if(isExist){
                return coverSuccessData("群组存在");
            }else{
                return coverErrorMessage("群组不存在");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }


    @RequestMapping("/createGroup")
    @ResponseBody
    public Map<String,Object> createGroup(String groupName){
        if(StringUtils.isEmpty(groupName)){
            return coverErrorMessage(ConstantUtil.REQUEST_PARAM_ERROR);
        }
        try {
            OpenFireService.createGroup(groupName);
            return coverSuccessData("创建群组成功");
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    @RequestMapping("/addUserToGroup")
    @ResponseBody
    public Map<String,Object> addUserToGroup(User user,String groupName){
        if(StringUtils.isEmpty(groupName)){
            return coverErrorMessage(ConstantUtil.REQUEST_PARAM_ERROR);
        }
        try {
            OpenFireService.addUserToGroup(user,groupName);
            return coverSuccessData("添加组成员成功");
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    @RequestMapping("/deleteUserFromGroup")
    @ResponseBody
    public Map<String,Object> deleteUserFromGroup(User user,String groupName){
        if(StringUtils.isEmpty(groupName)){
            return coverErrorMessage(ConstantUtil.REQUEST_PARAM_ERROR);
        }
        try {
            OpenFireService.deleteUserFromGroup(user,groupName);
            return coverSuccessData("删除组成员成功");
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    @RequestMapping("/deleteGroup")
    @ResponseBody
    public Map<String,Object> deleteGroup(String groupName){
        if(StringUtils.isEmpty(groupName)){
            return coverErrorMessage(ConstantUtil.REQUEST_PARAM_ERROR);
        }
        try {
            OpenFireService.deleteGroup(groupName);
            return coverSuccessData("删除群组成功");
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }
}
