package com.anyuan.oa.controller;


import com.anyuan.oa.model.User;
import com.anyuan.oa.service.UserService;
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
    private UserService userService;

    @RequestMapping("/showAllUser")
    @ResponseBody
    public Map<String,Object> showAllUser(){
        List<User> list=userService.findAllUser();
        return coverResultMap("users",list);
    }

}
