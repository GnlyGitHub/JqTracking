package com.jxd.model;

/**
 * @author Liang Yue
 * @description 学生类
 * @date 2020/9/10 19:39
 */
public class Student {
    private Integer sId;//工号
    private String sName;//姓名
    private Integer sSex;//性别
    private String sNation;//民族
    private String sBirthday;//生日
    private String sPlace;//籍贯
    private Integer sMarry;//婚否
    private String sPhone;//手机号
    private String sIdCard;//身份证
    private String sSchool;//学校
    private String sMajor;//专业
    private String sPhoto;//照片
    private String sRemarks;//备注
    private Integer sClass;//班期
    private Integer deptNo;//部门编号
    private Integer jobId;//职务
    private String sHireDate;//入职日期

    public Student() {
    }

    public Student(Integer sId, String sName, Integer sSex, String sNation, String sBirthday, String sPlace, Integer sMarry, String sPhone, String sIdCard, String sSchool, String sMajor, String sPhoto, String sRemarks, Integer sClass, Integer deptNo, Integer jobId, String sHireDate) {
        this.sId = sId;
        this.sName = sName;
        this.sSex = sSex;
        this.sNation = sNation;
        this.sBirthday = sBirthday;
        this.sPlace = sPlace;
        this.sMarry = sMarry;
        this.sPhone = sPhone;
        this.sIdCard = sIdCard;
        this.sSchool = sSchool;
        this.sMajor = sMajor;
        this.sPhoto = sPhoto;
        this.sRemarks = sRemarks;
        this.sClass = sClass;
        this.deptNo = deptNo;
        this.jobId = jobId;
        this.sHireDate = sHireDate;
    }

    public Student(String sName, Integer sSex, String sNation, String sBirthday, String sPlace, Integer sMarry, String sPhone, String sIdCard, String sSchool, String sMajor, String sPhoto, String sRemarks, Integer sClass, Integer deptNo, Integer jobId, String sHireDate) {
        this.sName = sName;
        this.sSex = sSex;
        this.sNation = sNation;
        this.sBirthday = sBirthday;
        this.sPlace = sPlace;
        this.sMarry = sMarry;
        this.sPhone = sPhone;
        this.sIdCard = sIdCard;
        this.sSchool = sSchool;
        this.sMajor = sMajor;
        this.sPhoto = sPhoto;
        this.sRemarks = sRemarks;
        this.sClass = sClass;
        this.deptNo = deptNo;
        this.jobId = jobId;
        this.sHireDate = sHireDate;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public Integer getsClass() {
        return sClass;
    }

    public void setsClass(Integer sClass) {
        this.sClass = sClass;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public Integer getsSex() {
        return sSex;
    }

    public void setsSex(Integer sSex) {
        this.sSex = sSex;
    }

    public String getsNation() {
        return sNation;
    }

    public void setsNation(String sNation) {
        this.sNation = sNation;
    }

    public String getsBirthday() {
        return sBirthday;
    }

    public void setsBirthday(String sBirthday) {
        this.sBirthday = sBirthday;
    }

    public String getsPlace() {
        return sPlace;
    }

    public void setsPlace(String sPlace) {
        this.sPlace = sPlace;
    }

    public Integer getsMarry() {
        return sMarry;
    }

    public void setsMarry(Integer sMarry) {
        this.sMarry = sMarry;
    }

    public String getsPhone() {
        return sPhone;
    }

    public void setsPhone(String sPhone) {
        this.sPhone = sPhone;
    }

    public String getsIdCard() {
        return sIdCard;
    }

    public void setsIdCard(String sIdCard) {
        this.sIdCard = sIdCard;
    }

    public String getsSchool() {
        return sSchool;
    }

    public void setsSchool(String sSchool) {
        this.sSchool = sSchool;
    }

    public String getsMajor() {
        return sMajor;
    }

    public void setsMajor(String sMajor) {
        this.sMajor = sMajor;
    }

    public String getsPhoto() {
        return sPhoto;
    }

    public void setsPhoto(String sPhoto) {
        this.sPhoto = sPhoto;
    }

    public String getsRemarks() {
        return sRemarks;
    }

    public void setsRemarks(String sRemarks) {
        this.sRemarks = sRemarks;
    }

    public Integer getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(Integer deptNo) {
        this.deptNo = deptNo;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getsHireDate() {
        return sHireDate;
    }

    public void setsHireDate(String sHireDate) {
        this.sHireDate = sHireDate;
    }
}
