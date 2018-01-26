package com.anyuan.oa.controller.base;

import com.anyuan.oa.utils.ConstantUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author huyang8
 */
@Controller
@RequestMapping("/access")
public class AccessController extends BaseController {

    @RequestMapping("/noPermission")
    @ResponseBody
    public Map<String, Object> noPermission() {
        return coverErrorMessage(ConstantUtil.NO_PERMISSION);
    }
}
