package com.jxd.model;

/**
 * @author Liang Yue
 * @description 老师
 * @date 2020/9/10 19:39
 */
public class Teacher {
    private Integer tId;//工号
    private String tName;//姓名
    private Integer tSex;//性别
    private String tPhone;//手机号
    private String tBirthday;//生日
    private Integer deptNo;//部门编号

    public Teacher() {
    }

    public Teacher(Integer tId, String tName, Integer tSex, String tPhone, String tBirthday, Integer deptNo) {
        this.tId = tId;
        this.tName = tName;
        this.tSex = tSex;
        this.tPhone = tPhone;
        this.tBirthday = tBirthday;
        this.deptNo = deptNo;
    }

    public Teacher(String tName, Integer tSex, String tPhone, String tBirthday, Integer deptNo) {
        this.tName = tName;
        this.tSex = tSex;
        this.tPhone = tPhone;
        this.tBirthday = tBirthday;
        this.deptNo = deptNo;
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public Integer gettSex() {
        return tSex;
    }

    public void settSex(Integer tSex) {
        this.tSex = tSex;
    }

    public String gettPhone() {
        return tPhone;
    }

    public void settPhone(String tPhone) {
        this.tPhone = tPhone;
    }

    public String gettBirthday() {
        return tBirthday;
    }

    public void settBirthday(String tBirthday) {
        this.tBirthday = tBirthday;
    }

    public Integer getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(Integer deptNo) {
        this.deptNo = deptNo;
    }
}
