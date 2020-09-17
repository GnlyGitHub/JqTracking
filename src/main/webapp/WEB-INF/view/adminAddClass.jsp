<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/17
  Time: 8:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加班期</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">班期名</label>
            <div class="layui-input-inline">
                <input id="className" type="text" name="className" required  lay-verify="required" placeholder="请输入班期名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">开课日期</label>
            <div class="layui-input-inline">
                <input id="startDate" type="date" name="startDate" required  lay-verify="date" placeholder="开课日期" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">结课日期</label>
            <div class="layui-input-inline">
                <input id="endDate" type="date" name="endDate" required  lay-verify="date" placeholder="结课日期" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">分配老师</label>
            <div class="layui-input-inline">
                <select id="tId" name="tId" lay-filter="test" lay-verify="required">
                </select>
            </div>
        </div>

        <div class="layui-form-item" style="display: flex; justify-content: center">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
                <button class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form','layer','upload'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        var upload = layui.upload;

        //向教师下拉框添加选项
        $.ajax({
            url: '/getAllTeacherForChoose_admin',
            dataType: 'json',
            data:{'state': 0},
            type: 'post',
            success: function (data) {
                $.each(data.data, function (index, item) {
                    $('#tId').append(new Option(item.tName, item.tId));//下拉菜单里添加元素
                });
                layui.form.render("select");
            }
        });

        $("#sub").click(function () {
            $.ajax({
                url:'addClass_admin',
                type:'post',
                data:{
                    "className": $("#className").val(),
                    "startDate": $("#startDate").val(),
                    "endDate": $("#endDate").val(),
                    "tId": $("#tId").val(),
                },
                dataType:'text',
                success:function (data) {
                    if (data == "true"){
                        layer.msg("添加成功");
                        setTimeout('closeAdd()',1000)
                    } else {
                        layer.msg("添加失败");
                        setTimeout('closeAdd()',1000)
                    }
                },
                error:function () {
                    layer.msg("执行失败");
                }
            })
        })
    });
    var closeAdd = function () {
        parent.location.reload();
    }
</script>
</body>
</html>
