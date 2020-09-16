<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/16
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加评价分项</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="padding: 60px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">评价分项</label>
            <div class="layui-input-inline">
                <input id="appraise" type="text" name="appraise" required  lay-verify="required" placeholder="请输入课程名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="display: flex; justify-content: center; margin-top: 30px; padding-left: 60px">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form','layer'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;

        $("#sub").click(function () {
            $.ajax({
                url:'addAppraise_admin',
                type:'post',
                data:{
                    "appraise": $("#appraise").val()
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
