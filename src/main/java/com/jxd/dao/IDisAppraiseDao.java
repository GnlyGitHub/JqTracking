package com.jxd.dao;

import com.jxd.model.Appraise;
import com.jxd.model.DisAppraise;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IDisAppraiseDao {
    /**
     * @Description 获得评价表根据筛选条件数量
     *Param []
     * @return java.util.List<com.jxd.model.Appraise>
     */
    List<DisAppraise> getAllSizeAppaise_Manage(@Param("mname") String mname,@Param("manageId") Integer manageId);
    /**
     * @Description 获得评价表根据筛选条件每页的数据
     *Param []
     * @return java.util.List<com.jxd.model.Appraise>
     */
    List<DisAppraise> getAllAppaise_Manage(@Param("mname") String mname, @Param("limit") Integer limit, @Param("page") Integer page, @Param("manageId") Integer manageId);
}
