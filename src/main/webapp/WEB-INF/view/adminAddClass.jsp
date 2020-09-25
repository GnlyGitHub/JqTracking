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
    <style>
        .red {
            border-color: red;
        }
        .warnP{
            color: red;
            display: none;
            position: relative;
            top: 9px;
            font-size: 14px
        }
    </style>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">班期</label>
            <div class="layui-input-inline">
                <input id="className" type="text" name="className" required lay-verify="required" placeholder="请输入班期数"
                       autocomplete="off" class="layui-input">
            </div>
            <p id="classNameP1" class="warnP">请输入班期数</p>
            <p id="classNameP2" class="warnP">该班期已存在</p>
            <p id="classNameP3" class="warnP">请输入正整数</p>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">开课日期</label>
            <div class="layui-input-inline">
                <input id="startDate" type="date" name="startDate" required lay-verify="date" placeholder="开课日期"
                       autocomplete="off" class="layui-input">
            </div>
            <p id="startDateP" class="warnP">请输入开课日期</p>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">结课日期</label>
            <div class="layui-input-inline">
                <input id="endDate" type="date" name="endDate" required lay-verify="date" placeholder="结课日期"
                       autocomplete="off" class="layui-input">
            </div>
            <p id="endDateP" class="warnP">请输入结课日期</p>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">分配老师</label>
            <div class="layui-input-inline">
                <select id="tId" name="tId" lay-filter="test" lay-verify="required">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">选择课程：</label>
            <div class="layui-input-block" id="AllSubject">
            </div>
            <p id="subjectP" style="color: red; display: none; position: relative;top: 9px;left: 110px;font-size: 14px">请选择课程</p>
        </div>

        <div class="layui-form-item" style="display: flex; justify-content: center">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layer', 'upload'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        var upload = layui.upload;
        var isExit = false;
        var reg = /^\d+$/;

        //表单验证
        $("#className").blur(function () {
            var className = "金桥第" + $("#className").val() + "期";
            $.ajax({
                url: 'checkRepClass_admin',
                data: {
                    className: className
                },
                dataType: 'text',
                success: function (data) {
                    if (data == "true") {
                        $("#className").addClass("red");
                        $("#classNameP2").css("display", "inline");
                        isExit = true;
                    } else {
                        isExit = false;
                    }
                },
                error: function () {
                    layer.msg("执行失败");
                }
            });
            if ($("#className").val() == "") {
                $("#className").addClass("red");
                $("#classNameP1").css("display", "inline");
            } else if (!reg.test($("#className").val())) {
                $("#className").addClass("red");
                $("#classNameP3").css("display", "inline");
            }
        }).focus(function () {
            $("#className").removeClass("red");
            $("#classNameP1").css("display", "none");
            $("#classNameP2").css("display", "none");
            $("#classNameP3").css("display", "none");
        });
        $("#startDate").blur(function () {
            if ($("#startDate").val() == "") {
                $("#startDate").addClass("red");
                $("#startDateP").css("display", "inline");
            }
        }).focus(function () {
            $("#startDate").removeClass("red");
            $("#startDateP").css("display", "none");
        });
        $("#endDate").blur(function () {
            if ($("#endDate").val() == "") {
                $("#endDate").addClass("red");
                $("#endDateP").css("display", "inline");
            }
        }).focus(function () {
            $("#endDate").removeClass("red");
            $("#endDateP").css("display", "none");
        });
        $("#AllSubject").click(function () {
            $("#subjectP").css("display", "none")
        });

        //向教师下拉框添加选项
        $.ajax({
            url: '/getAllTeacherForChoose_admin',
            dataType: 'json',
            data: {'state': 0},
            type: 'post',
            success: function (data) {
                $.each(data.data, function (index, item) {
                    $('#tId').append(new Option(item.tName, item.tId));//下拉菜单里添加元素
                });
                layui.form.render("select");
            }
        });

        //向课程复选框添加选项
        $.ajax({
            url: 'getAllSubjectForChoose_admin',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                $.each(data, function (index, item) {
                    $("#AllSubject").append("<input type='checkbox' name='subject' value='" + item.subjectId + "' title='" + item.subject + "'>");
                });
                layui.form.render();
            },
            error: function () {
                layer.msg("执行失败")
            }
        });

        //提交
        $("#sub").click(function () {
            var className = "金桥第" + $("#className").val() + "期";
            var arr_box = [];
            $("input[name='subject']:checked").each(function () {
                arr_box.push($(this).val());
            });
            if ($("#className").val() == "") {
                $("#className").addClass("red");
                $("#classNameP1").css("display", "inline");
            } else if ($("#startDate").val() == "") {
                $("#startDate").addClass("red");
                $("#startDateP").css("display", "inline");
            } else if ($("#endDate").val() == "") {
                $("#endDate").addClass("red");
                $("#endDateP").css("display", "inline");
            } else if (isExit) {
                $("#className").addClass("red");
                $("#classNameP2").css("display", "inline");
            } else if (arr_box.length < 1) {
                $("#subjectP").css("display", "inline")
            } else if (!reg.test($("#className").val())) {
                $("#className").addClass("red");
                $("#classNameP3").css("display", "inline");
            } else {
                $.ajax({
                    url: 'addClass_admin',
                    type: 'post',
                    data: {
                        className: className,
                        startDate: $("#startDate").val(),
                        endDate: $("#endDate").val(),
                        tId: $("#tId").val(),
                        subjectIds: JSON.stringify(arr_box)
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "true") {
                            layer.msg("添加成功");
                            setTimeout('closeAdd()', 1000)
                        } else {
                            layer.msg("添加失败");
                            setTimeout('closeAdd()', 1000)
                        }
                    },
                    error: function () {
                        layer.msg("执行失败");
                    }
                })
            }
        });
    });
    var closeAdd = function () {
        parent.location.reload();
    }
</script>
</body>
</html>
