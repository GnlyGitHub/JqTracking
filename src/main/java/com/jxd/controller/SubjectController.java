package com.jxd.controller;

import com.jxd.model.Subject;
import com.jxd.service.ISubjectService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/adminSubjectList")
    public String adminSubjectList(){
        return "adminSubjectList";
    }

    @RequestMapping("/adminAddSubject")
    public String adminAddSubject(){
        return "adminAddSubject";
    }

    @RequestMapping("/adminEditSubject")
    public String adminEditSubject(){
        return "adminEditSubject";
    }

    @RequestMapping(value = "/getAllSubject_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllSubject_admin(Integer limit, Integer page, String subject){
        List<Subject> list = subjectService.getAllSubject_admin(subject);
        List<Subject> list1 = subjectService.getSubject_admin(limit, page, subject);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    @RequestMapping(value = "/getAllSubjectForChoose_admin")
    @ResponseBody
    public List<Subject> getAllSubjectForChoose_admin(){
        List<Subject> list = subjectService.getAllSubject_admin("");
        return list;
    }

    @RequestMapping("/delSubjectById_admin")
    @ResponseBody
    public String delSubjectById_admin(Integer subjectId){
        boolean isDel = subjectService.delSubject_admin(subjectId);
        return String.valueOf(isDel);
    }

    @RequestMapping("/addSubject_admin")
    @ResponseBody
    public String addSubject_admin(Subject subject){
        boolean isAdd = subjectService.addSubject_admin(subject);
        return String.valueOf(isAdd);
    }

    @RequestMapping("/editSubject_admin")
    @ResponseBody
    public String editSubject_admin(Subject subject){
        boolean isEdit = subjectService.editSubjectById_admin(subject);
        return String.valueOf(isEdit);
    }
}
