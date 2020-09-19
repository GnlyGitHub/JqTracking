package com.jxd.controller;

import com.jxd.model.Job;
import com.jxd.model.Student;
import com.jxd.service.IJobService;
import com.jxd.service.IStudentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.UUID.randomUUID;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:50
 */
@Controller
public class StudentController {
    @Autowired
    IStudentService studentService;
    @Autowired
    IJobService jobService;

    @RequestMapping("/adminStudentList")
    public String adminStudentList() {
        return "adminStudentList";
    }

    @RequestMapping("/adminAddStudent")
    public String adminAddStudent(){
        return "adminAddStudent";
    }

    @RequestMapping("/adminEditStudent")
    public String adminEditStudent(){
        return "adminEditStudent";
    }

    @RequestMapping("/getAllStudent_Teacher")
    @ResponseBody
    public JSONObject getAllStudent_Teacher(Integer limit, Integer page, Integer sClass, String sName) {
        List<Student> list = studentService.getAllStudent_Teacher(sClass, sName);
        //获取分页数据

        List<Student> list1 = studentService.getAllStudentByPage_Teacher(limit, page, sClass, sName);

        //将list转换为json数组
        JSONArray jsonArray = JSONArray.fromObject(list1);
        //创建json对象，用于返回layui表格需要的数据
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());//一共有多少条数据
        jsonObject.put("data", jsonArray);

        //将json对象响应至前台
        return jsonObject;
    }

    @RequestMapping("getAllStudent_Manage")
    public List<Student> getAllStudent_Manage() {
        return null;
    }

    @RequestMapping(value = "/getAllStudent_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllStudent_admin(Integer limit, Integer page, String sName, Integer sClass) {
        List<Student> list = studentService.getAllStudent_admin(sClass, sName);
        List<Student> list1 = studentService.getStudent_admin(limit, page, sClass, sName);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    //图片上传
    @ResponseBody
    @RequestMapping("/upload")
    public Map upload(MultipartFile file, HttpServletRequest request) {
        String prefix = "";
        String dateStr = "";

        //保存上传
        OutputStream out = null;
        InputStream fileInput = null;
        try {
            if (file != null) {
                String originalName = file.getOriginalFilename();
                prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
                Date date = new Date();
                String uuid = randomUUID() + "";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dateStr = simpleDateFormat.format(date);
                String filepath = "D:\\IdeaProjects\\frame\\JqTracking\\src\\main\\webapp\\static\\img\\" + dateStr + "\\" + uuid + "." + prefix;
                File files = new File(filepath);

                //打印查看上传路径
                System.out.println(filepath);
                if (!files.getParentFile().exists()) {
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
                Map<String, Object> map2 = new HashMap<>();
                Map<String, Object> map = new HashMap<>();
                map.put("code", 0);
                map.put("msg", "");
                map.put("data", map2);
                map2.put("src", "/static/img/" + dateStr + "/" + uuid + "." + prefix);
                return map;
            }
        } catch (Exception e) {
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (fileInput != null) {
                    fileInput.close();
                }
            } catch (IOException e) {
            }
        }
        Map<String, Object> map = new HashMap<>();
        map.put("code", 1);
        map.put("msg", "");
        return map;
    }

    @RequestMapping(value = "/getAllJobByDeptNo_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllJobByDeptNo_admin(Integer deptNo){
        List<Job> list = jobService.getAllJobByDeptNo_admin(deptNo);
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    @RequestMapping("/addStudent_admin")
    @ResponseBody
    public String addStudent_admin(Student student){
        boolean isAdd = studentService.addStudent_admin(student);
        return String.valueOf(isAdd);
    }

    @RequestMapping("/editStudentById_admin")
    @ResponseBody
    public String editStudentById_admin(Student student){
        boolean isEdit = studentService.editStudentById_admin(student);
        return String.valueOf(isEdit);
    }

    @RequestMapping("/getStudentById_admin")
    @ResponseBody
    public Student getStudentById_admin(Integer sId){
        Student student = studentService.getStudentById_admin(sId);
        return student;
    }

    @RequestMapping("/delStudentById_admin")
    @ResponseBody
    public String delStudentById_admin(Integer sId){
        Student student = studentService.getStudentById_admin(sId);
        String sHireDate = student.getsHireDate();
        if (sHireDate == null) {
            boolean isDel = studentService.delStudent_admin(sId);
            return String.valueOf(isDel);
        } else {
            return "1";//该学生已入职
        }
    }
    @RequestMapping("GetAllStudent_Manage/{projectId}")
    @ResponseBody
     public JSONObject GetAllStudent_Manage(Integer classId, String empName, String empId, @PathVariable("projectId") Integer projectId, Integer limit, Integer page){
            List<Student> list=studentService.GetAllSizeStudent_Manage(classId,empName,empId,projectId);
            List<Student> list1=studentService.GetAllPageStudent_Manage(classId,empName,empId,projectId,limit,page);
            JSONArray jsonArray=JSONArray.fromObject(list1);
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("code",0);
            jsonObject.put("msg","");
            jsonObject.put("count",list.size());
            jsonObject.put("data",jsonArray);
            return jsonObject;
     }

}
