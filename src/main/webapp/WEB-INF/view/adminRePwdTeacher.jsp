<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/13
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置教师登录密码</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 300px;">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-inline">
                <label class="layui-form-label" id="tId" style="position: relative; right: 60px"></label>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <label class="layui-form-label" id="tName" style="position: relative; right: 60px"></label>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
                <input id="password" type="text" name="password" required  lay-verify="phone" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display: flex; justify-content: center; position: relative; right: 40px">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
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
        var tId = ${param.tId};

        $.ajax({
            url:"getTeacherById_admin",
            type:"get",
            dataType:"json",
            data:{
                tId: tId
            },
            success:function(data){
                $("#tId").html(tId);
                $("#tName").html(data.tName);
            },
            error:function (data) {
                layer.msg("执行失败");
            }
        });

        $("#sub").click(function () {
            $.ajax({
                url:'rePwdTeacher_admin',
                type:'post',
                data:{
                    "userId": tId,
                    "password": $("#password").val()
                },
                dataType:'text',
                success:function (data) {
                    if (data == "true"){
                        layer.msg("重置成功");
                        setTimeout('close()',1000)
                    } else {
                        layer.msg("重置失败");
                        setTimeout('close()',1000)
                    }
                },
                error:function () {
                    layer.msg("执行失败");
                }
            })
        });
    });
    //关闭当前弹框
    var close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</body>
</html>