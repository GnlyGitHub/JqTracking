package com.jxd.controller;

import com.jxd.model.Class;
import com.jxd.service.IClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @RequestMapping("/getAllSClassBytId_Teacher")
    @ResponseBody
    List<Class> getAllSClassBytId_Teacher(Integer tId){
        List<Class> list = classService.getAllSClassBytId_Teacher(tId);
        return list;
    }
}
