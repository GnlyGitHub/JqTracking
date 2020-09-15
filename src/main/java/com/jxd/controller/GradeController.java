package com.jxd.controller;

import com.jxd.service.IGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:52
 */
@Controller
public class GradeController {
    @Autowired
    IGradeService gradeService;
    @RequestMapping("empAppraise_Manage")
    public String empAppraise_Manage(){
        return "empGrade";
    }
}
