<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/12
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加教师</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input id="tName" type="text" name="tName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="tSex" value="1" title="男" checked>
                <input type="radio" name="tSex" value="2" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">出生年月</label>
            <div class="layui-input-inline">
                <input id="tBirthday" type="date" name="tBirthday" required  lay-verify="date" placeholder="请输入出生年月" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input id="tPhone" type="text" name="tPhone" required  lay-verify="phone" placeholder="请输入电话" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display: flex; justify-content: center">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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

        $("#sub").click(function () {
            $.ajax({
                url:'addTeacher_admin',
                type:'post',
                data:{
                    "tName": $("#tName").val(),
                    "tSex": $('input[name="tSex"]:checked').val(),
                    "tBirthday": $("#tBirthday").val(),
                    "tPhone": $("#tPhone").val(),
                    "deptNo": 1
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
