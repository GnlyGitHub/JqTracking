package com.jxd.model;

/**
 * @author Liang Yue
 * @description 课程
 * @date 2020/9/10 19:40
 */
public class Subject {
    private Integer subjectId;//编号
    private String subject;//科目

    public Subject(Integer subjectId, String subject) {
        this.subjectId = subjectId;
        this.subject = subject;
    }

    public Subject() {
    }

    public Subject(String subject) {
        this.subject = subject;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
