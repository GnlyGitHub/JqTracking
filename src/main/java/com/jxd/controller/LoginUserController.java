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
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:49
 */
@Controller
public class LoginUserController {
    @Autowired
    ILoginUserService loginUserService;

    @Autowired
    ITeacherService teacherService;

    @Autowired
    IManagerService managerService;

    @Autowired
    IClassService classService;
/**
 * @param
 * @return 返回到登录页面
 * @description: login
 * @author zhou yang
 * @date 2020/9/21 16:19
 */
    @RequestMapping("login")
    public String login(){
        return "login";
    }
/**
 * @param
 * @return 返回到编辑密码页面
 * @description: editPassword_Manage
 * @author zhou yang
 * @date 2020/9/21 16:19
 */
    @RequestMapping("editPassword_Manage")
    public String editPassword_Manage(){
        return "empEditPassword";
    }

    @RequestMapping("/teacherRePwd_Teacher")
    public String teacherRePwd_Teacher(){
        return "teacherRePwdTeacher";
    }

    @RequestMapping("/editPassword_Teacher")
    public String editPassword_Teacher(String password,Model model,HttpSession session){
        LoginUser oldLoginUser = (LoginUser) session.getAttribute("loginUser");
        Integer userId = oldLoginUser.getUserId();
        LoginUser loginUser = new LoginUser(userId,password);
        boolean isEdit = loginUserService.editPassword_Teacher(loginUser);
        if(isEdit){
            model.addAttribute("editMsg","修改成功");
            session.setAttribute("loginUser",loginUser);
        }else {
            model.addAttribute("editMsg","修改失败");
        }
        return "teacherRePwdTeacher";
    }

    //登录
    @RequestMapping(value = "/checkLogin",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String checkLogin(LoginUser loginUser, Model model,HttpSession session) {
        List<LoginUser> list = loginUserService.loginCheck(loginUser);
        if (list.size() != 0) {
            session.setAttribute("loginUser",loginUser);
            if (list.get(0).getRole() == 1) {
                //转发至管理员页面
                return "adminTeacherList";
            } else if (list.get(0).getRole() == 2) {
                //转发至老师页面
                Teacher teacher = teacherService.getTeacherById_admin(loginUser.getUserId());
                session.setAttribute("teacher",teacher);

                return "studentAppraise";
            }else if (list.get(0).getRole() == 3) {
                //转发至项目经理页面
                Manager manage = managerService.getManagerById_admin(loginUser.getUserId());
                session.setAttribute("manage",manage);
                return "empManage";
            }else {
                return "用户名或密码错误";
            }
        } else {
            return "用户名或密码错误";
        }
    }
    /**
     * @param loginUser 登录者对象
     * @return 是否登录成功
     * @description: editPasswordData_Manage 判断经理是否编辑成功
     * @author zhou yang
     * @date 2020/9/21 16:20
     */
    @ResponseBody
    @RequestMapping("editPasswordData_Manage")
    public boolean editPasswordData_Manage(LoginUser loginUser){

        return loginUserService.editPassword_Manage(loginUser);
    }

    @RequestMapping("/adminRePwdAdmin")
    public String adminRePwdAdmin(){
        return "adminRePwdAdmin";
    }

    //管理员修改自己的密码
    @RequestMapping("/rePwdAdmin_admin")
    @ResponseBody
    public String rePwdAdmin_admin(String oldPwd, String newPwd, HttpServletRequest request){
        HttpSession session = request.getSession();
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        Integer userId = loginUser.getUserId();
        LoginUser loginUser1 = new LoginUser(userId,oldPwd);

        //验证旧密码
        List<LoginUser> list = loginUserService.loginCheck(loginUser1);
        if (list.size() == 1){//旧密码验证通过
            LoginUser loginUser2 = new LoginUser(userId,newPwd);
            if (loginUserService.editLoginUser_admin(loginUser2)){
                return "1";//修改成功
            } else {
                return "3";//修改失败
            }
        } else {
            return "2";//旧密码验证不通过
        }
    }

    //退出
    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.removeAttribute("loginUser");
        if(session.getAttribute("teacher") != null){
            session.removeAttribute("teacher");

        }
        if(session.getAttribute("manage") != null){
            session.removeAttribute("manage");
        }

        //如果要清除session中的内容多采用下面的失效方法
        session.invalidate();
        return "login";
    }
}
