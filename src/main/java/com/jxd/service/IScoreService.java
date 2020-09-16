package com.jxd.service;

import com.jxd.model.Score;

import java.util.List;

public interface IScoreService {

    /**
     * @Description 老师添加评分
     * @params [sId, subjectId, score, appraiser]
     * @return boolean
     **/
    boolean addScore_Teacher(List<Score> list);

    /**
     * @Description 老师编辑评分
     * @params [list]
     * @return boolean
     **/
    boolean editScore_Teacher(List<Score> list);

    /**
     * @Description 通过学号获取该学生的各科成绩
     * @params [sId]
     * @return java.util.List<com.jxd.model.Score>
     **/
    List<Score> getScoreBySId_Teacher(Integer sId);
    /**
     * @Description 根据学号获取各科成绩以及中文名称
     *Param [sId]
     * @return java.util.List<com.jxd.model.Score>
     */
    List<Score> getScoreById_Manage(Integer sId);
}
