package com.anyuan.oa.controller;


import com.anyuan.oa.dao.UserMapper;
import com.anyuan.oa.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author huyang8
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController{

    @Resource
    private UserMapper userMapper;

    @RequestMapping("/showAllUser")
    @ResponseBody
    public Map<String,Object> showAllUser(){
        List<User> list=userMapper.findAllUser();
        return coverResultMap("users",list);
    }

}
