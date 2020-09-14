<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/14
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看评价表</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-input-block {
            width: 130px;
        }

        .layui-unselect {
            padding-top: 5px;
            width: 130px;
        }

        .layui-form-label {
            padding-left: 1px;
            padding-right: 1px;
        }

        .layui-input {
            padding-left: 20px;
        }

        .layui-form-checkbox {
            padding-top: 0px;
            width: 80px;
        }
    </style>
</head>
<body>
<div style="width: 150px;padding-left: 50px">
    <div class="layui-form" style="width: 150px;margin-top: 25px">
        <div class="layui-form-item">
            <label class="layui-form-label">班期：</label>
            <div class="layui-input-block" style="width:70px">
                <select name="Class" id="Class" lay-filter="Class" disabled>
                </select>
            </div>

            <label class="layui-form-label">评价序数：</label>
            <div class="layui-input-block" style="width:70px">
                <select name="appraise" id="appraise" lay-filter="appraise" disabled>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请选择：</label>
            <div class="layui-input-block" id="div1">
            </div>
        </div>
    </div>
</div>
<script>
    var data1 = ${list}
        layui.use(['form', 'layer'], function () {
            var form = layui.form;
            var $ = layui.$;
            var layer = layui.layer;
            $.ajax({
                url: 'getAllAppraise_Manage',
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    for(var j=0;j<data.length;j++) {
                        $("#div1").append("<input  type='checkbox' name='appraise' disabled  value='" + data[j].appraiseId + "' title='" + data[j].appraise + "'>");
                        for (var i=0;i<data1.length;i++) {
                            if (data1[i].appraiseId == data[j].appraiseId) {
                                $("input[value='"+data[j].appraiseId+"']").prop("checked",true)
                            }
                        }
                    };
                    layui.form.render();
                },
                error: function () {
                    layer.msg("执行失败")
                }
            });

            $('#Class').append(new Option("${className}", "${className}"));//下拉菜单里添加元素
            for (var i=0;i<data1.length;i++) {
                if (data1[i].number == 0) {
                    $('#appraise').append(new Option("转正", data1[i].number));//下拉菜单里添加元素
                } else if (data1[i].number == 1) {
                    $('#appraise').append(new Option("一年", data1[i].number));//下拉菜单里添加元素
                } else if (data1[i].number == 2) {
                    $('#appraise').append(new Option("两年", data1[i].number));//下拉菜单里添加元素
                } else {
                    $('#appraise').append(new Option("三年", data1[i].number));//下拉菜单里添加元素
                }
            }
        })

</script>
</body>
</html>
