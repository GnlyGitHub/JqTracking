package com.jxd.controller;

import com.jxd.model.Class;
import com.jxd.service.IClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:51
 */
@Controller
public class ClassController {
    @Autowired
    IClassService classService;

    @RequestMapping("/studentAppraise")
    public String studentAppraise_Teacher(Model model){
        List<Class> list = classService.getAllSClassBytId_Teacher(1001);
        model.addAttribute("sClasses",list);
        return "studentAppraise";
    }
    @ResponseBody
    @RequestMapping("getAllClass_Manage")
    public List<Class> getAllClass_Manage(){
return classService.getAllClass_Manage();
    }
}
