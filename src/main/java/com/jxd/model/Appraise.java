package com.jxd.model;

/**
 * @author Liang Yue
 * @description 评价分项
 * @date 2020/9/10 19:45
 */
public class Appraise {
    private Integer appraiseId;//编号
    private String appraise;//评价分项

    public Appraise() {
    }

    public Appraise(Integer appraiseId, String appraise) {
        this.appraiseId = appraiseId;
        this.appraise = appraise;
    }

    public Appraise(String appraise) {
        this.appraise = appraise;
    }

    public Integer getAppraiseId() {
        return appraiseId;
    }

    public void setAppraiseId(Integer appraiseId) {
        this.appraiseId = appraiseId;
    }

    public String getAppraise() {
        return appraise;
    }

    public void setAppraise(String appraise) {
        this.appraise = appraise;
    }
}
