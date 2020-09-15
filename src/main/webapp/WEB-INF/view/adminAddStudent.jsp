<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/14
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input id="sName" type="text" name="sName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sSex" value="1" title="男" checked>
                <input type="radio" name="sSex" value="2" title="女">
            </div>
        </div>

        <input type="hidden" name="sPhoto" id="sPhoto" class="image">
        <div class="layui-form-item">
            <label class="layui-form-label ">照片:</label>
            <div class="layui-upload">
                <button type="button" class="layui-btn" id="test1">上传图片</button>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" id="demo1">
                    <p id="demoText"></p>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">民族</label>
            <div class="layui-input-inline">
                <input id="sNation" type="text" name="sNation" required  lay-verify="required" placeholder="请输入民族" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">出生年月</label>
            <div class="layui-input-inline">
                <input id="sBirthday" type="date" name="sBirthday" required  lay-verify="date" placeholder="请输入出生年月" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">籍贯</label>
            <div class="layui-input-inline">
                <input id="sPlace" type="text" name="sPlace" required  lay-verify="required" placeholder="请输入籍贯" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">婚否</label>
            <div class="layui-input-block">
                <input type="radio" name="sMarry" value="1" title="未婚" checked>
                <input type="radio" name="sMarry" value="2" title="已婚">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input id="sPhone" type="text" name="sPhone" required  lay-verify="phone" placeholder="请输入电话" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">身份证</label>
            <div class="layui-input-inline">
                <input id="sIdCard" type="text" name="sIdCard" required  lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">学校</label>
            <div class="layui-input-inline">
                <input id="sSchool" type="text" name="sSchool" required  lay-verify="required" placeholder="请输入学校" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">专业</label>
            <div class="layui-input-inline">
                <input id="sMajor" type="text" name="sMajor" required  lay-verify="required" placeholder="请输入专业" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">班期</label>
            <div class="layui-input-inline">
                <select id="sClass" name="sClass" lay-filter="test" lay-verify="required">
                    <option value=""></option>
                </select>
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
            <label class="layui-form-label">职务</label>
            <div class="layui-input-inline">
                <select id="jobId" name="jobId" lay-verify="required">
                    <option value=""></option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">入职日期</label>
            <div class="layui-input-inline">
                <input id="sHireDate" type="date" name="sHireDate" required  lay-verify="date" placeholder="请输入入职日期" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <input id="sRemarks" type="text" name="sRemarks" required  lay-verify="required" placeholder="请输入备注" autocomplete="off" class="layui-input">
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

        //图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '/upload'
            ,accept:'images'
            ,size:50000
            ,before: function(obj){
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result);
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                var demoText = $('#demoText');
                demoText.html('<span style="color: #4cae4c;">上传成功</span>');
                var fileupload = $(".image");
                fileupload.attr("value",res.data.src);
                //console.log(fileupload.attr("value"));
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
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
