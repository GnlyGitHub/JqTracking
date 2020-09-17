package com.jxd.model;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 16:01
 */
public class DisAppraise {
    private Integer id;//编号
    private Integer appraiseId;//评价分项id
    private Integer classId;//班期id
    private Integer mId;//项目经理id
    private Integer number;
    private Class aClass;
    private String appraise;
    private List<Appraise> appraises;

    public Class getaClass() {
        return aClass;
    }

    public void setaClass(Class aClass) {
        this.aClass = aClass;
    }

    public DisAppraise(Integer id, Integer appraiseId, Integer classId, Integer mId, Integer number, String appraise) {
        this.id = id;
        this.appraiseId = appraiseId;
        this.classId = classId;
        this.mId = mId;
        this.number = number;
        this.appraise = appraise;
    }

    public String getAppraise() {
        return appraise;
    }

    public void setAppraise(String appraise) {
        this.appraise = appraise;
    }

    public List<Appraise> getAppraises() {
        return appraises;
    }

    public DisAppraise(Integer appraiseId, Integer classId, Integer mId, Integer number) {
        this.appraiseId = appraiseId;
        this.classId = classId;
        this.mId = mId;
        this.number = number;
    }

    public void setAppraises(List<Appraise> appraises) {
        this.appraises = appraises;
    }

    public DisAppraise(Integer appraiseId, Integer classId, Integer mId, Integer number, Class aClass, List<Appraise> appraises) {
        this.appraiseId = appraiseId;
        this.classId = classId;
        this.mId = mId;
        this.number = number;
        this.aClass = aClass;
        this.appraises = appraises;
    }

    public DisAppraise(Integer id, Integer appraiseId, Integer classId, Integer mId, Integer number, Class aClass) {
        this.id = id;
        this.appraiseId = appraiseId;
        this.classId = classId;
        this.mId = mId;
        this.number = number;
        this.aClass = aClass;
    }

    public DisAppraise(Integer appraiseId, Integer classId, Integer mId, Integer number, Class aClass) {
        this.appraiseId = appraiseId;
        this.classId = classId;
        this.mId = mId;
        this.number = number;
        this.aClass = aClass;
    }

    public DisAppraise(Integer id, Integer appraiseId, Integer classId, Integer mId, Integer number, Class aClass, List<Appraise> appraises) {
        this.id = id;
        this.appraiseId = appraiseId;
        this.classId = classId;
        this.mId = mId;
        this.number = number;
        this.aClass = aClass;
        this.appraises = appraises;
    }

    public DisAppraise() {
    }

    public DisAppraise(Integer id, Integer appraiseId, Integer classId, Integer mId, Integer number) {
        this.id = id;
        this.appraiseId = appraiseId;
        this.classId = classId;
        this.mId = mId;
        this.number = number;
    }

    public DisAppraise(Integer number, Integer classId, Integer mId) {
        this.number = number;
        this.classId = classId;
        this.mId = mId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAppraiseId() {
        return appraiseId;
    }

    public void setAppraiseId(Integer appraiseId) {
        this.appraiseId = appraiseId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}
