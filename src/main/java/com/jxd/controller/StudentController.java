package com.jxd.controller;

import com.jxd.model.Student;
import com.jxd.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:50
 */
@Controller
public class StudentController {
    @Autowired
    IStudentService studentService;
    public String adminAdd_adminaa(){
        return "adminStudent";
    }
    public List<Student> getAllStudent_Teacher(){
        return null;
    }
    public List<Student> getAllStudent_Manage(){
        return null;
    }
}
