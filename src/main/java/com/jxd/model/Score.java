package com.jxd.model;


/**
 * @author Liang Yue
 * @description 培训成绩
 * @date 2020/9/10 19:45
 */
public class Score {
    private Integer id;//编号
    private Integer sId;//学生id
    private Integer subjectId;//课程id
    private String score;//成绩
    private String appraiser;//评价人
    private String subject;//课程

    public Score() {
    }

    public Score(Integer sId, Integer subjectId, String score, String appraiser, String subject) {
        this.sId = sId;
        this.subjectId = subjectId;
        this.score = score;
        this.appraiser = appraiser;
        this.subject = subject;
    }

    public Score(Integer id, Integer sId, Integer subjectId, String score, String appraiser) {
        this.id = id;
        this.sId = sId;
        this.subjectId = subjectId;
        this.score = score;
        this.appraiser = appraiser;
    }

    public Score(Integer sId, Integer subjectId, String score, String appraiser) {
        this.sId = sId;
        this.subjectId = subjectId;
        this.score = score;
        this.appraiser = appraiser;
    }

    public Score(Integer id, Integer sId, Integer subjectId, String score) {
        this.id = id;
        this.sId = sId;
        this.subjectId = subjectId;
        this.score = score;
    }

    public Score(Integer sId, Integer subjectId, String score) {
        this.sId = sId;
        this.subjectId = subjectId;
        this.score = score;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
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

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }
}
