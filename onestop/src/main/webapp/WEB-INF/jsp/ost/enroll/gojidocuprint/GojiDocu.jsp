<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
    <main id="main">
        <section class="sec-1">
            <!-- CONTENT HEADER -->
            <header>
                <div class="header-item">
                    <h2 class="sec-title"></h2>
                </div>
                <div class="header-item"></div> 
            </header>
            <!-- /END CONTENT HEADER -->

            <!-- CONTENT BODY -->
            <div class="sec-body">
                <!-- 메세지 박스 -->
                <div class="message-box">
                    <div class="message-box-inner">
                        <div class="message-body" id="list1">
                            <ul class="list list-style-1">
                                <li><span class="text-primary">등록금 문의: (재무과)051-510-1051, 1059</span></li>
                                <li><span class="" style="color: purple">입학 문의: (입학과)051-510-1203, 1064, (국제교류본부)051-510-3856</span></li>
                                <li><span class="">장학금, 대출 문의: (학생과)051-510-1272, 1281~2</span></li>
                                <li><span class="">학생의료공제회비 문의: (학생과)051-510-1271</span></li>
                                <li><span class="">계약학과 문의: (산학협력단 연구회계과)051-510-7783</span></li>
                                <!-- 
                                <li><span class="">학생지원시스템 사용 문의: (정보화본부)051-510-7469</span></li>
                                 -->
                                <li><span class="">외국인 유학생 보험 공지 INTL. Student Insurance Notice</span><a class="ml-2 link link-style-1 btn-sm" href="https://international.pusan.ac.kr/international/14764/subview.do?enc=Zm5jdDF8QEB8JTJGYmJzJTJGaW50ZXJuYXRpb25hbCUyRjI2MzAlMkZhcnRjbExpc3QuZG8lM0Y%3D" target="_blank" title="외국인 유학생 보험 공지 새창 열기"> 바로가기</a></li>
                                <li><span class="" style="color: orange">등록금 고지서 출력 오류 발생시 조치방법 안내</span><a class="ml-2 link link-style-1 btn-sm" href="#none" onclick="selectMenu('000000000000274');" onkeypress="this.onclick" title="등록금 고지서 출력 오류 발생시 조치방법 안내 바로가기"> 바로가기</a></li>
                            </ul>
                        </div>
                        <div class="message-body" id="list2">
                            <ul class="list list-style-1">
                                <li><span class="" style="color:blue">계절수업 등록금 문의: (교육혁신과) 051-510-1221, 등록금 문의 : (재무과) 051-510-1051, 1059</span></li>
                                <li><span class="" style="">장학금,대출 문의: (학생과) 051-510-1272, 1281~2</span></li>
                                <!-- 
                                <li><span class="" style="">학생지원시스템 사용 문의: (정보화본부) 051-510-7469</span></li>
                                 -->
                                <li><span class="" style="color: orange">등록금 고지서 출력 오류 발생시 조치방법 안내</span><a class="ml-2 link link-style-1 btn-sm" href="#none" onclick="selectMenu('000000000000274');" onkeypress="this.onclick" title="등록금 고지서 출력 오류 발생시 조치방법 안내 바로가기"> 바로가기</a></li>
                            </ul>
                        </div>
                        <div class="message-body" id="list3">
                            <ul class="list list-style-1">
                                <li><span class="" style="color:blue">등록금 문의 : (재무과) 051-510-1051, 1059</span></li>
                                <!-- 
                                <li><span class="" style="">학생지원시스템 사용 문의: (정보화본부) 051-510-7469</span></li>
                                 -->
                                <li><span class="" style="color: orange">등록금 고지서 출력 오류 발생시 조치방법 안내</span><a class="ml-2 link link-style-1 btn-sm" href="#none" onclick="selectMenu('000000000000274');" onkeypress="this.onclick" title="등록금 고지서 출력 오류 발생시 조치방법 안내 바로가기"> 바로가기</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- END 메세지 박스 -->
                <input id="hdYear" value="" type="hidden" name="hdYear">
                <input id="hdTerm" value="" type="hidden" name="hdTerm">
                <input id="hdDepositYn" value="N" type="hidden" name="hdDepositYn">
                <input type="hidden" id="enrollUserID">
                <input type="hidden" id="enrollGubun">
                <input type="hidden" id="enrollStdtGcd">
                <input type="hidden" id="contractFlag">
                <input type="hidden" id="hdBunHal">
                <input id="hdHakBuGuBun" type="hidden">
                <input id="hdContractDepartmentYn" type="hidden" name="hdContractDepartmentYn">
                <!-- 검색영역 start -->
                <section class="sec-2">
                    <div class="sec-body">
                        <div class="search-box">
                            <div class="b-table-box flex-col-1" role="table" aria-label="검색">
                                <div class="b-row-box" role="row">
                                    <div class="b-row-item">
                                        <div class="b-title-box" role="rowheader">
                                            <label>고지서 구분</label>
                                        </div>
                                        <div class="b-con-box" role="cell">
                                            <section class="">
                                                <div class="sec-body">
                                                    <div class="custom-control custom-radio custom-control-inline" id ="dvLine1" style = "display:none">
                                                        <input type="radio" id="customRadioInline1" name="customRadioInline" class="custom-control-input" value="customRadioInline1"> <label class="custom-control-label" for="customRadioInline1">신입생/편입생</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline" id ="dvLine2" style = "display:none">
                                                        <input type="radio" id="customRadioInline2" name="customRadioInline" class="custom-control-input" value="customRadioInline2"> <label class="custom-control-label" for="customRadioInline2">재학생</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline" id ="dvLine3" style = "display:none">
                                                        <input type="radio" id="customRadioInline3" name="customRadioInline" class="custom-control-input" value="customRadioInline3"> <label class="custom-control-label" for="customRadioInline3">분할납부</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline" id ="dvLine4" style = "display:none">
                                                        <input type="radio" id="customRadioInline4" name="customRadioInline" class="custom-control-input" value="customRadioInline4"> <label class="custom-control-label" for="customRadioInline4">복수전공(추가납부)</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline" id ="dvLine5" style = "display:none">
                                                        <input type="radio" id="customRadioInline5" name="customRadioInline" class="custom-control-input" value="customRadioInline5"> <label class="custom-control-label" for="customRadioInline5">계절수업 고지서</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline" id ="dvLine6" style = "display:none">
                                                        <input type="radio" id="customRadioInline6" name="customRadioInline" class="custom-control-input" value="customRadioInline6"> <label class="custom-control-label" for="customRadioInline6">수료후 연구생/무논문학위취득신청자</label>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- /END 검색영역 -->

                <div class="accordion">
                    <div class="card">
                        <div class="card-header" id="heading1">
                            <button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse" data-expanded="true" data-controls="collapse"><span id="lblTitle"></span> 고지서 출력 및 납부확인</button>
                        </div>
                        <div id="collapse" class="collapse show" aria-labelledby="heading1">
                            <div class="search-box">
                                <div class="" id="">
                                    <label class="text-left dfn ml-2 mt-2 text-Schd"></label>
                                </div>
                                <div class="b-table-box flex-col-3" role="table" aria-label="조회">
                                    <div class="b-row-box" role="row">
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label class="" data-lang>대학(원)</label>
                                            </div>
                                            <div class="b-con-box" role="cell" data-bind="text: collCdKorNm">
                                            </div>
                                        </div>
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label class="" data-lang>학위</label>
                                            </div>
                                            <div class="b-con-box" role="cell" data-bind="text: degCourseGcdKorNm" >
                                            </div>
                                        </div>
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label data-lang>학과(부)</label>
                                            </div>
                                            <div class="b-con-box" role="cell" data-bind="text: deptCdKorNm" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="b-row-box" role="row">
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label data-lang>학번</label>
                                            </div>
                                            <div class="b-con-box" role="cell" data-bind="text: userId" >
                                            </div>
                                        </div>
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label data-lang>학년</label>
                                            </div>
                                            <div class="b-con-box" role="cell" data-bind="text: stdtYearGcdKorNm" >
                                            </div>
                                        </div>
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label data-lang>성명</label>
                                            </div>
                                            <div class="b-con-box" role="cell" data-bind="text: nm" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="b-row-box" role="row">
                                        <span class="text-danger dfn ml-2 mt-2" id="lblMsg"></span>
                                        <span class="text-danger dfn ml-2 mt-2" id="lblMsg3"></span>
                                    </div>
                                    <div class="b-row-box" role="row">
                                        <!-- 메세지 박스 -->
                                        <div class="message-box-inner">
                                            <div class="message-body">
                                                <ul class="list list-style-1 ml-2 mt-2 mb-2">
                                                    <li><span class="dfn">영수증 출력 : 등록금 납부 후 바로 확인</span><a class="ml-2 link link-style-1 btn-sm" href="#none" onclick="selectMenu('000000000000075');" onkeypress="this.onclick" title="납부확인(영수증출력) 바로가기"> 바로가기</a></li>
                                                    <li id="jaehakDues1">농협, 부산은행, 하나은행 : 납부 후 바로 확인(실시간)</li>
                                                    <li id="jaehakDues2">국민은행, 우리은행, 신한은행 : 다음날 9시 이후 확인</li>
                                                    <li id="seasonDues" class="dfn">등록금을 납부하지 않으면 수강신청 내역은 삭제 처리됩니다.</li>
                                                    <li id="hylWonwooDues1">
                                                        원우회비 납입고지서(1학년)
                                                        <span id = "download_target1" class="badge bg-silver">
                                                            <!--
                                                            <a class="btn btn-sm btn-primary" href="/file/download.do?iC8/KuXS/gvcEdoiDg+3hNZdBGRwREqHPFE47z0ppwosQmz9Pc/7456nTLlhUzGaDAX6GjXNsgoX5vIms76bAw==" data-lang="">다운로드
                                                                <i class="bi bi-download" aria-hidden="true"></i>
                                                            </a>
                                                            -->
                                                        </span>
                                                    </li>
                                                    <li id="hylWonwooDues2">
                                                        원우회비 납입고지서(2학년)
                                                        <span id = "download_target2" class="badge bg-silver">
                                                            <!--
                                                            <a class="btn btn-sm btn-primary" href="/file/download.do?iC8/KuXS/gvcEdoiDg+3hNZdBGRwREqHPFE47z0ppwosQmz9Pc/7456nTLlhUzGaDAX6GjXNsgoX5vIms76bAw==" data-lang="">다운로드
                                                                <i class="bi bi-download" aria-hidden="true"></i>
                                                            </a>
                                                            -->
                                                        </span>
                                                    </li>
                                                    <li id="hylWonwooDues3">
                                                        원우회비 납입고지서(3학년)
                                                        <span id = "download_target3" class="badge bg-silver">
                                                            <!--
                                                            <a class="btn btn-sm btn-primary" href="/file/download.do?iC8/KuXS/gvcEdoiDg+3hNZdBGRwREqHPFE47z0ppwosQmz9Pc/7456nTLlhUzGaDAX6GjXNsgoX5vIms76bAw==" data-lang="">다운로드
                                                                <i class="bi bi-download" aria-hidden="true"></i>
                                                            </a>
                                                            -->
                                                        </span>
                                                    </li>
                                                    <li id="lblWonwooDuesInfo">"원우회비는 경영대학원생에게 사용되는 원우회 자체 경비입니다" (징수주체 : 경영대학원원우회)</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- END 메세지 박스 -->
                                    </div>
                                </div>
                                <!-- /END 기본정보 영역 -->

                                <div class="btn-box">
                                    <div  id ="div_button" class="form-row justify-content-center">
                                        <div class="col-auto">
                                            <button class="btn btn-primary" id="btnPrintKor" type="button" onclick="enterClick(false);" data-lang>고지서출력</button>
                                        </div>
                                        <div class="col-auto">
                                            <button class="btn btn-primary" id="btnPrintEng" type="button" onclick="enterClick(true);" data-lang>Bill print out</button>
                                        </div>
                                        <div class="col-auto">
                                            <button class="btn btn-primary" type="button" id="divPaymentConfirmationBtn" onclick="fnConfirmReport();" data-lang>납입확인서 출력</button>
                                        </div>
                                    </div>
                                </div>


                                <div id="doc" class="ml-2" style="">
                                    <span class="" id="doc1">※ 가상계좌란 합격자 개인에게 부여한 계좌이므로 고지서 하단의 은행별 가상계좌 중 선택하여 입금하면 됨.</span><br> 
                                    <span class="text-primary" id="doc2">※ 외국인 학생은 "Bill print out" 버튼을 클릭해 주시기 바랍니다.</span><br> 
                                    <span class="text-primary" id="doc3">※ For international students, please click the "Bill print out" button below.</span>
                                </div>

                                <!-- 납부 및 등록방법 게시글 -->
                                <div class="accordion mt-4">
                                    <div class="card">
                                        <div class="card-header" id="heading1">
                                            <button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true" data-controls="collapse1">납부기간</button>
                                        </div>
                                        <div id="collapse1" class="collapse show" aria-labelledby="heading1">
                                            <div class="card-body">
                                                <span id="lblPaymentPeriod"> </span> <!-- 납부기간 -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="heading2">
                                            <button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse2" data-expanded="true" data-controls="collapse2">납부장소 및 확인</button>
                                        </div>
                                        <div id="collapse2" class="collapse show" aria-labelledby="heading2">
                                            <div class="card-body" id="freshmenNabbuConf">
                                                <span>- 납부은행 : <span class="text-primary">농협, 부산은행, 하나은행</span> 전국지점</span> <br>
                                                <span>- 납부확인 : 납부 후 바로 확인(실시간)</span>
                                            </div>
                                            <div class="card-body" id="jaehakNabbuConf">
                                                <span>&nbsp;-&nbsp;<a href="http://www.nonghyup.com/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기">농협</a>, 
                                                <a href="http://www.busanbank.co.kr/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기"> 부산은행</a>, 
                                                <a href="http://www.hanabank.com/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기"> 하나은행</a> : 납부 후 바로 확인(실시간)<br>
                                                &nbsp;-&nbsp;
                                                <a href="http://www.kbstar.com/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기">국민은행</a>, 
                                                <a href="http://www.wooribank.com/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기"> 우리은행</a>, 
                                                <a href="http://www.shinhan.com/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기"> 신한은행</a> : 다음날 9시 이후 확인</span>
                                            </div>
                                            
                                            <div class="card-body" id="seasonConf">
                                                <span>&nbsp;-&nbsp;<a href="http://www.nonghyup.com/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기">농협</a>, 
                                                <a href="http://www.busanbank.co.kr/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기"> 부산은행</a> : 납부 후 바로 확인(실시간) </span>
                                                <!--, 
                                                <a href="http://www.hanabank.com/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기"> 하나은행</a> : 납부 후 바로 확인(실시간)<br>
                                                &nbsp;-&nbsp;<a href="http://www.kbstar.com/" target="_blank" style="TEXT-DECORATION: underline" class="text-primary" title="새창열기">국민은행</a> </span><span>: 다음날 9시 이후 확인</span>
                                                -->
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="card" id="headingCard3">
                                        <div class="card-header" id="heading3">
                                            <button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse3" data-expanded="true" data-controls="collapse3">본 홈페이지에서 교부되는 고지서는 다음과 같습니다.</button>
                                        </div>
                                        <div id="collapse3" class="collapse show" aria-labelledby="heading3">
                                            <div class="card-body">
                                                <!-- <span class="" style="color:purple">- 학부 : 등록금 납입고지서 1부, (학생회비+의료공제비) 1부 [계약학과 제외]</span> <br>
                                                <span class="" style="color:purple">- 대학원 : 등록금 납입고지서 1부, 의료공제비 1부 [계약학과 제외]</span>  -->
                                                <span id="lblBillInfo" class="text-info">
                                                    - 학부 : 등록금 납입고지서 1부, 학생회비 1부 [계약학과 제외]<br> - 대학원 : 등록금 납입고지서 1부 [계약학과 제외]
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="heading4">
                                            <button class="btn btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse4" data-expanded="true" data-controls="collapse4">등록금 납부방법</button>
                                        </div>
                                        <div id="collapse4" class="collapse show" aria-labelledby="heading4">
                                            <div class="card-body">
                                                <span class="dfn">- 인터넷뱅킹을 이용하실 경우</span><br>
                                                    <span class="">① Homepage 에서 납입금액 확인</span><br>
                                                    <span class="">② 수납은행 인터넷(PC뱅킹, Phone뱅킹 등) 서비스 이용</span><br>
                                                    <span class="">등록금 납부(필요시 수납은행에 영수증 요청가능)</span><br>
                                                <span class="dfn">- 은행에 직접 납부하실 경우</span><br>
                                                <span class="">① Homepage 에서 납입금액 확인</span><br>
                                                <span class="">② 부산대학교 인터넷 고지서 출력</span><br>
                                                <span class="">③ 고지서에 기재된 각 은행에 등록금 납부</span><br>
                                                <span class="">④ 영수증 보관</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 납부 및 등록방법 게시글 END -->


                            </div>
                        </div>
                    </div>
                    <!-- 아코디언 END -->

                </div>
                <!-- /END CONTENT  BODY-->
        </section>
    </main>
</div>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/javascript">

    /***************************************************************************
     * 변수
     **************************************************************************/
    var paramMap ={};
    var gojiDocuChk = ""; //고지서구분 체크된 id값 저장 -- 최초 : 신입생/편입생
    var printMsg = "";
    //보험료
    var yearFo="";
    var termFo;
    
    var hjStaGcd = scwin.loginUser.hjStaGcd;
    
    /***************************************************************************
     * fn_initScreen  화면로딩
     **************************************************************************/
    function fn_initScreen() {
    	
    	fn_setInit();
        
        $("input[name='customRadioInline']").change(function() {
            fn_Chkschd();   
            //체크된 값
            gojiDocuChk = $("input:radio[name='customRadioInline']:checked").val();
            
            if(gojiDocuChk=="customRadioInline1"){ //신입생,편입생
                initNewHide();
            }else if (gojiDocuChk=="customRadioInline2"){ //재학생
                initRegHide();
            }else if (gojiDocuChk=="customRadioInline3"){ //분할납부
                initDivisionHide();
            }else if (gojiDocuChk=="customRadioInline4"){ //복수전공
                initBoksuHide();
            }else if (gojiDocuChk=="customRadioInline5"){ //계절수업
                initSeasonHide();
            }else if (gojiDocuChk=="customRadioInline6"){ //수료후연구생/무논문학위취득신청자 
                initNonHide();
            }
            
        });
    }
    /***************************************************************************
     * fn_setInit  화면 초기값 세팅
     **************************************************************************/    
    function fn_setInit() {
        gfn_com_dataBind($("#main"), scwin.loginUser);
        fn_ChkGojiGbn();
        //fn_Chkschd();    //년도 학기 조회

        
        $("#lblMsg").hide();  //신입생/편입생, 재학생
        $("#lblMsg3").hide();  //재학생, 분할납부
        $('#hylWonwooDues1').hide(); //신입생/편입생, 재학생
        $('#hylWonwooDues2').hide(); //신입생/편입생, 재학생
        $('#hylWonwooDues3').hide(); //신입생/편입생, 재학생
        $('#lblWonwooDuesInfo').hide(); //재학생
        
        $('#jaehakDues1').hide();
        $('#jaehakDues2').hide();
        $('#seasonDues').hide();
        $('#jaehakNabbuConf').hide();
        $('#seasonConf').hide();
        
        
        $('#customRadioInline1').prop('checked', true); //고지서 구분 - 신입생으로 세팅
        $('#enrollStdtGcd').val('0001'); //처음 신입생으로 세팅 
        
        $("#list2").hide();
        $("#list3").hide();
        
        $("#btnPrintEng").show();
    }
    
    
    //신입생/편입생 화면 세팅
    function initNewHide() {
        fn_freshmenRgChk(); //신입생등록여부
        
        $("#lblBillInfo").attr('class', 'text-info'); //본홈페이지에서 교부되는~
        $('#jaehakDues1').hide();
        $('#jaehakDues2').hide();
        $('#seasonDues').hide();
        $('#freshmenNabbuConf').show();
        $("#freshmenNabbuConf").html("<span>- 납부은행 : <span class='text-primary'>농협, 부산은행, 하나은행</span> 전국지점</span> <br><span>- 납부확인 : 납부 후 바로 확인(실시간)</span>");
        
        $('#jaehakNabbuConf').hide();
        $('#seasonConf').hide();
        
        $('#doc').show();
        $('#doc1').show();
        $('#doc2').show();
        $('#doc3').show();
        
        $('#enrollStdtGcd').val('0001'); 
        
        $("#list1").show();
        $("#list2").hide();
        $("#list3").hide();
        
        $("#headingCard3").show();
        $("#btnPrintEng").show();
        
        
    }
    
    //재학생 화면 세팅
    function initRegHide() {
        $("#lblTitle").text("재학생");
        $("#lblBillInfo").html("○학부 <br>&nbsp;-등록금 납입고지서 1부 <br>&nbsp;-(학생회비) 1부<br>&nbsp;-동문회비 1부 일부해당자에 한함" + "<br>○대학원 <br>&nbsp;-등록금 납입고지서 1부<br>&nbsp;-동문회비 1부 일부해당자에 한함");
        $("#lblBillInfo").attr('class', 'text-dark');
        
        $('#jaehakDues1').show();
        $('#jaehakDues2').show();
        $('#seasonDues').hide();
        $('#freshmenNabbuConf').hide();
        $('#jaehakNabbuConf').show();
        $('#seasonConf').hide();
        $('#doc').hide();
        
        $('#hdBunHal').val('1');
        $('#enrollStdtGcd').val('0004');
        
        $("#list1").show();
        $("#list2").hide();
        $("#list3").hide();
        
        $("#headingCard3").show();
        $("#btnPrintEng").show();

   
    }
    
    //분할납부 화면 세팅
    function initDivisionHide() {
        $("#lblTitle").text("분할납부");
        
        $('#jaehakDues1').show();
        $('#jaehakDues2').show();
        $('#seasonDues').hide();
        $('#freshmenNabbuConf').show();
        $('#jaehakNabbuConf').hide();
        $('#seasonConf').hide();
        $('#doc').show();
        $('#doc1').show();
        $('#doc2').hide();
        $('#doc3').hide();
        
        $('#enrollStdtGcd').val('0004');
        
        $("#list1").hide();
        $("#list2").show();
        $("#list3").hide();
        
        $("#headingCard3").hide();
        $("#btnPrintEng").show();
    }
    
    //복수전공 화면 세팅
    function initBoksuHide() {
        $("#lblTitle").text("복수전공(추가납부)");
        
        $('#jaehakDues1').show();
        $('#jaehakDues2').show();
        $('#seasonDues').hide();
        $('#freshmenNabbuConf').show();
        $('#jaehakNabbuConf').hide();
        $('#seasonConf').hide();
        $('#doc').show();
        $('#doc1').show();
        $('#doc2').hide();
        $('#doc3').hide();
        
        $('#enrollStdtGcd').val('0004');
        
        $("#list1").hide();
        $("#list2").hide();
        $("#list3").show();
        
        $("#headingCard3").hide();
        $("#btnPrintEng").hide();
    }
    
    //계절수업 화면 세팅
    function initSeasonHide() {
        $("#lblTitle").text("계절수업");
        
        $('#jaehakDues1').hide();
        $('#jaehakDues2').hide();
        $('#seasonDues').show();
        $('#freshmenNabbuConf').hide();
        $('#jaehakNabbuConf').hide();
        $('#seasonConf').show();
        $('#doc').show();
        $('#doc1').show();
        $('#doc2').hide();
        $('#doc3').hide();
        
        $('#enrollStdtGcd').val("");
        $('#hdBunHal').val("2");
        
        $("#list1").hide();
        $("#list2").show();
        $("#list3").hide();
        
        $("#headingCard3").hide();
        $("#btnPrintEng").hide();
    }
    
    //수료후연구생/무논문학위취득신청자 
    function initNonHide() {
        $("#lblTitle").text("수료후연구생/무논문학위취득신청자");
        $("#lblBillInfo").html("<li>수료후연구생 : <span style='color:purple'>납입고지서 1부</span></li>" + "<li>특수대학원 무논문학위취득신청자 : <span style='color:purple'>납입고지서 1부</li>");
        $("#lblBillInfo").attr('class', 'text-dark');
        
        $('#jaehakDues1').show();
        $('#jaehakDues2').show();
        $('#seasonDues').hide();
        $('#freshmenNabbuConf').show();
        $("#freshmenNabbuConf").html("<li><a href='http://www.nonghyup.com/' target='_blank' style='TEXT-DECORATION: underline' class='link link-style-1' title='새창열기'>농협</a> : 납부 후 바로 확인(실시간)</li>");
        
        $('#jaehakNabbuConf').hide();
        $('#seasonConf').hide();
        $('#doc').show();
        $('#doc1').show();
        $('#doc2').hide();
        $('#doc3').hide();
        
        $('#enrollStdtGcd').val('0004');
        
        $("#list1").hide();
        $("#list2").hide();
        $("#list3").show();
        
        $("#headingCard3").show();
        $("#btnPrintEng").hide();
    }
    
    
    /***************************************************************************
     * fn_Chkschd  등록 학년도 학기 조회
     **************************************************************************/    
    function fn_Chkschd() {
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/selectSchd",
            success : function(data, responseData) {
                
                var termNm = "";
                // 보험료
                yearFo = data.SYEAR;
                termFo = data.TERM_GCD;
                
                if (gojiDocuChk=="customRadioInline5"){ //계절수업
                    $("#hdYear").val(data.SEASON_SYEAR);
                    $("#hdTerm").val(data.SEASON_TERM_GCD);
                    termNm = data.SEASON_TERM_GCD_NM;
                }else{
                    $("#hdYear").val(data.SYEAR);
                    $("#hdTerm").val(data.TERM_GCD);
                    termNm = data.TERM_GCD_NM;
                }
                
                if (gojiDocuChk=="customRadioInline4"){ //복수전공
                    $(".text-Schd").text(data.SYEAR + "학년도 " + termNm) + " 복수전공";
                }else{
                    $(".text-Schd").text(data.SYEAR + "학년도 " + termNm);
                }
                
                if(gojiDocuChk=="customRadioInline1"){
                    fn_freshmenRgChk(); //신입생등록여부
                }else if(gojiDocuChk=="customRadioInline3"){
                    if (data.length < 1) {
                        alert("출력기간이 아닙니다.");
                        return;
                    }
                    $('#hdBunHal').val(data.BUNHAL_CHASU);
                }
                
                
                if(gojiDocuChk=="customRadioInline4"){ // 복수전공
                    fn_chkPayPeriodBoksu(); //납부일자
                }else{
                    fn_chkPayPeriod(); //납부일자
                }
                
                if(gojiDocuChk=="customRadioInline4" || gojiDocuChk=="customRadioInline5" || gojiDocuChk=="customRadioInline6"){
                    $("#divPaymentConfirmationBtn").hide();
                }else{
                    
                    fnConfirmReport(); //납입확인서 출력
                }
                initGoji(true);
                $("#download_target").hide();
                
                
            }
        });
    }
    
    /***************************************************************************
     * fn_ChkGojiGbn  고지서구분 조회
     **************************************************************************/    
    function fn_ChkGojiGbn() {
        var searchParam = {

        };
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/selectGojiGbn",
            reqData : searchParam,
            success : function(data, responseData) {
                if(data.length > 0 ){
                    $(data).each(function(key, val) {
                    	//console.log(key);
                    	//console.log(val);
                        if(val.DISPLAY_GBN =="1"){
                            $('#dvLine1').show();
                            if(key =="0"){
                                $('#customRadioInline1').prop('checked', true); 
                                gojiDocuChk = 'customRadioInline1';
                                initNewHide();
                            }
                        }if(val.DISPLAY_GBN =="2"){
                            $('#dvLine2').show();
                            if(key =="0"){
                                $('#customRadioInline2').prop('checked', true); 
                                gojiDocuChk = 'customRadioInline2';
                                initRegHide();
                            }
                        }if(val.DISPLAY_GBN =="3"){
                            $('#dvLine3').show();
                            if(key =="0"){
                                $('#customRadioInline3').prop('checked', true); 
                                gojiDocuChk = 'customRadioInline3';
                                initDivisionHide();
                            }
                        }if(val.DISPLAY_GBN =="4"){
                            $('#dvLine4').show();
                            if(key =="0"){
                                $('#customRadioInline4').prop('checked', true); 
                                gojiDocuChk = 'customRadioInline4';
                                initBoksuHide();
                            }
                        }if(val.DISPLAY_GBN =="5"){
                            $('#dvLine5').show();
                            if(key =="0"){
                                $('#customRadioInline5').prop('checked', true); 
                                gojiDocuChk = 'customRadioInline5';
                                initSeasonHide();
                            }
                        }if(val.DISPLAY_GBN =="6"){
                            $('#dvLine6').show();
                            if(key =="0"){
                                $('#customRadioInline6').prop('checked', true); 
                                gojiDocuChk = 'customRadioInline6';
                                initNonHide();
                            }
                        }
                        // 납부일자 체크스 ENROLL_STDT_GCD 값 변경
                        if(val.학생구분 == "방문학생"){
                        	
                        	$('#enrollStdtGcd').val(val.ENROLL_STDT_GCD);
                        }
                        
                    });
                    
                }else{
                	
                	 $('#div_button').hide();
                }
            }
        	
        });
        
        fn_Chkschd();
    }

    
    /***************************************************************************
     * fn_chkPayPeriod  납부일자 조회
     **************************************************************************/    
    function fn_chkPayPeriod() {
        var newBunHal = ($('#hdBunHal').val() == "1" ) ? "" : $('#hdBunHal').val();
        
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "ENROLL_STDT_GCD" : $('#enrollStdtGcd').val(),   
                "BUNHAL_CHASU" : newBunHal
            };
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/selectChkPayPeriod",
            reqData : paramMap,
            success : function(data, responseData) {
                var html = "";
                var clrCss = "text-primary";
                if (data.length < 1) {
                    html += '납부기간이 아닙니다.';
                    clrCss = 'text-danger';
                } else {
                    
                    if(gojiDocuChk=="customRadioInline1"){
                        $("#enrollGubun").val("New");  //신입생 등록여부
                        $(data).each(function(key, val) {
                            html += val.입학구분 + " : " + val.납부기간 + "<br>";
                        });
                    }else if(gojiDocuChk=="customRadioInline2"){
                        $("#enrollGubun").val("Regular"); //재학생 등록여부
                        $(data).each(function(key, val) {
                            if (val.입학구분 == null || val.입학구분 == "") {
                                html += val.납부기간 + "<br>";
                            } else {
                                html += val.입학구분 + " : " + val.납부기간 + "<br>";
                            }
                        });
                    }else if(gojiDocuChk=="customRadioInline3"){
                        $("#enrollGubun").val("Division"); //분할납부 등록여부
                        $(data).each(function(key, val) {
                            html += val.납부기간;
                        });
                    }/* else if(gojiDocuChk=="customRadioInline4"){
                        $("#enrollGubun").val("Boksu"); //복수전공 등록여부
                        $(data).each(function(key, val) {
                            html += val.납부기간;
                        });
                    } */else if(gojiDocuChk=="customRadioInline5"){
                        $("#enrollGubun").val("Season"); //계절수업 등록여부
                        $(data).each(function(key, val) {
                            html += val.입학구분 + " : " + val.납부기간 + "<br>";
                        });
                    }else if(gojiDocuChk=="customRadioInline6"){
                        $("#enrollGubun").val(""); //수료후연구생/무논문학위취득신청자 등록여부
                        $(data).each(function(key, val) {
                            html += "<li>" + val.입학구분 + " : <span class='text-primary'>" + val.납부기간 + "</span></li>";
                        });
                    }
                }
                
                $("#lblPaymentPeriod").html(html);
                $("#lblPaymentPeriod").attr('class', clrCss);
            }
        });
        
    }
    
    /***************************************************************************
     * fn_chkPayPeriodBoksu  복수전공 납부일자 조회
     **************************************************************************/    
    function fn_chkPayPeriodBoksu() {
        
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "ENROLL_STDT_GCD" : $('#enrollStdtGcd').val() 
            };
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/billPrintChk2",
            reqData : paramMap,
            success : function(data, responseData) {
                
                var dataset1 = data[0];
                var dataset2 = data[1];
                var dataset3 = data[2];
                
                var html = "";
                var clrCss = "text-primary";
                
                if (data.length < 1) {
                    html += '납부기간이 아닙니다.';
                    clrCss = 'text-danger';
                } else {
                    
                    $("#enrollGubun").val("Boksu"); //복수전공 등록여부
                    $(dataset2).each(function(key, val) {
                        html += val.납부기간;
                    });
                }
                
                $("#lblPaymentPeriod").html(html);
                $("#lblPaymentPeriod").attr('class', clrCss);
            }
        });
        
    }
    /***************************************************************************
     * fn_freshmenRgChk  신입생 등록여부 조회
     **************************************************************************/        
    function fn_freshmenRgChk() {
        
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "PSWD": "",
                "ADMIN_ID": ""
            };
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/freshmenRegistYnChk",
            reqData : paramMap,
            success : function(data, responseData) {
                $(data).each(function(key, val) {
                    if (val.SMALL_GCD == "0007") {
                        $('#hdDepositYn').val("Y"); //예치금이 있을때
                    } else {
                        $('#hdDepositYn').val("N"); //예치금이 없을때
                    }
                    //alert(val.MSG); 화면 열릴때마다 자꾸타서 일단 주석 ,, TODO
                });
                
                setYechiInfo();
            }
        });
        
    }
    /***************************************************************************
     * setYechiInfo  예치금 안내 추가
     **************************************************************************/            
    function setYechiInfo() {
        if ($("#hdDepositYn").val() == "Y") {
            $("#lblTitle").text("등록확인 예치금");
            $("#lblBillInfo").html("&nbsp;- 예치금 납입고지서 1부");
        } else {
            $("#lblTitle").text("신입생 및 편입학생");
            $("#lblBillInfo").html("&nbsp;- 학부 : 등록금 납입고지서 1부, (학생회비+의료공제비) 1부 [계약학과 제외]<br>" + "&nbsp;- 대학원 : 등록금 납입고지서 1부, 의료공제비 1부 [계약학과 제외]");
        }
    }
    /***************************************************************************
     * fnConfirmReport  버튼 - 납입확인서 출력 -- 첫로딩시 자동 실행
     **************************************************************************/    
    function fnConfirmReport() {
        
        var hdDepositYn = $("#hdDepositYn").val(); //예치금
        var newBunHal = ($('#hdBunHal').val() == "") ? "1" : $('#hdBunHal').val();
        
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "BUNHAL_CHASU" : newBunHal
            };
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/payTuitChkFmPrtChk",
            reqData : paramMap,
            success : function(data, responseData) {
                
                var size = data.length;
                if (size > 0) {
                    $("#divPaymentConfirmationBtn").show();
                    
                    if (hdDepositYn == "Y") { //예치금이 있을때
                        printMsg = "등록_납입확인서(예치금)";
                        fn_openReport(printMsg);
                    } else {
                        printMsg = "등록_납입확인서";
                        fn_openReport(printMsg);
                    }
                    
                    
                } else {
                    //alert("출력할 데이터가 없습니다.");
                    $("#divPaymentConfirmationBtn").hide();
                }
            }
        });
        
    }
    /***************************************************************************
     * enterClick  버튼 - 고지서출력 
     **************************************************************************/    
    function enterClick(eng) {
        
        var newBunHal = ($('#hdBunHal').val() == "" || $('#hdBunHal').val() == "1" ) ? "" : $('#hdBunHal').val();
        
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "PSWD": "",
                "ADMIN_ID": "",
                "BUNHAL_CHASU": newBunHal
            };

        var enrollGubunUrl = ""; //등록여부확인
        if(gojiDocuChk=="customRadioInline1"){ //신입생,편입생
            enrollGubunUrl = "freshmenRegistYnChk";
        }else if(gojiDocuChk=="customRadioInline2" || gojiDocuChk=="customRadioInline3" || gojiDocuChk=="customRadioInline6"){ //재학생, 분할납부, 수료생/무논문학위취득자
            enrollGubunUrl = "payTuitYnChk";
        }else if(gojiDocuChk=="customRadioInline4"){ //복수전공
            enrollGubunUrl = "registYnChk";
        }else if(gojiDocuChk=="customRadioInline5"){ //계절수업
            enrollGubunUrl = "sessionTermRegisterCheckSearch";
        }
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/"+enrollGubunUrl,
            reqData : paramMap,
            success : function(data, responseData) {
                var size = data.length;
                if (size < 1) {
                    alert("학번이나 수험번호가 올바르지 않거나, 등록고지서를 출력할 권한이 없습니다.\n확인하신 후 다시 접속하여주시기 바랍니다");
                    return;
                }
                /* else{
                     gfn_ajax_request({
                        url : "/ost/enroll/gojidocuprint/gojidocu/printLog",
                        reqData : paramMap,
                        success : function(data, responseData) {
                        }
                    }); 
                } todo:: 주석해제*/ 
                
  
                $(data[0]).each(function(key, val) {
                	//console.log(val);
                    if (val.O_RSLT == "N" ) { //데이터가 없을경우
                        alert(val.O_MSG); 
                        return;
                    }else if (val.MSGDLGTYPE == 'W'){
                    	  alert(val.MSG); 
                          return;
                    } else {
                        $("#contractFlag").val(val.CONTRACT); //계약학과 여부
                        fn_clause(eng); // 고지서 출력메뉴 초기화 하기전에 개인정보 수집이용 동의서 호출 후 동의했을때 고지서 출력가능
                        
                    }
                }); 
            }
        });
        
    }
    
    /***************************************************************************
     * fn_openReport  출력
     **************************************************************************/
    function fn_openReport(msg) {
        
        var newBunHal = ($('#hdBunHal').val() == "" || $('#hdBunHal').val() == "1" ) ? "" : $('#hdBunHal').val();

        var options = {};
        //파라메터 설정
        var objParam = {};
        objParam.SYEAR = $("#hdYear").val();
        objParam.TERM_GCD = $("#hdTerm").val();
        objParam.BUNHAL_CHASU = newBunHal;
        
        if (msg == "등록_고지서(계약학과)") {
            options.rptName = "/ses/enroll/gojidocuprint/gojidocu/GojiDocu_001.crf";
            objParam.bind = [{
                db : "OST",
                proc : "OST_등록_계약학과_고지서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId]
            }];
            
        } else if(msg == "등록_예치금고지서") {
            options.rptName = "/ses/enroll/gojidocuprint/gojidocu/GojiDocu_002.crf";
            objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금고지서출력_고지서기본정보조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            },{
                db : "OST",
                proc : "OST_등록_등록금예치금고지서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            }];
            
        } else if(msg == "등록_계절수업고지서") {
            options.rptName ="/ses/enroll/gojidocuprint/gojidocu/GojiDocu_003.crf";
            objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금고지서출력_고지서기본정보조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            },{
                db : "OST",
                proc : "OST_등록_계절학기고지서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,"고지서내역"]
                //params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,""]
            },{
                db : "OST",
                proc : "OST_등록_계절학기고지서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,"수강내역"]
                //params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,""]
            }];
            
        } else if(msg == "등록_수료후연구생고지서") {
            options.rptName = "/ses/enroll/gojidocuprint/gojidocu/GojiDocu_004.crf";
            objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금고지서출력_고지서기본정보조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            },{
                db : "OST",
                //proc : "OST_등록_등록금예치금고지서출력_조회",
                proc : "OST_등록_등록금예치금고지서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            }];
            
        } else if(msg == "등록_고지서") {
            options.rptName = "/ses/enroll/gojidocuprint/gojidocu/GojiDocu_005.crf";
            objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금고지서출력_고지서기본정보조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            },{
                db : "OST",
                proc : "OST_등록_등록금고지서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            },{
                db : "OST",
                proc : "OST_등록_선감면_장학금_전체내역",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId]
            }];
            
        } else if(msg == "등록_예치금고지서(영문)") {
            options.rptName = "/ses/enroll/gojidocuprint/gojidocu/GojiDocu_006.crf";
            objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금고지서출력_고지서기본정보조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            },{
                db : "OST",
                proc : "OST_등록_등록금예치금고지서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            }];
            
        } else if(msg == "등록_고지서(영문)") {
            options.rptName = "/ses/enroll/gojidocuprint/gojidocu/GojiDocu_007.crf";
            objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금고지서출력_고지서기본정보조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            },{
                db : "OST",
                proc : "OST_등록_등록금고지서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId,newBunHal]
            },{
                db : "OST",
                proc : "OST_등록_선감면_장학금_전체내역",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId]
            }];
            
        } else if(msg == "등록_납입확인서(예치금)") {
            options.rptName = "/ses/enroll/gojidocuprint/gojidocu/GojiDocu_008.crf";
            
            
        } else if(msg == "등록_납입확인서") {
            //console.log(scwin.loginUser);
            options.rptName = "/ses/enroll/gojidocuprint/gojidocu/GojiDocu_009.crf";
            objParam.bind = [{
                db : "OST",
                proc : "'OST_등록_등록금납입확인서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId, $('#hdBunHal').val()]
            }];
            
        } else if(msg == "등록_복수전공 추가납부"){
            options.rptName = "/ses/enroll/gojidocuprint/gojidocu/GojiDocu_011.crf";
            objParam.bind = [{
                db : "OST",
                proc : "OST_등록_등록금고지서출력_복수전공추가수납_고지서기본정보조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId]
            },{
                db : "OST",
                proc : "OST_등록_복수전공추가수납고지서출력_조회",
                params : [$("#hdYear").val(),$("#hdTerm").val(),scwin.loginUser.userId]
            }];
        }
        
        
        
        options.personInfoIncludeFg = "Y";
        
        /*
        param = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "BUNHAL_CHASU": newBunHal
            }
        */

        
        //레포트를 생성시킬 group component 또는 id를 넣는다.
        options.div = 'grp_report';

        //레포트에서 사용할 옵션
        //현재 다운로드 버튼 관련 기능만 제공...
        options.reportOption = {};
        options.reportOption.useHwp = false; //한글다운로드 기능 사용안할 경우
        options.reportOption.useDoc = false; //word다운로드 기능 사용안할 경우
        options.reportOption.useEtc = false; //기타다운로드 기능(ppt, rtf, html 등) 사용안할 경우
        options.reportOption.usePrint = false; //프린트 기능 사용안할 경우

        //실행실킬 레포트 파일에서 사용할 파라미터 object 형식
        //프로그램 정보(PROG_INFO)와 사용자 정보(USER_INFO)는 기본값으로 전송됨.
        options.data = objParam;
        fn_openPopup(options, msg);
    }

    function fn_openPopup(rptOptions, msg) {
        gfn_com_modalPopup({
            width : 1200,
            height : 900,
            target : null,
            title : msg,
            include : "/html/ost/core/popup/CommPopReport.html",
            dataBound : function(e) {
                rptOptions.div = "pop_grp_report";
                openReport(rptOptions);
            }
        });
    }
    
    function fn_clause(eng) {
        
        if(hjStaGcd == "0010"){
            /* 정보동의팝업 호출 */
            gfn_com_clausePop({
                title : '정보동의팝업',
                systemGcd : '0002', /* 공통.약관관리(SYS_CLAUSE_MNG) 테이블의 시스템구분코드(SYSTEM_GCD) */
                clauseSeqNo : 32, /* 공통.약관관리(SYS_CLAUSE_MNG) 테이블의 약관순번(CLAUSE_SEQ_NO) */
                callbackFunc : function(data){
                    /* 필수동의 사항에 동의한 경우 콜백 실행 */
                    var param = {
                            "agreeDltInfo" : "",
                    };
                    param["agreeDltInfo"] = data;
                    
                    gfn_ajax_request({
                        url : "/ost/cls/attendconf/attendacceptapply/saveClause",
                        reqData : param,
                        success : function(data, responseData) {
                            if(gojiDocuChk=="customRadioInline6"){
                            }else{
                                initGoji(true); 
                            }
                            if (eng) {
                                fnReport_English();
                            } else {
                                fnReport();
                            }
                        }
                    });
                }
            });
        }else{

            initGoji(true); 
            if(gojiDocuChk=="customRadioInline6"){
            }else{
                initGoji(true); 
            }
            if (eng) {
                fnReport_English();
            } else {
                fnReport();
            }
        }
    }
    
    //고지서출력 메뉴 초기화 --신입생,편입생
    function initGoji(boolChk) {
    	fn_hylWonwooDues();
    	
        if (boolChk == false) { //개인정보동의 해야만 타게됨.
            return;
        } 
        
        if(gojiDocuChk=="customRadioInline1"){
            if ($("#enrollGubun").val() != "New") { 
                return;
            } 
            $('#hdBunHal').val('1');
        }
        else if(gojiDocuChk=="customRadioInline2"){
            if ($("#enrollGubun").val() != "Regular") {
                return;
            }
        }
        else if(gojiDocuChk=="customRadioInline3"){
            if ($("#enrollGubun").val() != "Division") {
                return;
            }
        }
        else if(gojiDocuChk=="customRadioInline4"){
            if ($("#enrollGubun").val() != "Boksu") {
                return;
            }
        }
        else if(gojiDocuChk=="customRadioInline5"){
            if ($("#enrollGubun").val() != "Season") {
                return;
            }
        }
        
        if ($('#contractFlag').val() == "Y") { //계약학과일때
            $("#hdContractDepartmentYn").val("Y");
            viewEnrollContract(); //계약학과 고지서 내역 조회
        } else {
            $("#hdContractDepartmentYn").val("N");
            ViewEnroll(); //일반 고지서 내역 조회
        }
    }
    
    
    //계약학과 고지서 내역 조회 - ViewEnrollContract
    function viewEnrollContract() {
        
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val()
            };
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/billPrintSearch",
            reqData : paramMap,
            success : function(data, responseData) {

                var dataset1 = data[0];
                var dataset2 = data[1];
                
                 if (dataset1.length < 1 && dataset2.length < 1) {
                    //alert("해당 페이지를 열람 할 권한이 없거나, 올바른 경로를 통해서 접속하지 않았습니다.");
                    alert("해당 학생은 이번 학기 등록 대상 학생이 아니거나, 열람기간이 아닙니다.");
                    $("#divPaymentConfirmationBtn").hide();
                    return;
                }
                else if (dataset1.length < 1) {
                    alert("해당 학생은 이번 학기 등록 대상 학생이 아닙니다.");
                    $("#divPaymentConfirmationBtn").hide();
                    return;
                }
                else if (dataset2.length < 1) {
                    alert("열람기간이 아닙니다.");
                    $("#divPaymentConfirmationBtn").hide();
                    return;
                }
                 
                 $(dataset1).each(function(key, val) {
                    if($('#enrollStdtGcd').val()=="0001" && val.구분 != "신입생"){
                        alert("해당 학생은 신입생이 아닙니다.");
                        $("#divPaymentConfirmationBtn").hide();
                        return;
                    }
                }); 
                
                $(dataset2).each(function(key, val) {
                    if(val.프린트버튼 != "Y"){
                        $("#divPaymentConfirmationBtn").hide();
                    }
                    if (val.확정금액 == "0") {
                        $("#lblMsg").text("고지금액이 확정되지 않았습니다.");
                        $("#lblMsg").show();
                        $("#divPaymentConfirmationBtn").hide();
                    } 
                });
            }
        });
        
    }
    
    
    //일반 고지서 내역 조회 - ViewEnroll
    function ViewEnroll() {
    	
        var tutionBasicUrl ="";
        if(gojiDocuChk=="customRadioInline4"){ //4.복수전공
            tutionBasicUrl = "billPrintChk2"                        // OST_등록_복수전공추가수납고지서출력_조회
        }else if(gojiDocuChk=="customRadioInline5"){ //5.계절수업
            tutionBasicUrl = "sessionTermBillPrintSearch"  
        }else{//1.신편입생, 2.재학생, 3.분할차수
            //tutionBasicUrl = "tuitionBasicSearch"               //OST_등록_등록금예치금고지서출력_조회
            tutionBasicUrl = "tuitionBillPritChk"               //OST_등록_등록금예치금고지서출력_조회
        }
        
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "BUNHAL_CHASU": $('#hdBunHal').val()
            };
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/" + tutionBasicUrl,
            reqData : paramMap,
            success : function(data, responseData) {
            	
            	

                var dataset1 = data[0];
                var dataset2 = data[1];
                var dataset3 = data[2];
                var dataset4 = data[3];
                var dataset5 = data[4];
                var dataset6 = data[5];
                
               
                if (dataset1.length < 1 && dataset2.length < 1) {
                    //alert("해당 페이지를 열람할 권한이 없거나, 올바른 경로를 통해서 접속하지 않았습니다.");
                    alert("해당 학생은 이번 학기 등록 대상 학생이 아니거나, 열람기간이 아닙니다.");
                    $("#divPaymentConfirmationBtn").hide();
                    return;
                }
                if (dataset1.length < 1) {
                    alert("해당 학생은 이번 학기 등록 대상 학생이 아닙니다.");
                    $("#divPaymentConfirmationBtn").hide();
                    return;
                }
                if (dataset2.length < 1) {
                    $("#divPaymentConfirmationBtn").hide();
                    //alert("열람기간이 아닙니다.");
                    //return;
                }else{
                    $(dataset2).each(function(key, val) {
                        if(val.프린트버튼 != "Y"){
                            $("#divPaymentConfirmationBtn").hide();
                        }
                    });
                }
                
                if(gojiDocuChk=="customRadioInline2"){
                    $(dataset1).each(function(key, val) {
                        if(val.정보코드 != "학사학위취득유예" && Number(val.수납입학금) < 0 || Number(val.수납수업료) < 0){
                            alert("재무과에 확인해보시고 수기고지서를 받으시기 바랍니다.");
                            $("#divPaymentConfirmationBtn").hide();
                            return;
                        }
                    });
                } 
                
                if(gojiDocuChk=="customRadioInline2" || gojiDocuChk=="customRadioInline3"){
                    $(dataset1).each(function(key, val) {
                        if (val.정보코드 == "분할납부") {
                            $("#lblMsg3").text("※ 분할납부 대상자입니다.");
                            $("#lblMsg3").show();
                        } 
                    });
                } 
                
                $(dataset1).each(function(key, val) {
                	
                    if (val.납부구분코드 != "0001") {
                        $("#divPaymentConfirmationBtn").hide();
                    }
                });
                
            }
        });
        
    }
    
    /***************************************************************************
     * fnReport  국문 고지서 출력 분기 함수
     **************************************************************************/    
    function fnReport() {
        
        var contractFlag = $("#contractFlag").val();//계약학과
        var hdDepositYn = $("#hdDepositYn").val();//예치금
        
        if (contractFlag == "Y") {
            contract_report();  //계약학과 등록고지서
        } else if (hdDepositYn == "Y") {
            yechi_report(); //예치금 등록고지서
        } else {
            new_report(); //등록고지서
        }
    }
    //계약학과 국문 고지서 출력
    function contract_report() {
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val()
            };
        
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/billPrintSearch",
            reqData : paramMap,
            success : function(data, responseData) {

                var dataset1 = data[0];
                var dataset2 = data[1];
                var size = data.length;
                if (size > 0) {
                    if (dataset1.length == 0) {
                        alert('해당 학생은 이번 학기 등록 대상 학생이 아닙니다.');
                        return;
                    }
                    $(dataset1).each(function(key, val) {
                        if(val.납부구분코드 == "0001"){
                            alert('이미 등록이 완료되었습니다.');
                        }else if (val.납부구분코드 == "0031") {
                            alert('학생납부금의 등록은 완료되었습니다.');
                        } else if (val.납부구분코드 == "0032") {
                            alert('산업체부담금의 등록은 완료되었습니다.');
                        }
                    });
                    printMsg = "등록_고지서(계약학과)";
                    fn_openReport(printMsg);
                    
                } else {
                    alert("출력할 데이터가 없습니다.");
                }
            }
        });
        
    }
    //국문 예치금 고지서 출력
    function yechi_report() {
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "BUNHAL_CHASU": "1"
            };
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/tuitionBasicSearch",
            reqData : paramMap,
            success : function(data, responseData) {

                var dataset1 = data[0];
                var dataset2 = data[1];
                var dataset3 = data[2];
                var dataset4 = data[3];
                var dataset5 = data[4];
                var dataset6 = data[5];
                
                var size = data.length;
                if (size > 0) {
                    if (dataset1.length == 0) {
                        alert('해당 학생은 이번 학기 등록 대상 학생이 아닙니다.');
                        return;
                    }
                    //fn_rd_report('등록_예치금고지서.mrd', '');
                    printMsg = "등록_예치금고지서";
                    fn_openReport(printMsg);
                } else {
                    alert("출력할 데이터가 없습니다.");
                }
            }
        });
    }
    
    //국문 고지서 출력
    function new_report() {
        var newBunHal = ($('#hdBunHal').val() == "") ? "1" : $('#hdBunHal').val();
        
        var tutionBasicUrl ="";
        
        if(gojiDocuChk=="customRadioInline4"){//4.복수전공
            tutionBasicUrl = "billPrintChk2";                       // OST_등록_복수전공추가수납고지서출력_조회
        }else if(gojiDocuChk=="customRadioInline5"){            //5.계절수업
            tutionBasicUrl = "sessionTermBillPrintSearch";      // OST_등록_계절학기고지서출력_조회
        }else if(gojiDocuChk=="customRadioInline6"){            //6
            //tutionBasicUrl = "tuitionBasicSearch";              // OST_등록_계절학기고지서출력_조회(예치금 고지서탐 왜그런지모름)
        	tutionBasicUrl = "tuitionBillPritChk";              // 무논문자
        }else{ //1.신편입생, 2.재학생, 3.분할차수
            tutionBasicUrl = "tuitionBillPritChk";              // OST_등록_등록금고지서출력_조회
        }
        
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "BUNHAL_CHASU": newBunHal
            };
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/" + tutionBasicUrl,
            reqData : paramMap,
            success : function(data, responseData) {
                var dataset1 = data[0][0];
                var dataset2 = data[1][0];
                var dataset3 = data[2][0];
                
                var size1 = data[0].length;
                var size2 = data[1].length;
                var size3 = data[2].length;
                
                if(tutionBasicUrl != "sessionTermBillPrintSearch"){
	                var dataset4 = data[3][0];
	                var size4 = data[3].length;
                }else{
                	var dataset4 = "";
                	var size4 = 0;
                }
                
                if(tutionBasicUrl != "billPrintChk2" && tutionBasicUrl != "sessionTermBillPrintSearch"){
	                var dataset5 = data[4][0];
	                var dataset6 = data[5][0];
	                var size5 = data[4].length;
	                var size6 = data[5].length;
                }else{
                	var dataset5 = "";
	                var dataset6 = "";
                	var size5 = 0;
	                var size6 = 0;
                }
                
                //alert(size1+"//"+dataset1.정보코드+"//"+size3)

                if (!gfn_com_isEmptyObject(data)) {
                    if (size1 == 0) {
                        if(gojiDocuChk=="customRadioInline4"){
                            alert('해당 학생은 복수전공 대상 학생이 아닙니다.');
                            return;
                        }else{
                            alert('해당 학생은 이번 학기 등록 대상 학생이 아닙니다.');
                            return;
                        }
                    }
                    
                    if(gojiDocuChk=="customRadioInline2"){ //재학생일때

                        var nabu_code = dataset1.납부구분코드;
                        var lower_gcd = dataset1.정보코드;
                        var bunhar_idx = dataset1.분할차수;
                        
                        if(lower_gcd=="제로고지자"){
                            alert('휴학 당시 등록금 납부자는 고지서를 출력하지 않아도 됩니다(복학신청시 자동 등록 처리).');
                            return;
                        } 
                        if (nabu_code == "0001" && bunhar_idx == "1") {
                            alert('분할 등록금납부 대상자입니다. [분할 고지서] 화면에서 출력하시기 바랍니다.');
                        } 
                        else if (nabu_code == "0001") {
                            alert('이미 현금등록이 완료되었습니다.');
                        }
                    }
                    
                    if(gojiDocuChk=="customRadioInline3" || gojiDocuChk=="customRadioInline5"){ //분할차수, 계절수업

                        var dat = dataset1;
                        var nabu_code = dat.납부구분코드;
                        
                        if (nabu_code == "0001") {
                            alert('이미 현금등록이 완료되었습니다.');
                        }
                    }
                    
                    if(gojiDocuChk=="customRadioInline5"){ //계절수업
                        //if (!dataset3) {
                            if (size3 < 1) {
                            alert('해당 학기 고지서 출력 기간이 아닙니다.');
                            return;
                        }
                        //fn_rd_report('등록_계절수업고지서.mrd', '');
                        printMsg = "등록_계절수업고지서";
                        fn_openReport(printMsg);
                        return;
                    }
                    
                    if(gojiDocuChk=="customRadioInline6"){ //수료생,무논문학위취득자
                        //fn_rd_report('등록_수료후연구생고지서_NEW.mrd', '');
                        printMsg = "등록_수료후연구생고지서";
                        fn_openReport(printMsg);
                        return;
                    }
                    if(gojiDocuChk=="customRadioInline4"){ //복수전공
                        printMsg = "등록_복수전공 추가납부";
                        fn_openReport(printMsg);
                        return;
                    }

                    //fn_rd_report('등록_고지서.mrd', '');
                    printMsg = "등록_고지서";
                    fn_openReport(printMsg);
                } else {
                    alert("출력할 데이터가 없습니다.");
                }
            }
        });
    }
    
    /***************************************************************************
     * fnReport_English  영문 고지서 출력 분기 함수
     **************************************************************************/    
    function fnReport_English() {
        var contractFlag = $("#contractFlag").val();//계약학과
        var hdDepositYn = $("#hdDepositYn").val();//예치금
        if (contractFlag == "Y") {
            alert("계약학과는 영문고지서를 출력할 수 없습니다.");
            return;
        } else if (hdDepositYn == "Y") {
            yechi_english_report(true);
        } else {
            yechi_english_report(false);
        }
    }
    //영문 예치금 및 등록금 고지서 출력
    function yechi_english_report(type) {
        var newBunHal = ($('#hdBunHal').val() == "") ? "1" : $('#hdBunHal').val();
        paramMap = {
                "SYEAR" : $("#hdYear").val(),
                "TERM_GCD" : $("#hdTerm").val(),
                "BUNHAL_CHASU": newBunHal
            };
        
        gfn_ajax_request({
            url : "/ost/enroll/gojidocuprint/gojidocu/billChk",
            reqData : paramMap,
            success : function(data, responseData) {

                var dataset1 = data[0];
                
                var size = data.length;
                if (size > 0) {
                    
                    /* var dat = dataset1[0];
                    var nabu_code = dat.납부구분코드;
                    var bunhar_idx = dat.분할차수;
                    var lower_gcd = dat.정보코드;
                    
                    if(gojiDocuChk=="customRadioInline2"){ //재학생일때
                        if (nabu_code == "0001" && bunhar_idx == "1") {
                            alert('분할 2~4차분 등록금납부 대상자입니다. 분할2~4차 고지서출력 화면에서 출력하시기 바랍니다.');
                        } 
                    }
                    
                    if(gojiDocuChk=="customRadioInline2" || gojiDocuChk=="customRadioInline3"){ //분할차수
                        if(lower_gcd=="제로고지자"){
                            alert('휴학 당시 등록금 납부자는 고지서를 출력하지 않아도 됩니다(복학신청시 자동 등록 처리).');
                            return;
                        } 
                        if (nabu_code == "0001") {
                            alert('이미 현금등록이 완료되었습니다.');
                        }
                    } */
                    
                    if (type == true) {
                        //fn_rd_report('등록_예치금고지서(영문).mrd', '');
                        printMsg = "등록_예치금고지서(영문)";
                        fn_openReport(printMsg);
                    } else if (type == false) {
                        //fn_rd_report('등록_고지서(영문).mrd', '');
                        printMsg = "등록_고지서(영문)";
                        fn_openReport(printMsg);
                    }
                } else {
                    alert("출력할 데이터가 없습니다.");
                }
            }
        });
        
    }
    
    //원우회비 제어
    function fn_hylWonwooDues() {
    	
	    if(gojiDocuChk=="customRadioInline1" || gojiDocuChk=="customRadioInline2"){
	        if((scwin.loginUser.gradGcd == "0002" ) && $("#hdTerm").val() == "0010"){
	            $('#hylWonwooDues1').show();
	            $('#hylWonwooDues2').show();
	            $('#hylWonwooDues3').show();
	            $('#lblWonwooDuesInfo').show();
	            
	            var options = {};
	            options.url = '/file/selectTagGroupList';
	            options.reqData = {
	                SYSTEM_GCD:  scwin.menuInfo.SYSTEM_GCD,
	                ATTACH_FILE_GCD: "0001",
	                ATTACH_FILE_GRP_CD: scwin.menuInfo.ATTACH_FILE_GRP_CD
	            };
	            
	            options.success = function(data, responseData) {
	
	            var download_target1_html = "";
	            var download_target2_html = "";
	            var download_target3_html = "";
	
	            $.each(responseData.fileTabList,function(idx,FILE_TAG_CONTENT){
					$.each(responseData.fileList,function(idx,file){
						if(idx == "0"){
							 if(gfn_str_parseNull(FILE_TAG_CONTENT) == gfn_str_parseNull(file.FILE_TAG_CONTENT)){
					             download_target1_html += " <a class='btn btn-sm btn-primary' href='javascript:void(0);'  onclick='fn_popupMultiFileViewr(\"/file/download.do?"+file.PARAM_CODE+"\",this)' onkeypress='this.onclick' >뷰어<i class='bi bi-eye' aria-hidden='true'></i></a>";
					             download_target1_html += " <a class='btn btn-sm btn-primary' href='/file/download.do?"+file.PARAM_CODE+"'>다운로드<i class='bi bi-download' aria-hidden='true'></i></a>";
					         }
						}
						if(idx == "1"){
					        if(gfn_str_parseNull(FILE_TAG_CONTENT) == gfn_str_parseNull(file.FILE_TAG_CONTENT)){
					            download_target2_html += " <a class='btn btn-sm btn-primary' href='javascript:void(0);'  onclick='fn_popupMultiFileViewr(\"/file/download.do?"+file.PARAM_CODE+"\",this)' onkeypress='this.onclick' >뷰어<i class='bi bi-eye' aria-hidden='true'></i></a>";
					            download_target2_html += " <a class='btn btn-sm btn-primary' href='/file/download.do?"+file.PARAM_CODE+"'>다운로드<i class='bi bi-download' aria-hidden='true'></i></a>";
					        }
					   }
						if(idx == "2"){
					        if(gfn_str_parseNull(FILE_TAG_CONTENT) == gfn_str_parseNull(file.FILE_TAG_CONTENT)){
					            download_target3_html += " <a class='btn btn-sm btn-primary' href='javascript:void(0);'  onclick='fn_popupMultiFileViewr(\"/file/download.do?"+file.PARAM_CODE+"\",this)' onkeypress='this.onclick' >뷰어<i class='bi bi-eye' aria-hidden='true'></i></a>";
					            download_target3_html += " <a class='btn btn-sm btn-primary' href='/file/download.do?"+file.PARAM_CODE+"'>다운로드<i class='bi bi-download' aria-hidden='true'></i></a>";
					        }
					   }
					});
	            });
	        
	            $("#download_target1").html(download_target1_html);
	            $("#download_target2").html(download_target2_html);
	            $("#download_target3").html(download_target3_html);
	        };
	
	        gfn_ajax_request(options);
	            
	        /**
	        if(gojiDocuChk=="customRadioInline2" && $("#hdTerm").val() == '0010'){
				$('#lblWonwooDuesInfo').show();
	        }
	        */
	        }
	    }
    }
</script>