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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:49
 */
@Controller
@SessionAttributes({"loginUser","teacher","manage"})
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

    @RequestMapping("/teacherRePwd_Teacher")
    public String teacherRePwd_Teacher(){
        return "teacherRePwdTeacher";
    }

    @RequestMapping("/editPassword_Teacher")
    public String editPassword_Teacher(LoginUser loginUser,Model model){
        boolean isEdit = loginUserService.editPassword_Teacher(loginUser);
        if(isEdit){
            model.addAttribute("editMsg","修改成功");
        }else {
            model.addAttribute("editMsg","修改失败");
        }
        return "teacherRePwdTeacher";
    }

    //登录
    @RequestMapping(value = "/checkLogin",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String checkLogin(LoginUser loginUser, Model model) {
        List<LoginUser> list = loginUserService.loginCheck(loginUser);
        if (list.size() != 0) {
            model.addAttribute("loginUser",loginUser);
            if (list.get(0).getRole() == 1) {
                //转发至管理员页面
                return "adminTeacherList";
            } else if (list.get(0).getRole() == 2) {
                //转发至老师页面
                Teacher teacher = teacherService.getTeacherById_admin(loginUser.getUserId());
                model.addAttribute("teacher",teacher);

                List<Class> list1 = classService.getAllSClassBytId_Teacher(loginUser.getUserId());
                model.addAttribute("sClasses",list1);
                return "studentAppraise";
            }else if (list.get(0).getRole() == 3) {
                //转发至项目经理页面
                Manager manage = managerService.getManagerById_admin(loginUser.getUserId());
                model.addAttribute("manage",manage);
                return "empManage";
            }else {
                return "用户名或密码错误";
            }
        } else {
            return "用户名或密码错误";
        }
        //return "admin";
    }
    @ResponseBody
    @RequestMapping("editPasswordData_Manage")
    public boolean editPasswordData_Manage(LoginUser loginUser){

        return loginUserService.editPassword_Manage(loginUser);
    }
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/adminRePwdAdmin")
    public String adminRePwdAdmin(){
        return "adminRePwdAdmin";
    }

    @RequestMapping("/rePwdAdmin_admin")
    @ResponseBody
    public String rePwdAdmin_admin(String oldPwd, String newPwd, HttpServletRequest request){
        HttpSession session = request.getSession();
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        Integer userId = loginUser.getUserId();
        LoginUser loginUser1 = new LoginUser(userId,oldPwd);
        List<LoginUser> list = loginUserService.loginCheck(loginUser1);
        if (list.size() == 1){
            LoginUser loginUser2 = new LoginUser(userId,newPwd);
            if (loginUserService.editLoginUser_admin(loginUser2)){
                return "1";
            } else {
                return "3";
            }
        } else {
            return "2";
        }
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.removeAttribute("loginUser");
        if(session.getAttribute("teacher") != null){
            session.removeAttribute("teacher");
        }

//如果要清除session中的内容多采用下面的失效方法
        session.invalidate();
        return "login";
    }

}
