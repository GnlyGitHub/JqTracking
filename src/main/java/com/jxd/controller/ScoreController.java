package com.jxd.controller;

import com.jxd.model.Class;
import com.jxd.model.Score;
import com.jxd.service.IScoreService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:51
 */
@Controller
public class ScoreController {
    @Autowired
    IScoreService scoreService;

    @RequestMapping("/addAppraise_Teacher")
    @ResponseBody
    public String addAppraise_Teacher(String postData){
        System.out.println(postData);
        //JSONArray json=JSONArray.fromObject(postData);


        System.out.println();
        return "null";
    }
}
