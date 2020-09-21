package com.jxd.dao;

import com.jxd.model.Job;

import java.util.List;

public interface IJobDao {
    /**
     * 根据部门编号获取职务
     *
     * @param deptNo 部门编号
     * @return 职务列表
     */
    List<Job> getAllJobByDeptNo_admin(Integer deptNo);
}
