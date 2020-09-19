<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/14
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置项目经理登录密码</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .red{
            border-color: red;
        }
    </style>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 300px;">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-inline">
                <label class="layui-form-label" id="mId" style="position: relative; right: 60px"></label>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <label class="layui-form-label" id="mName" style="position: relative; right: 60px"></label>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
                <input id="password" type="password" name="password" required  lay-verify="phone" placeholder="请输入密码" autocomplete="off" class="layui-input">
                <p id="passwordP1" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入新密码</p>
                <p id="passwordP2" style="color: red; display: none; font-size: 14px">密码由字母、数字组成，长度为6~18位</p>
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
        var mId = ${param.mId};
        var reg = /^[a-zA-Z0-9]{6,18}$/;

        $("#password").blur(function () {
            if ($("#password").val() == ""){
                $("#password").addClass("red");
                $("#passwordP1").css("display","inline");
                $("#passwordP2").css("display","none");
            } else if (!reg.test($("#password").val())){
                $("#password").addClass("red");
                $("#passwordP2").css("display","inline");
                $("#passwordP1").css("display","none");
            }
        }).focus(function () {
            $("#password").removeClass("red");
            $("#passwordP1").css("display","none");
            $("#passwordP2").css("display","none");
        });

        $.ajax({
            url:"getManagerById_admin",
            type:"get",
            dataType:"json",
            data:{
                mId: mId
            },
            success:function(data){
                $("#mId").html(mId);
                $("#mName").html(data.mName);
            },
            error:function (data) {
                layer.msg("执行失败");
            }
        });

        $("#sub").click(function () {
            if ($("#password").val() == ""){
                $("#password").addClass("red");
                $("#passwordP1").css("display","inline");
            } else if (!reg.test($("#password").val())){
                $("#password").addClass("red");
                $("#passwordP2").css("display","inline");
            } else {
                $.ajax({
                    url:'rePwdManager_admin',
                    type:'post',
                    data:{
                        "userId": mId,
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
            }
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
