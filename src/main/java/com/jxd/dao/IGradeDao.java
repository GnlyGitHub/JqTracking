package com.jxd.dao;

import com.jxd.model.Grade;
import com.jxd.service.IGradeService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IGradeDao {
    /**
     * @Description 根据员工id和序数得到评价评价
     *Param [sId]
     * @return java.util.List<com.jxd.model.Grade>
     */
    List<Grade> getGradeById_Manage(@Param("sId") Integer sId,@Param("number") Integer number);
}
