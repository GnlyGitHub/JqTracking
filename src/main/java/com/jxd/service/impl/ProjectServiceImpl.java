package com.jxd.service.impl;

import com.jxd.dao.IProjectDao;
import com.jxd.model.Project;
import com.jxd.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 15:17
 */
@Service
public class ProjectServiceImpl implements IProjectService {
    @Autowired
    IProjectDao projectDao;

    @Override
    public List<Project> getAllProject_admin() {
        return projectDao.getAllProject_admin();
    }

    @Override
    public List<Project> getProjectByDeptNo_admin(Integer deptNo) {
        return projectDao.getProjectByDeptNo_admin(deptNo);
    }
}
