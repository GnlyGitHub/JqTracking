package com.jxd.model;

/**
 * @author Liang Yue
 * @description 部门
 * @date 2020/9/10 19:46
 */
public class Dept {
    private Integer deptNo;//部门编号
    private String deptName;//部门名称

    public Dept() {
    }

    public Dept(String deptName) {
        this.deptName = deptName;
    }

    public Dept(Integer deptNo, String deptName) {
        this.deptNo = deptNo;
        this.deptName = deptName;
    }

    public Integer getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(Integer deptNo) {
        this.deptNo = deptNo;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }
}
