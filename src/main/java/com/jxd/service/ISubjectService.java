package com.jxd.service;

import com.jxd.model.Subject;

import java.util.List;

public interface ISubjectService {

    /**
     * @Description 老师获取科目评价项
     * @params [classId]
     * @return java.util.List<com.jxd.model.Subject>
     **/
    List<Subject> getSubjectByClassId_Teacher(Integer classId);
}
