<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/17
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑班期信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">班期</label>
            <div class="layui-input-inline">
                <input id="className" type="text" name="className" required  lay-verify="required" placeholder="请输入班期数" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">开课日期</label>
            <div class="layui-input-inline">
                <input id="startDate" type="date" name="startDate" value="${aClass.startDate}" required  lay-verify="date" placeholder="开课日期" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">结课日期</label>
            <div class="layui-input-inline">
                <input id="endDate" type="date" name="endDate" value="${aClass.endDate}" required  lay-verify="date" placeholder="结课日期" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">分配老师</label>
            <div class="layui-input-inline">
                <select id="tId" name="tId" lay-verify="required">
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">选择课程：</label>
            <div class="layui-input-block" id="AllSubject">
            </div>
        </div>

        <div class="layui-form-item" style="display: flex; justify-content: center">
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
        var SubjectList = ${SubjectList};
        var tId = ${aClass.tId};
        var classId = ${aClass.classId};
        var className = "${aClass.className}";
        var start = className.indexOf("第");
        var end = className.indexOf("期");
        var className1 = className.substring(start + 1, end);
        $("#className").val(className1);

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
                $("#tId option[value=" + tId + "]").attr("selected","selected");
                layui.form.render("select");
            }
        });

        //向课程复选框添加选项
        $.ajax({
            url: 'getAllSubjectForChoose_admin',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#AllSubject").append("<input type='checkbox' name='subject' value='" + data[i].subjectId + "' title='" + data[i].subject + "'>" );
                    for (var j = 0; j < SubjectList.length; j++){
                        if (SubjectList[j].subjectId == data[i].subjectId){
                            $("input[value='" + data[i].subjectId + "']").prop("checked", true)
                        }
                    }
                }
                layui.form.render();
            },
            error: function () {
                layer.msg("执行失败")
            }
        });

        $("#sub").click(function () {
            var className = "金桥第" + $("#className").val() + "期";
            var arr_box = [];
            $("input[name='subject']:checked").each(function() {
                arr_box.push($(this).val());
            });
            $.ajax({
                url:'editClass_admin',
                type:'post',
                data:{
                    classId: classId,
                    className: className,
                    startDate: $("#startDate").val(),
                    endDate: $("#endDate").val(),
                    tId: $("#tId").val(),
                    subjectIds: JSON.stringify(arr_box)
                },
                traditional:true,
                dataType:'text',
                success:function (data) {
                    if (data == "true"){
                        layer.msg("修改成功");
                        setTimeout('close()',1000)
                    } else {
                        layer.msg("修改失败");
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
