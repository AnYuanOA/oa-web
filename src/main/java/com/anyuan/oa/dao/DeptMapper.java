package com.anyuan.oa.dao;

import com.anyuan.oa.model.Dept;

import java.util.List;

public interface DeptMapper {

    /**
     * 查询所有根节点部门
     * @return
     */
    List<Dept> findAllParentDept();

    /**
     * 根据部门ID查询
     * @param id
     * @return
     */
    Dept findDeptById(String id);

    /**
     * 根据父部门ID查询下属部门
     * @param parentId
     * @return
     */
    List<Dept> findChildDeptdByParentId(String parentId);
}
