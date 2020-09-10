package com.jxd.model;

/**
 * @author Liang Yue
 * @description 班期
 * @date 2020/9/10 19:40
 */
public class Class {
    private Integer classId;//期数
    private String className;//班期名
    private String startDate;//开课日期
    private String endDate;//结束日期
    private Integer tId;//老师id

    public Class() {
    }

    public Class(Integer classId, String className, String startDate, String endDate, Integer tId) {
        this.classId = classId;
        this.className = className;
        this.startDate = startDate;
        this.endDate = endDate;
        this.tId = tId;
    }

    public Class(String className, String startDate, String endDate, Integer tId) {
        this.className = className;
        this.startDate = startDate;
        this.endDate = endDate;
        this.tId = tId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }
}
