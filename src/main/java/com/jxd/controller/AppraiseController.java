package com.jxd.controller;

import com.jxd.model.Appraise;
import com.jxd.service.IAppraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:51
 */
@Controller
public class AppraiseController {
    @Autowired
    IAppraiseService appraiseService;
    @RequestMapping("getAllAppraise_Manage")
    @ResponseBody
    public List<Appraise> getAllAppraise_Manage(){
        List<Appraise> list=appraiseService.getAllAppraise_Manage();
        return list ;
    }
}
