package com.jxd.service;

import com.jxd.model.Project;

import java.util.List;

public interface IProjectService {
    /**
     * 获取所有项目
     *
     * @return 所有项目
     */
    List<Project> getAllProject_admin();

    /**
     * 获取某部门下的所有项目
     *
     * @return 某部门下的所有项目
     */
    List<Project> getProjectByDeptNo_admin(Integer deptNo);
}
