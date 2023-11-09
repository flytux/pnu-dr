<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-main">
    <main id="main">
        <section class="sec-1">
        <!-- CONTENT HEADER -->
            <header>
                <div class="header-item">
                    <!-- <h2 class="sec-title"></h2> -->
                </div>
                <!-- <div class="header-item"></div> -->
            </header>
            <!-- /END CONTENT HEADER -->
                
			<div class="accordion">
				<div class="card">
				   <div class="card-header" id="heading4">
				       <button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse4" data-expanded="true" data-controls="collapse4">
				                   국제학생증 발급
				       </button>
			       </div>
			       <div aria-labelledby="heading4" class="collapse show" id="collapse4">
			            <div class="card-body">
			                <ul class="ul-style-bullet">
			                    <li>
			                         <span class="dfn">국제학생증 발급을 위한 페이지입니다.</span>
			                         <a class="ml-2 link link-style-1 btn-sm" href="#none" onclick="applyForm(); return false;" title="국제학생증 발급 새창열림">☆ 국제학생증 발급</a>
			                    </li>
				           </ul>
			            </div>
			      </div>
			      <div style="display:none">
                    <form id="Form1" method="post" action="https://www.isic.co.kr/pusan/" target="_blank" accept-charset="EUC-KR" onsubmit="emulAcceptCharset(this)">
			            <input type="hidden" name="ref" id="ref"> <input type="hidden" name="juno1" id="juno1">
			            <input type="hidden" name="juno2" id="juno2"> <input type="hidden" name="kname" id="kname">
			            <input type="hidden" name="fname" id="fname"> <input type="hidden" name="lname" id="lname">
			            <input type="hidden" name="email" id="email"> <input type="hidden" name="tel1" id="tel1">
			            <input type="hidden" name="tel2" id="tel2"> <input type="hidden" name="tel3" id="tel3">
			            <input type="hidden" name="mtel1" id="mtel1"> <input type="hidden" name="mtel2" id="mtel2">
			            <input type="hidden" name="mtel3" id="mtel3"> <input type="hidden" name="grade" id="grade">
			            <input type="hidden" name="s_id" id="s_id"> <input type="hidden" name="zip1" id="zip1">
			            <input type="hidden" name="zip2" id="zip2"> <input type="hidden" name="addr1" id="addr1">
			            <input type="hidden" name="addr2" id="addr2"> <input type="hidden" name="subject" id="subject">
			        </form>
			     </div>
			</div>
        <!-- /END CONTENT  BODY-->
        </section>
    </main>
</div>

<script type="text/javascript">
    var paramMap = {};
	/***************************************************************************
	 * fn_initScreen  화면로딩
	 **************************************************************************/
    function fn_initScreen() {
    	   fn_setInit();
    }
	
    /***************************************************************************
     * fn_setInit  화면 초기값 세팅
     **************************************************************************/    
    function fn_setInit() {
    	
    	
    	fn_userSetting();
    }
    
    /***************************************************************************
     * fn_userSetting  사용자 정보 셋팅
     **************************************************************************/ 
     function fn_userSetting () {
    	
    	paramMap = {};
    	
    	gfn_ajax_request({
    		url : "/ost/md/globalstdtidissuance/selectUserInfo",
    		reqData : paramMap,
    		success : function(data, responseData) {
    			  if(data.length > 0) {
    				  //console.log(data[0]);
    				    $("#ref").val(data[0].REF);
    	                $("#juno1").val(data[0].JUNO1);
    	                $("#juno2").val(data[0].JUNO2);
    	                $("#kname").val(data[0].KNAME);
    	                $("#fname").val(data[0].FNAME);
    	                $("#lname").val(data[0].LNAME);
    	                $("#email").val(data[0].STDT_EMAIL);
    	                $("#tel1").val(data[0].TEL1);
    	                $("#tel2").val(data[0].TEL2);
    	                $("#tel3").val(data[0].TEL3);
    	                $("#mtel1").val(data[0].MTEL1);
    	                $("#mtel2").val(data[0].MTEL2);
    	                $("#mtel3").val(data[0].MTEL3);
    	                $("#grade").val(data[0].GRADE);
    	                $("#s_id").val(data[0].S_ID);
    	                $("#zip1").val(data[0].ZIP1);
    	                $("#zip2").val(data[0].ZIP2);
    	                $("#addr1").val(data[0].ADDR1);
    	                $("#addr2").val(data[0].ADDR2);
    	                $("#subject").val(data[0].SUBJECT); 
    			  }  	
    		}
    		
        });
    	
    };
    
    /***************************************************************************
     * applyForm  버튼클릭 이벤트
     **************************************************************************/ 
    function applyForm(){
        $("#Form1").submit();   
    }
    /***************************************************************************
     * emulAcceptCharset  호출 이벤트
     **************************************************************************/ 
    function emulAcceptCharset(form) {
        if (form.canHaveHTML) { // detect IE
            document.charset = form.acceptCharset;
        }
        return true;
    }
    
</script>