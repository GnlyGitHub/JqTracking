package com.jxd.service;

import com.jxd.model.Appraise;
import com.jxd.model.DisAppraise;

import java.util.List;

public interface IDisAppraiseService {
    /**
     * @Description 获得评价表根据筛选条件数量
     *Param []
     * @return java.util.List<com.jxd.model.Appraise>
     */
    List<DisAppraise> getAllSizeAppaise_Manage(String mname,Integer manageId);
    /**
     * @Description 获得评价表根据筛选条件每页的数据
     *Param []
     * @return java.util.List<com.jxd.model.Appraise>
     */
    List<DisAppraise> getAllAppaise_Manage(String mname, Integer limit, Integer page,Integer manageId);
}
