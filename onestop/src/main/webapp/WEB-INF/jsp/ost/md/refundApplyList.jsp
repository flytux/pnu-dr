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
                <section class="sec-3">
                    <header>
                        <h4 class="sec-title">학년도 학생의료공제회비 환불신청서 </h4><span>※환불 및 반환 지급기준 <a class="link link-style-1" href="#none" onclick="selectMenu('000000000000319');" onkeypress="this.onclick" title="환불 및 반환지급기준 바로가기">바로가기</a></span>
                    </header>
                    <div class="sec-body">
                        <div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
                            <div class="b-row-box" role="row">
                                <div class="b-row-item merge-3">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>소속(과정)</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="ASSIGN_NM"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="b-row-box" role="row">
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>학번(성명)</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="USER"></span>
                                    </div>
                                </div>
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>학년(학기)</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="TERM_INFO"></span>
                                    </div>
                                </div>
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>학적상태</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="HJ_STA_GCD_KOR_NM"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="b-row-box" role="row">
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>생년월일</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="BIRTH_DATE"></span>
                                    </div>
                                </div>
                                <div class="b-row-item merge-2">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>휴대전화번호</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="CELLULAR_NO"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="b-row-box" role="row">
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>예금주</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="ACCT_NM"></span>
                                    </div>
                                </div>
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>은행명</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <input type="hidden" ID="BANK_CD"/>
                                        <span id="BANK_NM"></span>
                                    </div>
                                </div>
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>계좌번호</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="ACCT_NO"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                
                
                
                
                
                
                
                
                
                <section class="sec-3">
                    <header>
                        <h4 class="sec-title">신청사항</h4>
                    </header>
                    <div class="sec-body">
                        <div class="b-table-box flex-col-3" role="table" aria-label="3단 테이블">
                            
                            <div class="b-row-box" role="row">
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>환불(예상금액)</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="EX_REFUND"></span>
                                    </div>
                                </div>
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>처리상태</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="PROCESS"></span>
                                    </div>
                                </div>
                                <div class="b-row-item">
                                    <div class="b-title-box" role="rowheader">
                                        <label data-lang>신청일</label>
                                    </div>
                                    <div class="b-con-box" role="cell">
                                        <span id="APPLY_DT"></span>
                                    </div>
                                </div>
                            </div>
                            <p class="text-danger" id="TEXT">※환불 시 당해 학기 공제회 회원의 자격은 상실됩니다.</p>
                        </div>
                    </div>
                </section>
                <div class="mb-3" style="text-align:center">
                    <h3>부산대학교 총장 귀하</h3>
                </div>
                <div class="btn-box mb-3">
                    <div class="form-row btn-box-center">
                        <div class="col-auto">
                            <button class="btn  btn-lg btn-new mb-2" data-lang id="applyBtn" onclick="fn_submit()">신청</button>
                            <button class="btn  btn-lg btn-secondary mb-2" data-lang id="reportBtn" disabled>출력</button>
                        </div>
                    </div>
                </div>
                
                <div class="info-text mb-3">
                            <b>기본정보 수정 메뉴</b>
                            <ul class="list list-style-1">
                                    <li>연락처 : 학적 > 학적부 > 개인정보 수정 <a class="link link-style-1" href="#none" onclick="selectMenu('000000000000331');" onkeypress="this.onclick" title="개인정보 수정 바로가기">바로가기</a></li>
                                    <li>환불계좌 : 학적 > 학적부 > 계좌번호 수정 <a class="link link-style-1" href="#none" onclick="selectMenu('000000000000330');" onkeypress="this.onclick" title="계좌번호 수정 바로가기">바로가기</a></li>
                                </ul>
                        </div>
                
                <!-- 테이블 -->
                <section class="sec-3">
                <header>
                        <h4 class="sec-title">학년도 학생의료공제회비 환불신청서 </h4>
                    </header>
                <div class="table-box" id=grid01>
                    <span id="textDiv" style="color: blue;"></span>

                    <div class="table-body">
                        <table class="table table-hover" data-toggle="table" data-show-column="true"> <!-- data-height="350"  -->
                            <caption>환불신청내역</caption>
                            <thead>
                                <tr>
                                    <th scope="col">학년도</th>
                                    <th scope="col">학기</th>
                                    <th scope="col">환불(예상)금액</th>
                                    <th scope="col">환불계좌</th>
                                    <th scope="col">신청일자</th>
                                    <th scope="col">처리일자</th>
                                    <th scope="col">처리상태</th>
                                    <th scope="col">출력</th>
                                </tr>
                            </thead>
                            <tbody id="resultTbody">
                            </tbody>
                        </table>
                    </div>
                </div>
                </section>
                <!-- /END 테이블 -->
                
                
                
            </div>
            <!-- /END CONTENT  BODY-->
        </section>
    </main>
</div>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/x-tbody-template" id="resultTemplate">
    <tr>
        <td><a href="" id="detail-btn">#:SYEAR#</a></td>
        <td><a href="" id="detail-btn">#:TERM_GCD_NM#</a></td>
        <td><a href="" id="detail-btn">#:EX_REFUND#</a></td>
        <td><a href="" id="detail-btn">#:EX_REFUND_BANK# / #:REFUND_ACCT_NO#</a></td>
        <td><a href="" id="detail-btn">#:APPLY_DT#</a></td>
        <td><a href="" id="detail-btn">#:PROCESS_DATE#</a></td>
        <td><a href="" id="detail-btn">#:PROCESS#</a></td>
        <td>
            <input type="hidden" id="SYEAR" value="#:SYEAR#">
            <input type="hidden" id="TERM_GCD" value="#:TERM_GCD#">
            <button class="btn btn-primary"  id="report-btn" type="button" >출력</button>
        </td>
    </tr>
</script>
<script type="text/javascript">
// 학기코드
var fn_term = get_hakgi();
// 학기명
var fn_termNm = get_termNm(fn_term);
    function fn_initScreen() {
        
        if(scwin.loginUser.userGcd == "0003") {
            $("#ASSIGN_NM").text(
                    scwin.loginUser.collCdKorNm + " " + scwin.loginUser.assignNm
                            + " (" + scwin.loginUser.degCourseGcdKorNm + ")");
        }else {
            $("#ASSIGN_NM").text(scwin.loginUser.assignNm);
        }   
        $("#USER")
                .text(scwin.loginUser.userId + "(" + scwin.loginUser.nm + ")");
        $("#TERM_INFO").text(scwin.termInfo.SYEAR + "(" + fn_termNm + ")");
        $("#HJ_STA_GCD_KOR_NM").text(scwin.loginUser.hjStaGcdKorNm);
        $("#CELLULAR_NO").text(scwin.loginUser.cellularNo);
        $("#SYEAR").val(scwin.termInfo.SYEAR);
        $("#TERM_GCD").val(fn_term);
        $("#BIRTH_DATE").text(scwin.loginUser.birthDate);
        
        gfn_ajax_request({
            url : "/ost/hj/stdtinfo/acctnoupd/selectAcctNoUpd",
            reqData : {},
            success : function(data, responseData) {
                
                if (!gfn_com_isEmptyObject(data)) {
                    $("#BANK_CD").val(data[0].BANK_CD);
                    $("#BANK_NM").text(data[0].BANK_NM);
                    $("#ACCT_NO").text(data[0].ACCT_NO);
                    $("#ACCT_NM").text(data[0].ACCT_NM_NM);
                }
            
            }
        });
        
        fn_sch();
    }
    
    function fn_sch() {
        var data = {};
        data.SCH_SYEAR = scwin.termInfo.SYEAR;
        data.SCH_TERM_GCD = fn_term;
        
        data.SCH_CLAIM_SMALL_GCD ='0006';
        
        gfn_ajax_request({
            url : "/ost/md/refundApplyList",
            reqData : data,
            success : function(data, responseData) {
                if(data.length>0 && data[0].PROCESS !="미신청"){
                $("#resultTbody").listView({
                    dataSource : data,
                    dataBound : function(e) {
                        $('#resultTbody #detail-btn').attr("href","#popups");
                        //totalCnt = responseData.pageInfo.totCnt;
                        $('#resultTbody #detail-btn').bind("click", function(e){
                            scwin.detailObj = $(this).closest("tr").data();  
                            fn_openPopup('U');
                        });
                        //onclick="fn_detail('#:APPLY_SERIAL_NO')"
                        
                        $('#resultTbody #report-btn').bind("click", function(e){
                            scwin.detailObj = $(this).closest("tr").data();  
                            fn_openReport();
                        });
                        $("#EX_REFUND").text(data[0].EX_REFUND);
                        $("#PROCESS").text(data[0].PROCESS);
                        $("#APPLY_DT").text(data[0].APPLY_DT);

                            $("#reportBtn").removeClass("btn-secondary");
                            $("#reportBtn").addClass("btn-primary");
                            $("#reportBtn").attr("disabled",false);
                            $("#reportBtn").on("click",function(){
                                fn_openReport();
                            });
                            
                        
                         
                        
                        
                    },
                    template : $("#resultTemplate"),
                    totalCnt : data.length,
                    
                });
                }
            }
        });
    }
    
    function fn_submit(){
        
        
        
        confirm("신청 하시겠습니까?",function(_flag){
            if(_flag) {
                
                executeRefundApplyInfo();
                
            }
        });
    }
    
    function executeRefundApplyInfo(){
        var param = {};
        param.rowStatus = 'C';
        
        param.SYEAR = scwin.termInfo.SYEAR;
        param.TERM_GCD = fn_term;
        param.CLAIM_SMALL_GCD = '0006';
        param.BANK_CD = $("#BANK_CD").val();
        param.ACCT_NO = $("#ACCT_NO").text();
        param.ACCT_NM = $("#ACCT_NM").text();
    
        gfn_ajax_request({
            url : "/ost/md/executeRefundApplyInfo",
            reqData : param,
            success: function(data, responseData){
                
                if(data !=null && data.O_RSLT){
                    alert(data.O_MSG);
                }else{
                    if(param.rowStatus =="C"){
                        alert("저장 완료 되었습니다.");
                    }
                    fn_sch();
                }
                
                
           }
       });
    }
    
    
    function fn_openReport(isPop) {
        var options ={};
                    
        options.rptName = "/ses/md/RefundApplyPrint.crf";
   
        //파라메터 설정
        var objParam = {};
        objParam.bind = [{
            db : "ENROLL",
            proc : "DR_잡부금환불_조회",
            params : [scwin.termInfo.SYEAR,fn_term,'0006',scwin.loginUser.userId,'']
        }];
      
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
        fn_openReportPopup(options);
    }
    
    function fn_openReportPopup(rptOptions) {
        gfn_com_modalPopup({
            width : 1200,
            height : 900,
            target : null,            
            title : "고지서",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
                rptOptions.div = "pop_grp_report";
                openReport(rptOptions);
            }
        });
    }
</script>