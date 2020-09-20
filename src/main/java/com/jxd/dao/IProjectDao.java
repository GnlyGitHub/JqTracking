package com.jxd.dao;

import com.jxd.model.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IProjectDao {
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
    List<Project> getProjectByDeptNo_admin(@Param("deptNo") Integer deptNo);
}
