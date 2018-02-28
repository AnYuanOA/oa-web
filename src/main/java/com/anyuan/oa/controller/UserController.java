package com.anyuan.oa.controller;


import com.anyuan.oa.controller.base.BaseController;
import com.anyuan.oa.dao.UserMapper;
import com.anyuan.oa.model.User;
import com.anyuan.oa.utils.ConstantUtil;
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
public class UserController extends BaseController {

    @Resource
    private UserMapper userMapper;

    @RequestMapping("/showAllUser")
    @ResponseBody
    public Map<String, Object> showAllUser() {
        try {
            List<User> list = userMapper.findAllUser();
            return coverSuccessData(list);
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    @RequestMapping("/getSelfUser")
    @ResponseBody
    public Map<String,Object> getSelfUser(User user){
        try {
            User selfUser=userMapper.findUserByOpenId(user.getOpenId());
            return coverSuccessData(selfUser);
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }
}
