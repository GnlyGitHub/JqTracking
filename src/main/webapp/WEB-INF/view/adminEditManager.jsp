<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/14
  Time: 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改项目经理信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .red {
            border-color: red;
        }
    </style>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-inline">
                <label class="layui-form-label" id="mId" style="position: relative; right: 60px"></label>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input id="mName" type="text" name="mName" required lay-verify="required" placeholder="请输入姓名"
                       autocomplete="off" class="layui-input">
            </div>
            <p id="mNameP" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入姓名</p>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="mSex" value="1" title="男">
                <input type="radio" name="mSex" value="2" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">出生年月</label>
            <div class="layui-input-inline">
                <input id="mBirthday" type="date" name="mBirthday" required lay-verify="date" placeholder="请输入出生年月"
                       autocomplete="off" class="layui-input">
            </div>
            <p id="mBirthdayP" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">
                请输入出生年月</p>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input id="mPhone" type="text" name="mPhone" required lay-verify="phone" placeholder="请输入电话"
                       autocomplete="off" class="layui-input">
            </div>
            <p id="mPhoneP1" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入电话</p>
            <p id="mPhoneP2" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入正确电话</p>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">部门</label>
            <div class="layui-input-inline">
                <select id="deptNo" name="deptNo" lay-filter="test" lay-verify="required">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">项目</label>
            <div class="layui-input-inline">
                <select id="projectId" name="projectId" lay-verify="required">
                </select>
            </div>
        </div>

        <div class="layui-form-item" style="display: flex; justify-content: center">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
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
        var mId = ${param.mId};
        var reg = /^(([0-9]{7,8})|(1[0-9]{10}))$/;

        //表单验证
        $("#mName").blur(function () {
            if ($("#mName").val() == "") {
                $("#mName").addClass("red");
                $("#mNameP").css("display", "inline");
            }
        }).focus(function () {
            $("#mName").removeClass("red");
            $("#mNameP").css("display", "none");
        });
        $("#mBirthday").blur(function () {
            if ($("#mBirthday").val() == "") {
                $("#mBirthday").addClass("red");
                $("#mBirthdayP").css("display", "inline");
            }
        }).focus(function () {
            $("#mBirthday").removeClass("red");
            $("#mBirthdayP").css("display", "none");
        });
        $("#mPhone").blur(function () {
            if ($("#mPhone").val() == "") {
                $("#mPhone").addClass("red");
                $("#mPhoneP1").css("display", "inline");
                $("#mPhoneP2").css("display", "none");
            } else if (!reg.test($("#mPhone").val())) {
                $("#mPhone").addClass("red");
                $("#mPhoneP1").css("display", "none");
                $("#mPhoneP2").css("display", "inline");
            }
        }).focus(function () {
            $("#mPhone").removeClass("red");
            $("#mPhoneP1").css("display", "none");
            $("#mPhoneP2").css("display", "none");
        });

        //向部门下拉框添加数据
        $.ajax({
            url: '/getAllDept_admin',
            dataType: 'json',
            data: {'state': 0},
            type: 'post',
            success: function (data) {
                $.each(data.data, function (index, item) {
                    $('#deptNo').append(new Option(item.deptName, item.deptNo));//下拉菜单里添加元素
                });
                layui.form.render("select");
            }
        });

        //向项目下拉框添加数据
        form.on('select(test)', function (data) {
            $.ajax({
                url: '/getProject_admin',
                dataType: 'json',
                data: {'state': 0, 'deptNo': data.value},
                type: 'post',
                success: function (data) {
                    projectId.options.length = 0;
                    $.each(data.data, function (index, item) {
                        $('#projectId').append(new Option(item.projectName, item.projectId));//下拉菜单里添加元素
                    });
                    layui.form.render("select");
                }
            });
        });

        //获取待编辑的项目经理的信息
        $.ajax({
            url: "getManagerById_admin",
            type: "get",
            dataType: "json",
            data: {
                mId: mId
            },
            success: function (data) {
                $("#mId").html(mId);
                $("#mName").val(data.mName);
                $("#mBirthday").val(data.mBirthday);
                $("#mPhone").val(data.mPhone);
                $("input[name=mSex][value='1']").attr("checked", data.mSex == 1 ? true : false);
                $("input[name=mSex][value='2']").attr("checked", data.mSex == 2 ? true : false);
                $("#deptNo option[value=" + data.deptNo + "]").attr("selected", "selected");
                var projectId1 = data.projectId;
                $.ajax({
                    url: '/getProject_admin',
                    dataType: 'json',
                    data: {'state': 0, 'deptNo': data.deptNo},
                    type: 'post',
                    success: function (data) {
                        projectId.options.length = 0;
                        $.each(data.data, function (index, item) {
                            $('#projectId').append(new Option(item.projectName, item.projectId));//下拉菜单里添加元素
                        });
                        $("#projectId option[value=" + projectId1 + "]").attr("selected", "selected");
                        layui.form.render("select");
                    }
                });
                //$("#projectId option[value=" + 4 + "]").attr("selected","selected");
                form.render();
            },
            error: function (data) {
                layer.msg("执行失败");
            }
        });

        //重置按钮
        $("#reset").click(function () {
            $("#mName").val("");
            $("#mBirthday").val("");
            $("#mPhone").val("");
        });

        //提交
        $("#sub").click(function () {
            if ($("#mName").val() == "") {
                $("#mName").addClass("red");
                $("#mNameP").css("display", "inline");
            } else if ($("#mBirthday").val() == "") {
                $("#mBirthday").addClass("red");
                $("#mBirthdayP").css("display", "inline");
            } else if ($("#mPhone").val() == "") {
                $("#mPhone").addClass("red");
                $("#mPhoneP1").css("display", "inline");
            } else if (!reg.test($("#mPhone").val())) {
                $("#mPhone").addClass("red");
                $("#mPhoneP2").css("display", "inline");
            } else {
                $.ajax({
                    url: 'editManager_admin',
                    type: 'post',
                    data: {
                        "mId": mId,
                        "mName": $("#mName").val(),
                        "mSex": $('input[name="mSex"]:checked').val(),
                        "mBirthday": $("#mBirthday").val(),
                        "mPhone": $("#mPhone").val(),
                        "deptNo": $("#deptNo").val(),
                        "projectId": $("#projectId").val(),
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "true") {
                            layer.msg("修改成功");
                            setTimeout('close()', 1000)
                        } else {
                            layer.msg("修改失败");
                            setTimeout('close()', 1000)
                        }
                    },
                    error: function () {
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
