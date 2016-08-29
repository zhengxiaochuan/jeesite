<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<title>${fns:getConfig('productName')} 登录</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="${ctxStatic}/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctxStatic}/ace/components/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="${ctxStatic}/ace/assets/css/login.css"/>
    <link rel="stylesheet" href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" />

</head>

<body class="login-layout">

    <!--[if lte IE 6]>
    <br/>
    <div class='alert alert-block' style="text-align:left;padding-bottom:10px;">
        <a class="close" data-dismiss="alert">x</a>
        <h4>温馨提示：</h4>
        <p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您
            <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。
        </p>
    </div>
    <![endif]-->

    <div class="logintop">
        <span style="font-size: 12px;">欢迎使用${fns:getConfig('productName')}</span>
        <ul>
            <!-- <li><a href="#">返回首页</a></li>
            <li><a href="#">帮助</a></li>
            <li><a href="#">关于</a></li> -->
        </ul>
    </div>

    <div class="loginbody">

        <div class="login-container">

            <div class="center" style="margin-bottom: 20px;">
                <h1>
                    <i class="fa fa-leaf green"></i>
                    <span class="white">${fns:getConfig('productName')}</span>
                </h1>
                <h4 class="white">Background Management System</h4>
            </div>

            <div class="position-relative">
                <div id="login-box" class="login-box widget-box no-border visible">
                    <div class="widget-body">
                        <div class="widget-main">
                            <h4 class="header">
                                <i class="fa fa-coffee green"></i>
                                用户登录
                            </h4>

                            <div class="login_icon"><img src="${ctxStatic}/ace/assets/images/login.png" /></div>

                            <form id="loginForm" class="form-horizontal"action="${ctx}/login" method="post">
                                <fieldset>
                                    <!-- 用户名 -->
                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-left">
                                            <input type="text" id="username" name="username" class="form-control required" placeholder="登录名" name="登录名" value="${username}">
                                        </span>
                                    </label>

                                    <!-- 密码 -->
                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-left">
                                            <input type="password" id="password" name="password" class="form-control required" placeholder="密码" name="密码"/>
                                        </span>
                                    </label>

                                    <!-- 验证码 -->
                                    <c:if test="${isValidateCodeLogin}">
                                        <div class="block clearfix validateCode">
                                            <label class="input-label mid" for="validateCode">验证码</label>
                                            <sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
                                        </div>
                                    </c:if>

                                    <!-- 登录操作 -->
                                    <div class="clearfix">
                                        <button type="submit" class="width-35 pull-right btn btn btn-primary" id="login_btn">
                                            <i class="fa fa-key"></i>
                                            登 录
                                        </button>

                                        <label class="inline" for="rememberMe" title="下次不需要再登录">
                                            <input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''}/>
                                            <span class="light-grey" style="font-size: 12px;">记住我</span>
                                        </label>

                                    </div>

                                </fieldset>
                            </form>

                            <br>

                            <div class="social-or-login center">
                                <span class="bigger-110">通知</span>
                            </div>

                            <div class="social-login center" style="font-size: 13px; color: #393939; line-height: 1.5;">
                                该系统不再对IE8以下浏览器支持，请见谅
                            </div>
                        </div><!-- /widget-main -->

                        <div class="toolbar clearfix">

                        </div>
                    </div><!-- /widget-body -->
                </div><!-- /login-box -->
            </div><!-- /position-relative -->

            <!--登录错误消息-->
            <div id="messageBox" class="alert alert-danger alert-dismissable ${empty message ? 'hide' : ''}">
                <%--<button class="close" data-dismiss="alert">×</button>--%>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                    &times;
                </button>
                <label id="loginError" class="error">${message}</label>
            </div>

        </div>


    </div><!-- loginbody -->

    <div class="loginbm">
        <%--Copyright © 2012-2016 <strong><a href="" class="grey">逍遥轩软件系统有限公司</a></strong>--%>
        Copyright &copy; 2012-${fns:getConfig('copyrightYear')} <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a> - Powered By <a href="http://jeesite.com" target="_blank">JeeSite</a> ${fns:getConfig('version')}
    </div>


    <!--[if lt IE 9]>
    <script src="${ctxStatic}/ace/components/html5shiv/dist/html5shiv.js"></script>
    <script src="${ctxStatic}/ace/components/respond/dest/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${ctxStatic}/ace/components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/ace/components/layer/layer.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {

            //登录
            $("#loginForm").validate({
                rules: {
                    validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
                },
                messages: {
                    username: {required: "请填写用户名."},
                    password: {required: "请填写密码."},
                    validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
                },
                errorLabelContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    error.appendTo($("#loginError").parent());
                }
            });
        });
        // 如果在框架或在对话框中，则弹出提示并跳转到首页
        if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
            alert('未登录或登录超时。请重新登录，谢谢！');
            top.location = "${ctx}";
        }



        /*$('#login_btn').on('click', function(){
            var num=0;
            var str="";
            $("input[type$='text']").each(function(n){
                if($(this).val()=="")
                {

                    layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                        title: '提示框',
                        icon:0,
                    });
                    num++;
                    return false;
                }
            });
            if(num>0){  return false;}
            else{
                layer.alert('登录成功！',{
                    title: '提示框',
                    icon:1,
                });
                location.href="index.html";
                layer.close(index);
            }

        })*/
    </script>
</body>
</html>