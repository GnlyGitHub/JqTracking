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
    <title>添加项目经理</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input id="mName" type="text" name="mName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="mSex" value="1" title="男" checked>
                <input type="radio" name="mSex" value="2" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">出生年月</label>
            <div class="layui-input-inline">
                <input id="mBirthday" type="date" name="mBirthday" required  lay-verify="date" placeholder="请输入出生年月" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input id="mPhone" type="text" name="mPhone" required  lay-verify="phone" placeholder="请输入电话" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">部门</label>
            <div class="layui-input-inline">
                <select id="deptNo" name="deptNo" lay-filter="test" lay-verify="required">
                    <option value=""></option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">项目</label>
            <div class="layui-input-inline">
                <select id="projectId" name="projectId" lay-verify="required">
                    <option value=""></option>
                </select>
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

        $.ajax({
            url: '/getAllDept_admin',
            dataType: 'json',
            data:{'state': 0},
            type: 'post',
            success: function (data) {
                $.each(data.data, function (index, item) {
                    $('#deptNo').append(new Option(item.deptName, item.deptNo));//下拉菜单里添加元素
                });
                layui.form.render("select");
            }
        });

        form.on('select(test)', function(data){
            $.ajax({
                url: '/getProject_admin',
                dataType: 'json',
                data:{'state': 0, 'deptNo': data.value},
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

        $("#sub").click(function () {
            $.ajax({
                url:'addManager_admin',
                type:'post',
                data:{
                    "mName": $("#mName").val(),
                    "mSex": $('input[name="mSex"]:checked').val(),
                    "mBirthday": $("#mBirthday").val(),
                    "mPhone": $("#mPhone").val(),
                    "deptNo": $("#deptNo").val(),
                    "projectId": $("#projectId").val(),
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
