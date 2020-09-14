package com.jxd.dao;

import com.jxd.model.Subject;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:02
 */
public interface ISubjectDao {

    /**
     * @Description 老师获取科目评价项
     * @params [classId]
     * @return java.util.List<com.jxd.model.Subject>
     **/
    List<Subject> getSubjectByClassId_Teacher(Integer classId);
}
