package com.anyuan.oa.controller;

import com.anyuan.oa.controller.base.BaseController;
import com.anyuan.oa.dao.DeptMapper;
import com.anyuan.oa.dao.UserMapper;
import com.anyuan.oa.model.Dept;
import com.anyuan.oa.model.User;
import com.anyuan.oa.utils.ConstantUtil;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author huyang8
 */
@Controller
@RequestMapping("/dept")
public class DeptController extends BaseController {

    @Resource
    private DeptMapper deptMapper;

    @Resource
    private UserMapper userMapper;

    @RequestMapping("/showAllDept")
    @ResponseBody
    public Map<String, Object> showAllUser(@RequestParam(value = "key", required = false) String key) {
        try {
            if (StringUtils.isEmpty(key)) {
                List<Dept> list = deptMapper.findAllParentDept();
                if (list != null && !list.isEmpty()) {
                    for (Dept dept : list) {
                        recurDept(dept);
                    }
                }
                return coverSuccessData(list);
            } else {
                List<Dept> childList = deptMapper.findChildDeptdByParentId(key);
                if (childList != null && !childList.isEmpty()) {
                    for (Dept dept : childList) {
                        recurDept(dept);
                    }
                }
                return coverSuccessData(childList);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    /**
     * 递归部门树
     *
     * @param dept
     */
    private void recurDept(Dept dept) {
        List<Dept> childs = deptMapper.findChildDeptdByParentId(dept.getId());
        List<User> users = userMapper.findUserByDeptId(dept.getId());
        dept.setChildUsers(users);
        if (childs != null && !childs.isEmpty()) {
            dept.setChildDepts(childs);
            for (Dept child : childs) {
                recurDept(child);
            }
        }
    }
}
