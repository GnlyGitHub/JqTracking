package com.jxd.model;

/**
 * @author Liang Yue
 * @description 工作评价
 * @date 2020/9/10 19:45
 */
public class Grade {
    private Integer id;//编号
    private Integer sId;//学生id
    private Integer appraiseId;//评价分项id
    private String grade;//评价
    private Integer number;//评价序数 转正0 一年1 两年2 三年3
    private String appraiser;

    public Grade() {
    }

    public Grade(Integer sId, Integer appraiseId, String grade, Integer number, String appraiser) {
        this.sId = sId;
        this.appraiseId = appraiseId;
        this.grade = grade;
        this.number = number;
        this.appraiser = appraiser;
    }

    public Grade(Integer id, Integer sId, Integer appraiseId, String grade, Integer number) {
        this.id = id;
        this.sId = sId;
        this.appraiseId = appraiseId;
        this.grade = grade;
        this.number = number;
    }

    public Grade(Integer sId, Integer appraiseId, String grade, Integer number) {
        this.sId = sId;
        this.appraiseId = appraiseId;
        this.grade = grade;
        this.number = number;
    }

    public String getAppraiser() {
        return appraiser;
    }

    public void setAppraiser(String appraiser) {
        this.appraiser = appraiser;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Integer getAppraiseId() {
        return appraiseId;
    }

    public void setAppraiseId(Integer appraiseId) {
        this.appraiseId = appraiseId;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}
