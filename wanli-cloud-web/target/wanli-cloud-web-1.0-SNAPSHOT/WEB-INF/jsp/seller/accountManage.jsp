<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
   <title>账号管理</title>
    <meta name="menu" content="toAccountManage"/>
</head>

<body>
<div>
    <div class="person-details">
        <div class="require-details dingdan-details">
            <div class="text-slide">
                <div class="hd">
                    <ul>
                        <li class="on"><span>账号管理</span></li>
                    </ul>
                </div>
                <div class="bd">
                    <div class="register-layout">
                        <ul class="reg">
                            <li>
                                <label class="fl"><span>*</span>头像:</label>
                                <div class="avatar-ui fl">
                                    <form id="formPhotos" action="#" enctype="multipart/form-data">
                                        <img  name="photoUrl" id="infoImg"/>
                                        <input type="hidden" name="newPhotoUrl" id="newPhotoUrl">
                                        <div class="btn-two">
																	<span class="btn btn-success fileinput-button">
																	 <i class="glyphicon glyphicon-plus"></i>
																	 <span onclick="submit()">上传头像</span>
																	<input id="userPhoto" type="file" name="uploadFile"
                                                                           onchange="setImg()">
																	</span>
                                            <div class="filesList-ui"></div>
                                            <div class="info-sm">仅支持JPG,GIF,PNG图片文件,且文件小于5M</div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <li>
                                <form id="updateSellerAccount" action="#">
                                        <ul class="modify_show on">
                                            <li>
                                                <label><span>*</span>旧密码:</label>
                                                <div class="rits-ui short_input">
                                                    <input type="password" name="oldPwd" id="oldPassword">
                                                    <span style="margin-left: 10px;color: #B9B5B5;">若不填写旧密码则视为不修改密码</span>
                                                </div>
                                            </li>
                                            <li>
                                                <label><span>*</span>新密码:</label>
                                                <div class="rits-ui short_input">
                                                    <input type="password" name="newPwd" id="newPassword">
                                                    <span></span>
                                                </div>
                                            </li>
                                            <li>
                                                <label><span>*</span>再次输入新密码:</label>
                                                <div class="rits-ui short_input">
                                                    <input type="password" name="twoNewPassword" id="twoNewPassword">
                                                    <span></span>
                                                </div>
                                            </li>
                                            <li class="re-10 button-link">
                                                <label>1</label>
                                                <div class="rits-ui">
                                                    <button type="button" onclick="pwdJudge()">保存修改</button>
                                                </div>
                                            </li>
                                        </ul>
                                 </form>
                             </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        initImage();
    })



    function pwdJudge() {
        var oldPwd=$("#oldPassword").val();
        var newPwd=$("#newPassword").val();
        var twoNewPwd=$("#twoNewPassword").val();
        if(newPwd!=twoNewPwd){
            toastr.error("两次输入的密码不一致");
            return
        }
        var updateUserDto={
            oldPwd:oldPwd,
            newPwd:newPwd
        }
        $.ajax({
            url:"/seller/updateUserInfo",
            dataType:"json",
            data:updateUserDto,
            success:function (data) {
                console.log(data)
                if(data.status==200){
                    toastr.success("修改成功")
                    location.href="/seller/toAccountManage"
                }else if(data.status==400){
                    toastr.error(data.msg)
                }
            },
            error:function () {
                toastr.error("修改失败！")
            }
        })
    }

    function setImg(obj){
        var formData = new FormData($("#formPhotos")[0]);
        $.ajax({
            url: '${ctx}/pic/upload',
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {
                if(data.status == 0){
                    alert("文件上传失败");
                }else{
                    $("#infoImg").attr('src',data.data);
                    $("#photoUrl").val(data.data);
                }
            },
            error: function() {
                alert("请求失败！");
            }
        });
    }

    function submit() {
        $("#formPhotos").submit();
    }

    function initImage() {
        $.ajax({
            url:'/seller/getUserImage',
            method:'get',
            success:function (data) {
                $("#infoImg").attr('src',data.data);
            },
            error: function() {
                alert("请求失败！");
            }

        })
    }
</script>
</body>

</html>