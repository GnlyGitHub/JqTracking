<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/16
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加课程</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .red{
            border-color: red;
        }
    </style>
</head>
<body>
<div style="padding: 60px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">课程</label>
            <div class="layui-input-inline">
                <input id="subject" type="text" name="subject" required  lay-verify="required" placeholder="请输入课程名" autocomplete="off" class="layui-input">
            </div>
            <p id="subjectP1" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入课程</p>
            <p id="subjectP2" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">该课程已存在</p>
        </div>
        <div class="layui-form-item" style="display: flex; justify-content: center; margin-top: 30px; padding-left: 60px">
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
        var isExit = false;

        $("#subject").blur(function () {
            $.ajax({
                url: 'checkRepSubject_admin',
                data:{
                    subject: $("#subject").val()
                },
                dataType:'text',
                success:function (data) {
                    if (data == "true"){
                        $("#subject").addClass("red");
                        $("#subjectP2").css("display","inline");
                        isExit = true;
                    } else {
                        isExit = false;
                    }
                },
                error:function () {
                    layer.msg("执行失败");
                }
            });
            if ($("#subject").val() == ""){
                $("#subject").addClass("red");
                $("#subjectP1").css("display","inline");
            }
        }).focus(function () {
            $("#subject").removeClass("red");
            $("#subjectP1").css("display","none");
            $("#subjectP2").css("display","none");
        });

        $("#sub").click(function () {
            if ($("#subject").val() == ""){
                $("#subject").addClass("red");
                $("#subjectP1").css("display","inline");
            } else if (isExit) {
                $("#subject").addClass("red");
                $("#subjectP2").css("display","inline");
            } else {
                $.ajax({
                    url:'addSubject_admin',
                    type:'post',
                    data:{
                        "subject": $("#subject").val()
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
            }
        })
    });
    var closeAdd = function () {
        parent.location.reload();
    }
</script>
</body>
</html>
