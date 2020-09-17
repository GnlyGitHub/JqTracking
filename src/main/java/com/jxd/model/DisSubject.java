package com.jxd.model;

import java.util.List;

/**
 * @author Liang Yue
 * @description 课程分配
 * @date 2020/9/10 19:40
 */
public class DisSubject {
    private Integer id;//编号
    private Integer subjectId;//课程id
    private Integer classId;//班期id
    public DisSubject() {
    }

    public DisSubject(Integer id, Integer subjectId, Integer classId) {
        this.id = id;
        this.subjectId = subjectId;
        this.classId = classId;
    }

    public DisSubject(Integer id) {
        this.id = id;
    }

    public DisSubject(Integer subjectId, Integer classId) {
        this.subjectId = subjectId;
        this.classId = classId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}
