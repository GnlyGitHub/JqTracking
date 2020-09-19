package com.jxd.service;

import com.jxd.model.DisSubject;
import com.jxd.model.Subject;

import java.util.List;

public interface IDisSubjectService {
    /**
     * 批量插入课程分配
     * @return 是否插入成功
     */
    boolean addBatchDisSubject(List<DisSubject> list);

    /**
     * 根据班期获取选课列表
     * @param classId 班期号
     * @return 选课列表
     */
    List<DisSubject> checkDisSubject_admin(Integer classId);

    /**
     * 批量删除课程分配
     * @param list 要删除的课程分配列表
     * @return 是否删除成功
     */
    boolean delBatchDisSubject(List<DisSubject> list);

    /**
     * 根据班期号删除班期分配
     * @param classId 班期号
     * @return 是否删除成功
     */
    boolean delDisSubjectByClassId(Integer classId);

    /**
     * 根据班期号获取班期分配列表
     * @param subjectId 班期号
     * @return 班期分配列表
     */
    List<DisSubject> getDisSubjectBySubjectId(Integer subjectId);
}
