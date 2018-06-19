package com.anyuan.oa.utils;

import com.anyuan.oa.model.DictionVO;
import com.anyuan.oa.model.plan.PlanVo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PlanParamFillUtil {

    public static Map<String, String> getMapDiction(List<DictionVO> list) {
        Map<String, String> map = new HashMap<>();
        if (list != null && list.size() > 0) {
            for (DictionVO diction : list) {
                map.put(diction.getKey(), diction.getValue());
            }
        }
        return map;
    }

    public static List<PlanVo> transParamFromKey(List<PlanVo> list, Map<String, String> dic_op_map, Map<String, String> dic_level_map, Map<String, String> dic_statusAudit_map) {
        if (list != null && list.size() > 0) {
            for (PlanVo plan : list) {
                plan.setOpNoName(dic_op_map.get(plan.getOpNo()));
                plan.setLevelName(dic_level_map.get(plan.getLevel()));
                plan.setStatusAuditName(dic_statusAudit_map.get(plan.getStatusAudit()));
            }
        }
        return list;
    }
}
