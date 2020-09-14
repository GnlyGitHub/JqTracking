package com.jxd.dao;

import com.jxd.model.Appraise;

import java.util.List;

public interface IAppraiseDao {
    /**
     * @Description 得到所有的评分项
     *Param []
     * @return java.util.List<com.jxd.model.Appraise>
     */
    List<Appraise> getAllAppraise_Manage();
}
