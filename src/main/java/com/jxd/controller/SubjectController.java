package com.jxd.controller;

import com.jxd.model.Subject;
import com.jxd.service.ISubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:50
 */
@Controller
public class SubjectController {
    @Autowired
    ISubjectService subjectService;

    //老师获取评分项转发至评分页面
    @RequestMapping("/studentAddAppraise")
    public String studentAddAppraise_Teacher(Integer classId,Integer sId,Model model){
        List<Subject> list =  subjectService.getSubjectByClassId_Teacher(classId);
        model.addAttribute("list",list);
        model.addAttribute("sId",sId);
        return "studentAddAppraise";
    }
}
