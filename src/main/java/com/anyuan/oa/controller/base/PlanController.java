package com.anyuan.oa.controller.base;

import com.anyuan.oa.dao.PlanMapper;
import com.anyuan.oa.model.PlanCollect;
import com.anyuan.oa.model.PlanDetail;
import com.anyuan.oa.model.PlanMain;
import com.anyuan.oa.utils.ConstantUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author huyang8
 */
@Controller
@RequestMapping("/plan")
public class PlanController extends BaseController{

    @Resource
    private PlanMapper planMapper;

    /**
     * 计划汇总数据
     * @return
     */
    @RequestMapping("/reportPlan")
    @ResponseBody
    public Map<String, Object> reportPlan() {
        try {
            Map<String,Object> result=new HashMap<String,Object>();
            List<PlanCollect> list = planMapper.reportPlan();
            if(list!=null&&list.size()>0){
                for(PlanCollect pc:list){
                    if("NJH".equals(pc.getPlanType())){
                        result.put("NJH",pc.getPlanNum());
                    }else if("YJH".equals(pc.getPlanType())){
                        result.put("YJH",pc.getPlanNum());
                    }else if("ZWC".equals(pc.getPlanType())){
                        result.put("ZWC",pc.getPlanNum());
                    }
                }
            }
            result.put("code", ConstantUtil.SUCCESS_CODE);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    /**
     * 年度计划数据
     * @return
     */
    @RequestMapping("/yearPlanData")
    @ResponseBody
    public Map<String, Object> yearPlanData() {
        try {
            List<PlanMain> listMain = planMapper.yearPlanData();
            if(listMain!=null&&listMain.size()>0){
                for(PlanMain planMain:listMain){
                    List<PlanDetail> listDetail=planMapper.yearPlanDetail(planMain.getOp05Id());
                    planMain.setPlanDetails(listDetail);
                }
            }
            return coverSuccessData(listMain);
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }


    /**
     * 月度计划数据
     * @return
     */
    @RequestMapping("/monthPlanData")
    @ResponseBody
    public Map<String, Object> monthPlanData() {
        try {
            List<PlanMain> listMain = planMapper.monthPlanData();
            if(listMain!=null&&listMain.size()>0){
                for(PlanMain planMain:listMain){
                    List<PlanDetail> listDetail=planMapper.monthPlanDetail(planMain.getOp05Id());
                    planMain.setPlanDetails(listDetail);
                }
            }
            return coverSuccessData(listMain);
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }


    /**
     * 周度计划数据
     * @return
     */
    @RequestMapping("/weekPlanData")
    @ResponseBody
    public Map<String, Object> weekPlanData() {
        try {
            List<PlanMain> listMain = planMapper.weekPlanData();
            if(listMain!=null&&listMain.size()>0){
                for(PlanMain planMain:listMain){
                    List<PlanDetail> listDetail=planMapper.weekPlanDetail(planMain.getOp05Id());
                    planMain.setPlanDetails(listDetail);
                }
            }
            return coverSuccessData(listMain);
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }
}
