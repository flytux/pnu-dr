<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>부산대학교</title>
<link rel="shortcut icon" href="/common/images_ses/logo.ico"
    type="image/x-icon">
<script src="/common/js/jquery-3.6.0.min.js"></script>
<script src="/common/js/global.js"></script>

<script type="text/javascript">	
    $(document).ready(function(){
        
    	$('#btn_loginCheck').bind('click' , fn_loginChk );    	   
    	
    	$('#userID').bind('onkeydown' , function(e){
	       if(e.keyCode == 13){
	    	   $('btn_login').setFocus();
	           fn_loginChk();
	       }
	    });
    });
    
    var fn_loginChk = function(){
    	
        var checkInfo = [
              {id: 'USER_ID', mandatory: true}
            , {id: 'PWD', mandatory: true}
        ];
        
        gCsrfTokenHeaderName = '${_csrf.headerName}';
        gCsrfTokenParameterName = '${_csrf.parameterName}';
        gCsrfToken = '${_csrf.token}';
        
        document.cookie = "MENU_CD=";
        
        var form = $('<form method="POST" action="/login/loginCheck">');
        form.append('<input type="hidden" name="USER_ID" value="' + $('#userID').val() + '">');
        form.append('<input type="hidden" name="PWD" value="' + $('#userPW').val() + '">');
        form.append('<input type="hidden" name="'+gCsrfTokenParameterName+'" value="'+gCsrfToken+'" />');
        
        $('body').append(form);
        form.submit().remove();      
    };
</script>
<link
    href="/common/css/bootstrap.min.css?postfix=16376500005523133.623614993344"
    type="text/css" rel="stylesheet">
<link
    href="/common/css/common_ses.css?postfix=16376500005538941.626367782286"
    type="text/css" rel="stylesheet">
<link
    href="/common/css/style_ses.css?postfix=16376500005535792.982729979998"
    type="text/css" rel="stylesheet">
<link
    href="/common/css/common_ses.css?postfix=16376500005539588.028815907175"
    type="text/css" rel="stylesheet">
<link
    href="/common/css/style_ses.css?postfix=16376500005537726.828628042641"
    type="text/css" rel="stylesheet">
<link
    href="/common/css/loading.css?postfix=16376500005542918.590875593654"
    type="text/css" rel="stylesheet">
<link
    href="/common/css/type01.css?postfix=16376500005546487.872793502891"
    type="text/css" rel="stylesheet">
<link
    href="/common/css/type-color.css?postfix=16376500005549924.944726331189"
    type="text/css" rel="stylesheet">
</head>
<body class="" style="">
    <div id="wq_uuid_4" class="w2group wrapper login">
        <div id="wq_uuid_5" class="w2group login-box">
            <div id="wq_uuid_6" class="w2group login-header">
                <div id="wq_uuid_7" class="w2textbox text-lg"></div>
                <div id="wq_uuid_8" class="w2textbox text">PUSAN NATIONAL
                    UNIVERSITY</div>
            </div>
            <div id="wq_uuid_9" class="w2group login-body">
                <div id="wq_uuid_10" class="w2group container">
                    <div id="wq_uuid_11" class="w2group row">
                        <div id="wq_uuid_12" class="w2group col-sm-6">
                            <h1 id="wq_uuid_13" class="w2group login-title">
                                <img id="wq_uuid_14"
                                    src="/common/images_ses/logo.svg?postfix=16376500006045751.778511301287"
                                    class="w2image logo" alt="부산 대학교">
                            </h1>
                            <div id="wq_uuid_15" class="w2group text-box">
                                <div id="wq_uuid_16" class="w2textbox text-lg">학생지원시스템</div>
                                <div id="wq_uuid_17" class="w2textbox text">부산대학교 학생지원시스템에 오신 것을 환영합니다!</div>
                            </div>
                        </div>
                        <div id="wq_uuid_18" class="w2group col-sm-6">
                            <div id="wq_uuid_19" class="w2group form-box">
                                <h2 id="wq_uuid_20" class="w2textbox form-title">로그인</h2>
                                <form id="wq_uuid_21" class="w2group ">
                                    <div id="wq_uuid_22" class="w2group form-group">
                                        <div id="wq_uuid_23" class="w2group form-item">
                                            <input id="userID" class="w2input form-control" type="text"
                                                placeholder="사용자 아이디"><input id="userPW"
                                                class="w2input form-control" type="password"
                                                placeholder="비밀번호">
                                        </div>
                                        <div id="btn_loginCheck" class="w2group form-item">
                                            <button id="btn_login"
                                                class="w2textbox btn btn-primary login-btn" type="button">로그인</button>
                                        </div>
                                    </div>
                                    <div id="wq_uuid_28" class="w2group form-group">
                                        <ul id="wq_uuid_29" class="w2group link-list">
                                            <li id="wq_uuid_30" class="w2group "><a id="btn_findID"
                                                class="w2anchor2 " href="javascript:void(null);">아이디 찾기</a></li>
                                            <li id="wq_uuid_32" class="w2group "><a id="btn_initPWD"
                                                class="w2anchor2 " href="javascript:void(null);">비밀번호 초기화</a></li>
                                        </ul>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>