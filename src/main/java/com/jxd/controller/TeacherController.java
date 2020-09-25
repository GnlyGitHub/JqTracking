package com.jxd.controller;

import com.jxd.model.Class;
import com.jxd.model.LoginUser;
import com.jxd.model.Teacher;
import com.jxd.service.IClassService;
import com.jxd.service.ILoginUserService;
import com.jxd.service.ITeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
    @Autowired
    IClassService classService;

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

    /**
     * 获取所有教师并将其分页
     * @param limit 每页数量
     * @param page 当前页数
     * @param tName 过滤条件
     * @return 当前页的课程列表
     */
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

    /**
     * 添加老师
     * @param teacher 要添加的老师
     * @return 是否添加成功
     */
    @RequestMapping(value = "/addTeacher_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addTeacher_admin(Teacher teacher){
        boolean isAdd = teacherService.addTeacher_admin(teacher);
        Integer tId = teacherService.getCurTeacherId_admin();
        LoginUser loginUser = new LoginUser(tId, 2);
        boolean isAddLogin = loginUserService.addLoginUser_admin(loginUser);
        return String.valueOf(isAdd && isAddLogin);
    }

    /**
     * 删除老师
     * @param tId 要删除的老师编号
     * @return 是否删除成功
     */
    @RequestMapping("/delTeacherById_admin")
    @ResponseBody
    public String delTeacherById_admin(Integer tId){
        List<Class> list = classService.getClassBytId_admin(tId);//获取该老师教的班期
        if (list.size() > 0) {
            return "1";//该老师已被分配到班期
        } else {
            boolean isDel = teacherService.delTeacherById_admin(tId);
            boolean isDelLogin = loginUserService.delLoginUser_admin(tId);
            return String.valueOf(isDel && isDelLogin);
        }
    }

    /**
     * 获取老师信息
     * @param tId 要获取信息的老师的编号
     * @return 老师信息
     */
    @RequestMapping("/getTeacherById_admin")
    @ResponseBody
    public Teacher getTeacherById_admin(Integer tId){
        Teacher teacher = teacherService.getTeacherById_admin(tId);
        return teacher;
    }

    /**
     * 编辑老师
     * @param teacher 要编辑的老师
     * @return 是否编辑成功
     */
    @RequestMapping(value = "/editTeacher_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String editTeacher_admin(Teacher teacher){
        boolean isEdit = teacherService.editTeacherById_admin(teacher);
        return String.valueOf(isEdit);
    }

    /**
     * 给老师重置密码
     * @param loginUser 要密码的登录账户
     * @return 是否重置成功
     */
    @RequestMapping(value = "/rePwdTeacher_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String rePwdTeacher_admin(LoginUser loginUser){
        boolean isRe = loginUserService.editLoginUser_admin(loginUser);
        return String.valueOf(isRe);
    }

    /**
     * 获取所有老师以供班期选择
     * @return 所有老师
     */
    @RequestMapping(value = "/getAllTeacherForChoose_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllTeacherForChoose_admin(){
        List<Teacher> teacherList1 = teacherService.getAllTeacher_admin("");
        List<Teacher> teacherList2 = new ArrayList<>();//没有未结束班期的老师
        for (Teacher teacher : teacherList1) {
            Integer tId = teacher.gettId();
            List<Class> classList = classService.getClassBytId_admin(tId);//获取该老师教的班期
            String curTime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间
            DateFormat df = DateFormat.getDateInstance();
            long time1 = 0;
            long time2 = 0;
            if (classList.size() < 1){
                teacherList2.add(teacher);
            } else {
                for (Class aClass : classList) {//遍历该老师教过的班期
                    String endDate = aClass.getEndDate();
                    try {
                        time1 = df.parse(curTime).getTime();
                        time2 = df.parse(endDate).getTime();
                    } catch (ParseException e){
                        e.printStackTrace();
                    }
                    if (time1 > time2){//该老师没有未结束的班期，可以分配
                        teacherList2.add(teacher);
                        break;
                    }
                }
            }
        }
        JSONArray jsonArray = JSONArray.fromObject(teacherList2);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",teacherList2.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }
}
