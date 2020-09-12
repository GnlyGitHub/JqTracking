package com.jxd.model;

/**
 * @author Liang Yue
 * @description 项目
 * @date 2020/9/12 15:11
 */
public class Project {
    private Integer projectId;//项目编号
    private String projectName;//项目名
    private Integer deptNo;//部门号

    public Project() {
    }

    public Project(Integer projectId, String projectName, Integer deptNo) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.deptNo = deptNo;
    }

    public Project(String projectName, Integer deptNo) {
        this.projectName = projectName;
        this.deptNo = deptNo;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Integer getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(Integer deptNo) {
        this.deptNo = deptNo;
    }
}
