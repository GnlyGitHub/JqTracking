package com.jxd.controller;

import com.jxd.model.Class;
import com.jxd.model.LoginUser;
import com.jxd.model.Manager;
import com.jxd.model.Teacher;
import com.jxd.service.IClassService;
import com.jxd.service.ILoginUserService;
import com.jxd.service.IManagerService;
import com.jxd.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:49
 */
@Controller
@SessionAttributes({"userId","teacher","manager"})
public class LoginUserController {
    @Autowired
    ILoginUserService loginUserService;

    @Autowired
    ITeacherService teacherService;

    @Autowired
    IManagerService managerService;

    @Autowired
    IClassService classService;

    @RequestMapping("editPassword_Manage")
    public String editPassword_Manage(){
        return "empEditPassword";
    }

    @RequestMapping("/teacherRePwdTeacher")
    public String teacherRePwd_Teacher(){
        return "teacherRePwdTeacher";
    }

    @RequestMapping("/getPasswordById_Teacher")
    @ResponseBody
    public String getPasswordById_Teacher(Integer userId){
        String pwd = loginUserService.getPasswordById_Teacher(userId);
        return pwd;
    }

    //登录
    @RequestMapping(value = "/checkLogin",produces = "text/html;charset=utf-8")
    public String checkLogin(Integer userId, String password, Model model) {
        LoginUser loginUser = new LoginUser(userId, password);
        List<LoginUser> list = loginUserService.loginCheck(loginUser);
        if (list.size() != 0) {
            model.addAttribute("userId",userId);
            if (list.get(0).getRole() == 1) {
                //转发至管理员页面
                return "1";
            } else if (list.get(0).getRole() == 2) {
                //转发至老师页面
                Teacher teacher = teacherService.getTeacherById_admin(userId);
                model.addAttribute("teacher",teacher);

                List<Class> list1 = classService.getAllSClassBytId_Teacher(userId);
                model.addAttribute("sClasses",list1);
                return "studentAppraise";
            }else if (list.get(0).getRole() == 3) {
                //转发至项目经理页面
                Manager manager = managerService.getManagerById_admin(userId);
                model.addAttribute("manager",manager);
                return "1";
            }else {
                model.addAttribute("loginMsg", "用户名或密码错误");
                return "login";
            }
        } else {
            model.addAttribute("loginMsg", "用户名或密码错误");
            return "login";
        }
        //return "admin";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/rePwdAdmin_admin")
    @ResponseBody
    public String rePwdAdmin_admin(String oldPwd, String newPwd){
        return "";
    }

    @RequestMapping("/AfterRePwdAdmin_admin")
    public String AfterRePwdAdmin_admin(){
        return "";
    }
}
