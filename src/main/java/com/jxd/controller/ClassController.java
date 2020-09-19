package com.jxd.controller;

import com.jxd.model.*;
import com.jxd.model.Class;
import com.jxd.service.IClassService;
import com.jxd.service.IDisSubjectService;
import com.jxd.service.IStudentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
    @Autowired
    IDisSubjectService disSubjectService;
    @Autowired
    IStudentService studentService;

    @RequestMapping("/adminClassList")
    public String adminClassList(){
        return "adminClassList";
    }

    @RequestMapping("/adminAddClass")
    public String adminAddClass(){
        return "adminAddClass";
    }

    @RequestMapping("/adminEditClass")
    public String adminEditClass(){
        return "adminEditClass";
    }

    //老师获取班级列表并转发到老师评价主页面
    @RequestMapping("/studentAppraise")
    public String studentAppraise_Teacher(Model model,HttpSession session){
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        Integer tId = loginUser.getUserId();
        List<Class> list = classService.getAllSClassBytId_Teacher(tId);
        model.addAttribute("sClasses",list);
        return "studentAppraise";
    }
    @ResponseBody
    @RequestMapping("getAllClass_Manage")
    public List<Class> getAllClass_Manage(){
return classService.getAllClass_Manage();
    }

    @RequestMapping(value = "/getAllClass_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllClass_admin(){
        List<Class> list = classService.getAllClass_admin();
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }

    @RequestMapping(value = "/getAllClasses_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllClasses_admin(Integer limit, Integer page, String className){
        List<Class> list = classService.getAllClasses_admin(className);
        List<Class> list1 = classService.getClasses_admin(limit, page, className);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    @RequestMapping("/delClassById_admin")
    @ResponseBody
    public String delClassById_admin(Integer classId) {
        String curTime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间
        Class aClass = classService.getClassById_admin(classId);
        String startDate = aClass.getStartDate();
        DateFormat df = DateFormat.getDateInstance();
        long time1 = 0;
        long time2 = 0;
        try {
            //把字符串转化为时间
            time1 = df.parse(curTime).getTime();
            time2 = df.parse(startDate).getTime();
        } catch (ParseException e){
            e.printStackTrace();
        }
        List<Student> list = studentService.getStudentByClassId_admin(classId);
        if (list.size() > 0) {
            return "1";//该班期有学生
        } else if (time1 > time2) {
            return "2";//该班期已开课
        } else {
            boolean isDelDisClass = disSubjectService.delDisSubjectByClassId(classId);
            boolean isDelClass = classService.delClass_admin(classId);
            return String.valueOf(isDelClass && isDelDisClass);
        }
    }

    @RequestMapping("/addClass_admin")
    @ResponseBody
    public String addClass_admin(String className, String startDate, String endDate, Integer tId, String subjectIds){
        Class aClass = new Class(className, startDate, endDate, tId);
        Integer classId = 0;
        if (classService.addClass_admin(aClass)){
            classId = classService.getCurClassId();
        }
        JSONArray subjectIdss = JSONArray.fromObject(subjectIds);
        List<DisSubject> list = new ArrayList<>();
        for (int i = 0; i < subjectIdss.size(); i++) {
            DisSubject disSubject = new DisSubject(subjectIdss.getInt(i), classId);
            list.add(disSubject);
        }
        list.add(new DisSubject(11,classId));
        list.add(new DisSubject(12,classId));
        boolean isAdd = disSubjectService.addBatchDisSubject(list);
        return String.valueOf(isAdd);
    }

    @RequestMapping("/adminBeforeEditClass")
    public String adminBeforeEditClass(Integer classId, String tName, Model model){
        List<DisSubject> list = disSubjectService.checkDisSubject_admin(classId);
        Class aClass = classService.getClassById_admin(classId);
        model.addAttribute("aClass", aClass);
        model.addAttribute("tName", tName);
        JSONArray jsonArray = JSONArray.fromObject(list);
        model.addAttribute("SubjectList",jsonArray);
        return "adminEditClass";
    }

    @RequestMapping("/editClass_admin")
    @ResponseBody
    public String editClass_admin(Integer classId, String className, String startDate, String endDate, Integer tId, String subjectIds){
        Class aClass = new Class(classId, className, startDate, endDate, tId);
        boolean isEditClass = classService.editClassById_admin(aClass);
        List<DisSubject> checkList = disSubjectService.checkDisSubject_admin(classId);
        JSONArray subjectIdss = JSONArray.fromObject(subjectIds);
        List<DisSubject> addList = new ArrayList<>();
        List<DisSubject> delList = new ArrayList<>();
        boolean isAdd = true;
        boolean isDel = true;
        for (int i = 0; i < subjectIdss.size(); i++){
            for (int j = 0; j < checkList.size(); j++){
                if (subjectIdss.getInt(i) != checkList.get(j).getSubjectId()){
                    if (j + 1 == checkList.size()){
                        DisSubject disSubject = new DisSubject(subjectIdss.getInt(i),classId);
                        addList.add(disSubject);
                    }
                } else {
                    break;
                }
            }
        }
        for (int i = 0; i < checkList.size(); i++) {
            for (int j = 0; j < subjectIdss.size(); j++) {
                if (subjectIdss.getInt(j) != checkList.get(i).getSubjectId()){
                    if (j + 1 == subjectIdss.size()){
                        DisSubject disSubject = new DisSubject(checkList.get(i).getId());
                        delList.add(disSubject);
                    }
                } else {
                    break;
                }
            }
        }
        if (addList.size() > 0) {
            isAdd = disSubjectService.addBatchDisSubject(addList);
        }
        if (delList.size() > 0) {
            isDel = disSubjectService.delBatchDisSubject(delList);
        }
        return String.valueOf(isEditClass && isAdd && isDel);
    }

    @RequestMapping("/checkRepClass_admin")
    @ResponseBody
    public String checkRepClass_admin(String className){
        List<Class> list = classService.checkRepClass_admin(className);
        boolean isExit = false;
        if (list.size() > 0){
            isExit = true;
        }
        return String.valueOf(isExit);
    }
}
