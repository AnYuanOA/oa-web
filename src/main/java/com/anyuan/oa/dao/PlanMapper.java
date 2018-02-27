package com.anyuan.oa.dao;

import com.anyuan.oa.model.PlanCollect;
import com.anyuan.oa.model.PlanDetail;
import com.anyuan.oa.model.PlanMain;

import java.util.List;

public interface PlanMapper {

    /**
     * 汇总计划
     * @return
     */
    List<PlanCollect> reportPlan();

    /**
     * 年度计划
     * @return
     */
    List<PlanMain> yearPlanData();

    /**
     * 年计划明细
     * @param op05Id
     * @return
     */
    List<PlanDetail> yearPlanDetail(String op05Id);

    /**
     * 月度计划
     * @return
     */
    List<PlanMain> monthPlanData();

    /**
     * 月计划明细
     * @param op05Id
     * @return
     */
    List<PlanDetail> monthPlanDetail(String op05Id);

    /**
     * 周度计划
     * @return
     */
    List<PlanMain> weekPlanData();

    /**
     * 周计划明细
     * @param op05Id
     * @return
     */
    List<PlanDetail> weekPlanDetail(String op05Id);
}
