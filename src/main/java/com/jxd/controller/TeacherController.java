package com.jxd.controller;

import com.jxd.model.LoginUser;
import com.jxd.model.Teacher;
import com.jxd.service.ILoginUserService;
import com.jxd.service.ITeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:49
 */
@Controller
public class TeacherController {
    @Autowired
    ITeacherService teacherService;
    @Autowired
    ILoginUserService loginUserService;

    @RequestMapping("/adminTeacherList")
    public String adminTeacherList(){
        return "adminTeacherList";
    }

    @RequestMapping("/adminAddTeacher")
    public String adminAddTeacher(){
        return "adminAddTeacher";
    }

    @RequestMapping("/adminEditTeacher")
    public String adminEditTeacher(){
        return "adminEditTeacher";
    }

    @RequestMapping("/adminRePwdTeacher")
    public String adminRePwdTeacher(){
        return "adminRePwdTeacher";
    }

    @RequestMapping(value = "/getAllTeacher_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllTeacher_admin(Integer limit, Integer page, String tName){
        List<Teacher> list = teacherService.getAllTeacher_admin(tName);
        List<Teacher> list1 = teacherService.getTeacher_admin(limit,page,tName);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }

    @RequestMapping(value = "/addTeacher_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addTeacher_admin(Teacher teacher){
        boolean isAdd = teacherService.addTeacher_admin(teacher);
        Integer tId = teacherService.getCurTeacherId_admin();
        LoginUser loginUser = new LoginUser(tId, 2);
        boolean isAddLogin = loginUserService.addLoginUser_admin(loginUser);
        return String.valueOf(isAdd && isAddLogin);
    }

    @RequestMapping("/delTeacherById_admin")
    @ResponseBody
    public String delTeacherById_admin(Integer tId){
        boolean isDel = teacherService.delTeacherById_admin(tId);
        boolean isDelLogin = loginUserService.delLoginUser_admin(tId);
        return String.valueOf(isDel && isDelLogin);
    }

    @RequestMapping("/getTeacherById_admin")
    @ResponseBody
    public Teacher getTeacherById_admin(Integer tId){
        Teacher teacher = teacherService.getTeacherById_admin(tId);
        return teacher;
    }

    @RequestMapping(value = "/editTeacher_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String editTeacher_admin(Teacher teacher){
        boolean isEdit = teacherService.editTeacherById_admin(teacher);
        return String.valueOf(isEdit);
    }

    @RequestMapping(value = "/rePwdTeacher_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String rePwdTeacher_admin(LoginUser loginUser){
        boolean isRe = loginUserService.editLoginUser_admin(loginUser);
        return String.valueOf(isRe);
    }

    @RequestMapping(value = "/getAllTeacherForChoose_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllTeacherForChoose_admin(){
        List<Teacher> list = teacherService.getAllTeacher_admin("");
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }

    @RequestMapping("/addClass_admin")
    @ResponseBody
    public String addClass_admin(){
        return "";
    }
}
