<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>스마트 관광 Web Portal</title>

    <link rel="stylesheet" type="text/css" href="../../resources/css/fonts.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/loginStyles.css">

    <script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">

        // var CONTEXT_PATH = "/web";
        var CONTEXT_PATH = "";

        $(document).ready(function(){
            //alert(CONTEXT_PATH);

            getCookie('dt_no', 'bi_id');

            $(window).resize(function(){
                $('#loginArea').css({
                    position:'absolute',
                    left: ($(window).width() - $('#loginArea').outerWidth())/2,
                    top: ($(window).height() - $('#loginArea').outerHeight())/2-10
                });
            }).resize();

            $("#btnLogin").on("click", onClick_Login);

            $("#bi_id").keydown(function(key){
                if(key.keyCode == 13){ // enter키
                    onClick_Login();
                }
            });

        });

        function onClick_Login(){

            var json = {
                dt_no : $("#dt_no").val(),
                bi_id : $("#bi_id").val()
            };

            for( var str in json){
                if(json[str].length == 0){
                    alert($("#"+str).attr("placeholder") + "를 입력해주세요.");
                    $("#"+str).focus();
                    return;
                }
            }

            //alert(document.getElementById("check1").checked);
            if( document.getElementById("check_id").checked  ){
                setCookie("dt_no", $("#dt_no").val(), "bi_id", $("#bi_id").val());
            }else{
                clearCookie("dt_no", $("#dt_no").val(), "bi_id", $("#bi_id").val() );
            }

// 	if($("#bi_id").val().length <=0 || $("#bi_pw").val().length <=0 ){
// 		alert("ID, PW 확인");
// 		return;
// 	}

            $.ajax({
                type : "POST",
                //url : CONTEXT_PATH + "/login",  // test Table
                url : CONTEXT_PATH + "/login",  // DT_USER Table
                //asnyc : true,
                data : JSON.stringify({
                    dt_no : $("#dt_no").val(),
                    bi_id : $("#bi_id").val()
                    //	user_id : $("#bi_id").val(),
                    //	user_password : $("#bi_pw").val()
                }),
                contentType : "application/json",
                dataType : "json",
                beforeSend : function(xmlHttpRequest) {
                    xmlHttpRequest.setRequestHeader("ajax", true);
                },
                success : function(result){
                        loginSuccess();
                },
                error : function(request, status, error) {
                    alert("해당 사용자가 없습니다. 사원번호 및 BI 아이디를 확인바랍니다.");
                    //	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }

            });

        }

        function loginSuccess(){

            $.ajax({
                type : "GET",
                url : CONTEXT_PATH + "/main",
                success : function(result){
                    location.href= CONTEXT_PATH + "/main";
                },
                error : function(request, status, error) {
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        }

        // 아이디 쿠키 저장
        function setCookie(v_dt_no, dt_no_value, v_bi_id, bi_id_value){
            var vCookie = "";
            vCookie += v_dt_no + "=" + dt_no_value + ";";
            document.cookie = vCookie;

            vCookie = "";
            vCookie += v_bi_id + "=" + bi_id_value + ";";
            document.cookie = vCookie;

        }

        // 아이디 쿠키에서 가져오기
        function getCookie(v_dt_no, v_bi_id){
            var vCookies = document.cookie.split(";");

            for(var i in vCookies){
                if(vCookies[i].search(v_dt_no) != -1){
                    $("#dt_no").val( vCookies[i].replace(v_dt_no + "=", "").replace(/^\s+|\s+$/g, "") ); //공백제거
                }
                if(vCookies[i].search(v_bi_id) != -1){
                    $("#bi_id").val( vCookies[i].replace(v_bi_id + "=", "").replace(/^\s+|\s+$/g, "") );
                }
            }
        }

        //쿠키 삭제
        function clearCookie(v_dt_no, dt_no_value, v_bi_id, bi_id_value){
            var date = new Date();
            date.setDate(date.getDate()-1);

            var vCookie = "";
            vCookie +=  v_dt_no + "=" + dt_no_value + ";";
            vCookie += "Expires=" + date.toUTCString();
            document.cookie = vCookie;

            vCookie = "";
            vCookie +=  v_bi_id + "=" + bi_id_value + ";";
            vCookie += "Expires=" + date.toUTCString();
            document.cookie = vCookie;
        }


    </script>

</head>
<body>

<form name="login_value">
</form>

<div id="loginWrap">
    <div id="loginArea" style="position: absolute; left: 412.5px; top: 152px;">
        <div class="loginBox">
            <h1>Login</h1>
            <p>스마트 관광에 오신것을 환영합니다.</p>
            <div class="login_input">
                <div class="login">
                    <!--           <input id="bi_id" type="text" class="login-form" placeholder="아이디" style="width:360px;" > -->
                    <input id="dt_no" type="text" class="login-form" placeholder="사원 ID" style="width:360px;">
                </div>
                <div class="login">
                    <!--           <input id="bi_pw" type="password" class="login-form" placeholder="패스워드" style="width:360px;"> -->
                    <input id="bi_id" type="text" class="login-form" placeholder="비밀번호" style="width:360px;">
                </div>
                <div class="login-check">
                    <input type="checkbox" id="check_id" checked="checked">
                    <label for="check_id" class="checkbox">아이디 저장</label>
                </div>
            </div>
            <div class="btnArea">
                <button id="btnLogin" class="btn01">LOGIN</button>
            </div>
        </div>
        <div class="contact">아이디가 없으신 분은 시스템관리자에게 문의하시기 바랍니다.<br>
            시스템 관리자 : 미정    e-mail : 경주@정부.or.kr</div>
    </div>
</div>



</body>





</head></html>
