package com.jxd.model;

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

    public DisAppraise() {
    }

    public DisAppraise(Integer id, Integer appraiseId, Integer classId, Integer mId) {
        this.id = id;
        this.appraiseId = appraiseId;
        this.classId = classId;
        this.mId = mId;
    }

    public DisAppraise(Integer appraiseId, Integer classId, Integer mId) {
        this.appraiseId = appraiseId;
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
}
