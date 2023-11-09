<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
    <main id="main">
        <section class="sec-1">
            <header>
                <div class="header-item">
                    <h2 class="sec-title"></h2>
                </div>
                <div class="header-item"></div>
            </header>
            <div class="sec-body">
                <!-- 기본정보 영역 -->
                <div class="accordion">
                    <div class="card">
                        <div class="card-header" id="heading1">
                            <button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse1" data-expanded="true" data-controls="collapse1">통학버스 조회 및 취소</button>
                        </div>
                        <div id="collapse1" class="collapse show" aria-labelledby="heading1">
                            <div class="search-box">
                                <div class="" id="">
                                    <label class="text-left dfn ml-2 mt-2">● 기본정보</label>
                                </div>
                                <div class="b-table-box flex-col-3" role="table" aria-label="조회">
                                    <div class="b-row-box" role="row">
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label class="" data-lang>학번</label>
                                            </div>
                                            <div class="b-con-box" role="cell">
                                                <label id="STDT_NO"></label>
                                            </div>
                                        </div>
                                        <div class="b-row-item merge-2">
                                            <div class="b-title-box" role="rowheader">
                                                <label class="" data-lang>학과</label>
                                            </div>
                                            <div class="b-con-box" role="cell">
                                                <label id="DEPT_NM"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="b-row-box" role="row">
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label data-lang>성명</label>
                                            </div>
                                            <div class="b-con-box" role="cell">
                                                <label id="NM"></label>
                                            </div>
                                        </div>
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label data-lang>자택전화</label>
                                            </div>
                                            <div class="b-con-box" role="cell">
                                                <label id="TELL_NO"></label>
                                            </div>
                                        </div>
                                        <div class="b-row-item">
                                            <div class="b-title-box" role="rowheader">
                                                <label data-lang>휴대전화</label>
                                            </div>
                                            <div class="b-con-box" role="cell">
                                                <label id="PHONE_NO"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /END 기본정보 영역 -->
                                    <!-- 메시지 박스: 신청기간 -->
                                    <label class="text-left dfn ml-2 mt-2">● 통학버스 등·하교 변경</label><br>
                                    <div class="message-box">
                                        <div class="message-box-inner">
                                            <div class="message-body">
                                                <ul class="list list-style-1">
                                                    <li id="oMsg"></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /END 메시지 박스 -->
                                    <!-- 버튼 -->
                                <div id="busUpdInfo">
                                    <div class="btn-box">
                                        <div class="form-row justify-content-center">
                                            <div id="" class="col-auto">
                                                <button id="btnApply" class="btn btn-primary" type="button" onclick="javascript:return fn_Apply();" data-lang>신청하기</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /END 버튼 -->
                                </div>
                                <!-- 테이블 -->
                                <label class="text-left dfn ml-2 mt-2">● 통학버스 정보</label>
                                <div class="table-box">
                                    <div class="table-body">
                                        <table class="table table-hover" data-toggle="table" data-show-column="true">
                                            <caption>통학버스 신청정보</caption>
                                            <colgroup>
                                                <col style="min-width: 40px;">
                                                <col style="min-width: 140px;">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th scope="col">신청월</th>
                                                    <th scope="col">상세보기</th>
                                                </tr>
                                            </thead>
                                            <tbody id="resultTbody">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /END 테이블 -->
                            </div>
                        </div>
                    </div>
        </section>
    </main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
    <tr style="cursor:pointer;">
        <td class="text-center">#:MM#</td>
        <td>
            <button class="btn btn-outline-primary detail-btn" type="button">상세보기</button>
        </td>
    </tr>
</script>
<script type="text/javascript">
    /***************************************************************************
     * 변수
     **************************************************************************/
    var totalCnt = 0;

    var stdtNo = scwin.loginUser.userId;
    var nm = scwin.loginUser.nm;
    var assignNm = scwin.loginUser.assignNm;
    var telNo = scwin.loginUser.telNo;
    var phoneNo = scwin.loginUser.cellularNo;

    /***************************************************************************
     * onpageload
     **************************************************************************/
    function fn_initScreen() {
        fn_setInit();
        $("#busUpdInfo").hide();

    }
    /***************************************************************************
     * fn_setInit
     **************************************************************************/
    function fn_setInit() {
        fn_getInitInfo(); //신청년도학기 조회
    }

    var initData = {};
    /***************************************************************************
     * fn_getInitInfo  신청년도학기 조회
     **************************************************************************/
    function fn_getInitInfo() {
        var paramMap = {};

        /* ajax처리 */
        gfn_ajax_request({
            url : "/ost/bus/busapply/selectDateCheck",
            reqData : paramMap,
            success : function(data, responseData) {

                initData = {
                    "SYEAR" : data[0].SYEAR,
                    "TERM_GCD" : data[0].TERM_GCD,
                    "CHASU_NO" : data[0].CHASU_NO,
                    "STDT_NO" : data[0].STDT_NO
                };

                /* 데이터가 없으면 */
                if (gfn_com_isEmptyObject(data)) {
                    alert(pnuGetNoDataMessageKo());
                }

                fn_view(initData);
            }
        });

    }
    /***************************************************************************
     * fn_view 신청정보조회
     **************************************************************************/
    function fn_view(initData) {
        /* 검색조건데이터 가져오기 */

        /* ajax처리 */
        gfn_ajax_request({
            url : "/ost/bus/busapplylist/selectBusApplyList",
            reqData : initData,
            success : function(data, responseData) {
                if (gfn_com_isEmptyObject(data)) {
                    alert("통학버스 신청자만 사용할 수 있습니다.");
                } else {
                    
                    //기본정보 및 기타정보
                    $("#STDT_NO").text(stdtNo);
                    $("#NM").text(nm);
                    $("#DEPT_NM").text(assignNm);
                    $("#TELL_NO").text(telNo);
                    $("#PHONE_NO").text(phoneNo);

                    $("#resultTbody").listView({ //탑승정보
                        dataSource : data,
                        dataBound : function(e) {
                            currentData = data;
                            $('#resultTbody .detail-btn').bind("click",function(e) {
                                scwin.detailObj = $(this).closest("tr").data();
                                fn_openPopup({
                                    filename : 'BusApplyListPop',
                                    headertitle : '상세',
                                    paramData : $(this).closest("tr").data()
                                });
                            });
                        },
                        template : $("#resultTemplate"),
                        totalCnt : data.length,
                    });
                    fn_busGetonDate(); //신청정보가 있을때

                }

            }
        });
    }
    
    /***************************************************************************
     * fn_busUpdMsg 당일 하교 차량 변경 신청 -- 신청자료가 있을때
     **************************************************************************/    
    function fn_busGetonDate() {
        var paramMap = {};

        /* ajax처리 */
        gfn_ajax_request({
            url : "/ost/bus/busapplylist/selectGetonDate",
            reqData : paramMap,
            success : function(data, responseData) {
                
                if(data.O_RSLT=="N"){
                    $("#oMsg").text(data.O_MSG);
                }
                else{
                    $("#busUpdInfo").show();
                    $("#oMsg").text(data.O_MSG);
                    if(data.O_RSLT=="S") { //이미 신청건이 있을경우 신청하기버튼 disabled
                        $("#btnApply").prop("disabled", true);
                    }
                }

            }
        });
        
    }
    /***************************************************************************
     * fn_Apply 당일 하교 차량 변경 신청
     **************************************************************************/    
    function fn_Apply() {
        fn_openApplyPopup({
            filename : 'BusApplyListUpdPop',
            headertitle : '신청변경'
        });
    }

    /***************************************************************************
     * fn_openPopup 상세보기 팝업
     **************************************************************************/
    function fn_openPopup(_option) {
        data = gfn_com_searchData($(".search-box"));
        data.SYEAR = _option.paramData.SYEAR;
        data.TERM_GCD = _option.paramData.TERM_GCD;
        data.STDT_NO = _option.paramData.학번;
        data.CHASU_NO = _option.paramData.CHASU_NO;
        
        scwin.detailObj.popupParam = data;
        
        gfn_com_modalPopup({
            width : 1000,
            height : 800,
            index : 1,
            target : null,
            title : "신청정보" + _option.headertitle,
            include : "/html/ost/bus/" + _option.filename + ".html",
            data:data,
        });
    }
    /***************************************************************************
     * fn_openApplyPopup 신청하기 팝업
     **************************************************************************/
    function fn_openApplyPopup(_option) {
        gfn_com_modalPopup({
            width : 1200,
            height : 700,
            index : 1,
            target : null,
            title : "등·하교차량" + _option.headertitle,
            include : "/html/ost/bus/" + _option.filename + ".html"
        });
    }
</script>