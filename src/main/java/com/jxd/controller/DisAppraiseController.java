package com.jxd.controller;

import com.jxd.service.IDisAppraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 16:09
 */
@Controller
public class DisAppraiseController {
    @Autowired
    IDisAppraiseService disAppraiseService;
    @RequestMapping("/makeAppraise_Manage")
    public String makeAppraise_Manage(){
        return "empMakeAppraise";
    }
}
