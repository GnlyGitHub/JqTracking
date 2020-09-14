<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/14
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑评价表</title>
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
                <select name="Class" id="Class" lay-filter="Class">
                </select>
            </div>

            <label class="layui-form-label">评价序数：</label>
            <div class="layui-input-block" style="width:70px">
                <select name="appraise" id="appraise" lay-filter="appraise">

                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请选择：</label>
            <div class="layui-input-block" id="div1">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="editDisAppraise" lay-filter="formDemo">提交</button>
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
                    for (var j = 0; j < data.length; j++) {
                        $("#div1").append("<input  type='checkbox' name='appraise'  value='" + data[j].appraiseId + "' title='" + data[j].appraise + "'>");
                        for (var i = 0; i < data1.length; i++) {
                            if (data1[i].appraiseId == data[j].appraiseId) {
                                $("input[value='" + data[j].appraiseId + "']").prop("checked", true)
                            }
                        }
                    }
                    ;
                    layui.form.render();
                },
                error: function () {
                    layer.msg("执行失败")
                }
            });
            var n=${classId}
            $('#Class').append(new Option("${className}", "${classId}"));//下拉菜单里添加元素
            $("#Class option[value='"+n+"']").prop("selected","selected");//下拉菜单里添加元素
            for (var i = 0; i < data1.length; i++) {
                if (data1[i].number == 0) {
                    $('#appraise').append(new Option("转正", data1[i].number));//下拉菜单里添加元素
                } else if (data1[i].number == 1) {
                    $('#appraise').append(new Option("一年", data1[i].number));//下拉菜单里添加元素
                } else if (data1[i].number == 2) {
                    $('#appraise').append(new Option("两年", data1[i].number));//下拉菜单里添加元素
                } else {
                    $('#appraise').append(new Option("三年", data1[i].number));//下拉菜单里添加元素
                }
                $("#appraise option[value='"+data1[i].number+"']").prop("selected","selected");
                break;
            }
            //点击提交按钮
            $("#editDisAppraise").click(function () {
                var arr_box = [];
                var number = data1[0].number;
                var classId = ${classId}
                    $("input[name='appraise']:checked").each(function () {
                        arr_box.push($(this).val());
                    });
                if (arr_box.length != 0 ) {
                    $.ajax({
                        url: 'editDisAppraiseData_Manage',
                        type: "post",
                        data: {
                            mId: ${sessionScope.manage.mId},
                            appraiseIds: JSON.stringify(arr_box),
                            number: number,
                            classId: classId
                        },
                        traditional: true,
                        success: function (data) {
                            if (true == data) {
                                layer.msg("编辑成功", {icon: 6, time: 1500});
                                setTimeout('closeAdd()', 1000)
                            } else {
                                layer.msg("编辑失败", {icon: 5, time: 1500})
                                setTimeout('closeAdd()', 1000)
                            }
                        },
                        error: function () {
                            layer.msg("编辑操作执行失败")
                        }
                    })

                } else {
                    layer.msg("某些选项为空", {icon: 5, time: 1500})
                }
            })
        });
    var closeAdd = function () {
        parent.location.reload();//刷新父页面
    }
</script>
</body>
</html>
