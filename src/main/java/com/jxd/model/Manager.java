package com.jxd.model;

/**
 * @author Liang Yue
 * @description 项目经理
 * @date 2020/9/10 19:39
 */
public class Manager {
    private Integer mId;//工号
    private String mName;//姓名
    private Integer mSex;//性别
    private String mPhone;//手机号
    private String mBirthday;//生日
    private Integer deptNo;//部门编号

    public Manager() {
    }

    public Manager(Integer mId, String mName, Integer mSex, String mPhone, String mBirthday, Integer deptNo) {
        this.mId = mId;
        this.mName = mName;
        this.mSex = mSex;
        this.mPhone = mPhone;
        this.mBirthday = mBirthday;
        this.deptNo = deptNo;
    }

    public Manager(String mName, Integer mSex, String mPhone, String mBirthday, Integer deptNo) {
        this.mName = mName;
        this.mSex = mSex;
        this.mPhone = mPhone;
        this.mBirthday = mBirthday;
        this.deptNo = deptNo;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public Integer getmSex() {
        return mSex;
    }

    public void setmSex(Integer mSex) {
        this.mSex = mSex;
    }

    public String getmPhone() {
        return mPhone;
    }

    public void setmPhone(String mPhone) {
        this.mPhone = mPhone;
    }

    public String getmBirthday() {
        return mBirthday;
    }

    public void setmBirthday(String mBirthday) {
        this.mBirthday = mBirthday;
    }

    public Integer getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(Integer deptNo) {
        this.deptNo = deptNo;
    }
}
