<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/13
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加评论表</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>


        .layui-form-label {
            padding-left: 1px;
            padding-right: 1px;
        }

        .layui-input {
            padding-left: 20px;
        }

    </style>
</head>
<body>
<div style="width: 150px;padding-left: 50px">
    <div class="layui-form" style="width: 180px;margin-top: 25px">
        <div class="layui-form-item">
            <label class="layui-form-label">班期：</label>
            <div class="layui-input-block" style="width:130px">
                <select name="Class" id="Class" lay-filter="Class">
                    <option value="">请选择班期</option>
                </select>
            </div>

            <label class="layui-form-label">评价序数：</label>
            <div class="layui-input-block" style="width:130px">
                <select name="appraise" id="appraise" lay-filter="appraise">
                    <option value="">请选择序数</option>
                    <option value="0">转正</option>
                    <option value="1">一年</option>
                    <option value="2">两年</option>
                    <option value="3">三年</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请选择：</label>
            <div class="layui-input-block" id="div1" >
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="addDisAppraise" lay-filter="formDemo">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    //Demo
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var $ = layui.$;
        var layer = layui.layer;
        //点击提交按钮
        $("#addDisAppraise").click(function () {
            var number=$("#appraise option:checked").val();
            var classid=$("#Class option:checked").val();
            var arr_box = [];
            $("input[name='appraise']:checked").each(function() {
                arr_box.push($(this).val());
            });
           if (arr_box.length!=0&&number!=""&&classid!=""){
               $.ajax({
                   url:'checkDisAppraise_Manage',
                   type:'get',
                   data: {
                       number: number,
                       classId:classid,
                       mId:${sessionScope.manage.mId}
                   },
                   dataType:'json',
                   success: function (data) {
                       if (data.length==0){
                           $.ajax({
                               url: 'AddDisAppraiseData_Manage',
                               type: "post",
                               data: {
                                   mId: ${sessionScope.manage.mId},
                                   appraiseIds: JSON.stringify(arr_box),
                                   number: number,
                                   classId:classid
                               },
                               traditional:true,
                               success: function (data) {
                                   if (true == data) {
                                       layer.msg("新增成功",{icon: 6,time: 1500});
                                       setTimeout('closeAdd()', 1000)
                                   } else {
                                       layer.msg("新增失败",{icon: 5,time: 1500})
                                       setTimeout('closeAdd()', 1000)
                                   }
                               },
                               error: function () {
                                   layer.msg("增加操作执行失败")
                               }
                           })
                       }else {
                           layer.msg("该表已存在",{icon: 5,time: 1500})
                       }
                   },
                   error: function () {
                       layer.msg("检查操作执行失败")
                   }
               })
           }else {
               layer.msg("某些选项为空",{icon:5,time:1500})
           }
        })
        $.ajax({
            url: 'getAllClass_Manage',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                $.each(data, function (index, item) {
                    $('#Class').append(new Option(item.className, item.classId));//下拉菜单里添加元素
                });
                layui.form.render("select");
            },
            error: function () {
                layer.msg("执行失败")
            }
        });
        $.ajax({
            url: 'getAllAppraise_Manage',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                var str;
                $.each(data, function (index, item) {
                     $("#div1").append("<input  type='checkbox' name='appraise'  value='"+item.appraiseId+"' title='"+item.appraise+"'>" );
                });
                layui.form.render();
            },
            error: function () {
                layer.msg("执行失败")
            }
        });
    });
    var closeAdd = function () {
        parent.location.reload();//刷新父页面
    }
</script>
</body>
</html>
