<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/13
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加评论表</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-input-block {
            width: 190px;
        }
    </style>
</head>
<body>
<div align="center">
    <div   class="layui-form"  style="width: 350px;margin-top: 25px">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="uname" id="uname" required lay-verify="required" placeholder="请输入学生姓名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block" id="sex">
                <input type="radio" name="sex" id="man" title="男" checked value="1" >
                <input type="radio" name="sex" id="woman" title="女" value="0">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">生日</label>
            <div class="layui-input-block">
                <input type="date" name="birthday" id="birthday" required lay-verify="required" placeholder="请选择日期">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">入学日期</label>
            <div class="layui-input-block">
                <input type="date" name="grade" id="grade" required lay-verify="required" placeholder="请选择日期">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学院</label>
            <div class="layui-input-block">
                <select name="col" id="college" lay-filter="college">
                    <option value="">请选择学院</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="addMsg" lay-filter="formDemo">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    //Demo
    layui.use(['form','layer'], function () {
        var form = layui.form;
        var $=layui.$;
        var layer=layui.layer;
        //点击提交按钮
        $("#addMsg").click(function () {
            $.ajax({
                url:'AddStudentServlet',
                type:"post",
                data:{
                    name:$("#uname").val(),
                    sex:$('input[name="sex"]:checked').val(),
                    birthday:$("#birthday").val(),
                    grade:$("#grade").val(),
                    collegeId:$("option:checked").val()
                },
                dataType:"text",
                success:function (data) {
                    if ("true"==data){
                        layer.msg("新增成功");
                        setTimeout('closeAdd()',1000)
                    }else {
                        layer.msg("新增失败")
                        setTimeout('closeAdd()',1000)
                    }
                },
                error:function () {
                    layer.msg("执行失败")
                }
            })
        })
        $.ajax({
            url: 'getAllCollege',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                $.each(data, function (index, item) {
                    $('#college').append(new Option(item.collegeName, item.collegeId));//下拉菜单里添加元素
                });
                layui.form.render("select");
            },
            error:function () {
                layer.msg("执行失败")
            }
        });
    });
    var closeAdd=function () {
        parent.location.reload();//刷新父页面
    }
</script>
</body>
</html>
