<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
	                <h2 class="sec-title"></h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<div class="sec-body">
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
								    <label class="req">시스템구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_SYSTEM_GCD" class="form-control"></select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
								    <label>공통코드</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="SCH_COMMON_CD" class="form-control" onKeyUp="gfn_com_enterFunc(event,fn_sch);"></input>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label>공통코드명</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="SCH_COMMON_CD_KOR_NM" class="form-control" onKeyUp="gfn_com_enterFunc(event,fn_sch);"></input>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req">캘린더</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="siteCheckEnymd" name="siteCheckEnymd" class="form-control datepicker" /><!-- 캘린더 : class에 datepicker추가 -->
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label>교원검색</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="profSearch" name="profSearch" class="form-control profsearcher" /><!-- 교원검색 : class에 profseacher추가 -->
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label>Slider</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="sliderPoint" name="sliderPoint" class="form-control sliderpointer" />
                                </div>
                            </div>
                        </div>
                        <div class="b-row-box" role="row">
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label>AutoComplete</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="NATION_NO_GCD" class="form-control" />
                                </div>
                            </div>
                            <div class="b-row-item merge-2">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req">멀티셀렉트</label>
                                </div>
                                <div class="b-con-box" role="cell" aria-colspan="3">
                                    <input type="text" id="SCH_ATTACH_FILE_GCD" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="b-row-box" role="row">
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label>대학/대학원</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" />
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label>대학원</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_GRAD_GCD" class="form-control" />
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label>단과대학</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_COLL_CD" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="b-row-box" role="row">
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label>학과(부)</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_DEPT_CD" class="form-control" />
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label>전공</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_MAJOR_CD" class="form-control" />
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label></label>
                                </div>
                                <div class="b-con-box" role="cell">

                                </div>
                            </div>
                        </div>
					</div>
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
                                <button class="btn search-btn" type="button" onclick="javascript:return fn_sch();">조회</button>
                                <button class="btn btn-icon print-btn" type="button" onclick="javascript:return fn_add();">신규</button>
							</div>
						</div>
					</div>
				</div> 
				<!-- /END 검색 영역 -->
				<!-- 메시지 박스 -->
				<div class="message-box">
					<div class="message-box-inner">                    
						<div class="message-body">
							<ul class="list list-style-1">
							    <li>
                                    <span class="dfn">참고파일 : </span>sample1.jsp, samplePop.html
                                    <button class="btn btn-danger btn-sm ml-1" type="button" onclick="javascript:$('#doc').toggle('slow');$(this).text((($(this).text() == '참고내용 펼치기')?'참고내용 접기':'참고내용 펼치기'));">참고내용 펼치기</button>
                                </li>
                                <div id="doc" style="display:none;">
									<li>
									    <span class="dfn">01) </span>dropDownList
									    <ul>
										    <li>dataSource : JSON타입의 데이터 ( commonCode 또는 dataSource 둘 중 하나만 기입 )</li>
									        <li>commonCode : 시스템구분코드 + '_' + 공통코드 (ex) 0000_SYSTEM_GCD</li>
									        <li>dataTextField : dropdownlist option의 텍스트 값으로 사용 될 컬럼명 (생략가능)</li>
									        <li>dataValueField : dropdownlist option의 value 값으로 사용 될 컬럼명 (생략가능)</li>
									        <li>optionLabel : value값이 ""인 option의 텍스트 값 정의 (생략가능)</li>
									        <li>defaultValue : 데이터바인딩 후 기본선택 될 값 (생략가능)</li>
									        <li>expnCondition : 공통코드 중 제외할 코드 정의 (ex) "AND '1' = '1' AND 2 = 2" (생략가능)</li>
									        <li>dataBound : dropdownlist 적용 후 처리해야 할 작업을 정의 (생략가능)</li>
									    </ul> 
									</li>
									<li>
	                                    <span class="dfn">02) </span>listView
	                                    <ul>
	                                        <li>dataSource : JSON타입의 데이터</li>
											<li>dataBound : listView실행이 끝난 후 처리해야 할 작업을 정의</li>
											<li>template : dataSource의 map내용을 화면에 그려 줄 엘리먼트가 정의 되어 있는 템플릿의 아이디</li>
											<li>totalCnt : 리스트 상단에 표시 될 전체 건수</li>
											<li>paging : 페이징 관련 변수</li>
											<li>excel : 해당 항목을 정의 한 경우 엑셀다운로드 버튼이 자동으로 활성화 되고, 클릭하면 정의 된 내용 내용의 function이 실행 되어짐</li>
	                                    </ul>
	                                </li>
	                                <li>
	                                    <span class="dfn">03) </span>gfn_com_modalPopup
	                                    <ul>
	                                        <li>width : 팝업 가로길이 (미 입력시 기본값 500)</li>
											<li>height : 팝업 세로길이 (미 입력시 기본값 500)</li>
											<li>index : 팝업이 여러 개 인 경우 index가 높은 팝업이 낮은 팝업 위에 보여짐. (미입력시 기본값:1)</li>
											<li>position : window화면을 기준으로 팝업을 표시할 위치 지정 (미 입력시 top,left 기본값:30)</li>
											<li>target : 팝업을 호출한 버튼객체 (해당 값이 있는 경우 팝업이 뜰때 버튼이 안보였다가 팝업을 닫으면 다시 보임)</li>
											<li>title : 팝업상단에 헤더표시 (미 입력시 헤더없이 내용만 표시)</li>
											<li>include : 팝업창 content에 표시되어질 페이지의 경로</li>
											<li>scrolling : (on) 팝업창을 호출하면 자동으로 최상단으로 이동, (off) 팝업 호출 시 스크롤이동 없음 (기본값:on)</li>
											<li>scroll : (on) 팝업창 호출 시 메인화면의 전체 스크롤 보여짐, (off) 팝업창 호출 시 메인화면의 전체 스크롤 없애기 (기본값:off)</li>
											<li>move : (on) 헤더를 클릭 후 팝업을 움직일 수 있음, (off) 팝업이 오픈 된 위치에 고정되어 움직이지 않음 (기본값:on)</li>
	                                    </ul>
	                                </li>
	                                <li>
	                                    <span class="dfn">04) </span>gfn_com_dataBind
	                                    <ul>
	                                        <li>param1 : obj - 데이터바인딩 할 영역</li>
											<li>param2 : data - 데이터바인딩 할 데이터</li>
											<li>param3 : obj_ - 데이터바인딩 영역에서 제외할 영역</li>
											<li>param4 : callBack - 데이터바인딩 후 콜백함수</li>
											<li>data-bind 구분<br/>
											  - value : $(this).val()<br/>
											  - text : $(this).text()<br/>
											  - html : $(this).html()<br/>
											  - htmlBr : $(this).html() -> 줄바꿈(/(\n|\r\n)/g)을 br 태그로 치환해서 표시<br/>
											  - checked : value값과 일치하는 항목을 checked처리<br/>
											  - chkContains : 바인딩되는 데이터가 콤나(,)등으로 여러개가 붙어서 구성되고, value값과 일치하는 항목들을 checked처리 할 경우 사용<br/>
											  - selected : option에 일치하는 value가 있는 경우 selected (없는경우 첫번째 option선택)<br/>
											  - unit : 단위를 붙여서 표시해야 하는 경우 (ex) data-bind="unit : lgnFailNumtm|회"<br/>
											  - cash : 천단위콤마표시 <br/>
											  - cash&unit : 천단위콤마표시 & 단위를 붙여서 표시 (ex) data-bind="cash&unit : wkrcnt|명"<br/>
											  - v_cash : value로 천단위콤마를 표시해서 넣는 경우</li>
	                                    </ul>
	                                </li>
	                                <li>
	                                    <span class="dfn">05) </span>gfn_com_excelDownloadFile
	                                    <ul>
	                                        <li>colName : 엑셀에 표시할 컬럼 및 명칭</li>
	                                        <li>data : 엑셀로 다운로드 할 데이터 (페이징처리 된 리스트의 경우 전체데이터를 가지고 와서 넘겨줘야 함)</li>
	                                        <li>excelName : 엑셀로 다운로드 할 파일명 (확장자제외)</li>
	                                    </ul>
	                                </li>
	                            </div>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->				
				<!-- 테이블 -->                
				<div class="table-box">
					<div class="table-body">                    
						<table class="table table-hover" data-toggle="table" data-height="463" data-show-column="true">
							<caption>Sample Table</caption>
							<colgroup>
							    <col style="min-width: 40px;">
								<col style="min-width: 140px;">
								<col style="min-width: 140px;">
								<col style="min-width: 160px;">
								<col style="min-width: 140px;">
								<col style="min-width: 100px;">
								<col style="min-width: 140px;">
							</colgroup>
							<thead>
								<tr>
								    <th scope="col">번호</th>
									<th scope="col">시스템구분</th>
									<th scope="col">공통코드</th>
									<th scope="col">공통코드명</th>
									<th scope="col">업무구분</th>
									<th scope="col">사용여부</th>
									<th scope="col">-</th>
								</tr> 
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>					
				</div>
				<!-- /END 테이블 -->
			</div>
		</section>      
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
        <td>#:RN#</td>
	    <td class="table-secondary" scope="row">#:SYSTEM_GCD_NM#</td>
	    <td class="text-left">#:COMMON_CD#</td>
	    <td class="text-left">#:COMMON_CD_KOR_NM#</td>
	    <td>#:TASK_GCD_NM#</td>
	    <td>
            # if( :USE_FG == "Y") { #
	               사용
	        #} else if ( :USE_FG == "N") { #
	               미사용
	        #} else {#
                -
            #}#
	    </td>
		<td>
			<button class="btn btn-outline-primary detail-btn" type="button">상세보기</button>
		</td>
	</tr>
</script>
<script type="text/javascript">

	var totalCnt = 0;
    var _autoComplete;
	var _multi;

	function fn_initScreen() {				
		$("#SCH_SYSTEM_GCD").dropDownList({          
			dataSource : null,
            commonCode : "0000_SYSTEM_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "0001", 
            expnCondition : "",
            dataBound : function(e) {

            }
        });

		_autoComplete = $("#NATION_NO_GCD").extDropDownList({          
            commonCode : "0000_NATION_NO_GCD",
            multiple : false,
            autocomplete: true,
            optionLabel : "선택",
            defaultValue : " ",
            dataBound : function(e) {
                
            }
        });
        /* 특정값으로 setting..
        $("#NATION_NO_GCD").setValues(_autoComplete, "+82");
        */  
		_multi = $("#SCH_ATTACH_FILE_GCD").extDropDownList({          
            commonCode : "0000_ATTACH_FILE_GCD",
            multiple : true,
            autocomplete: false,
            defaultValue : "",
            dataBound : function(e) {
                
            }
        });
		/* 특정값으로 setting..
        $("#SCH_ATTACH_FILE_GCD").setValues(_multi, "0004");
        */		

        $("#SCH_COLL_GRAD_GCD").collGradGcdDropDownList({
        	callback : function(){
        		
        		$("#SCH_GRAD_GCD").gradGcdDropDownList({
        			relation : $("#SCH_COLL_GRAD_GCD"),
                    callback : function(){
                    	
                    	$("#SCH_COLL_CD").collCdDropDownList({
                    		relation : $("#SCH_GRAD_GCD"),
                            callback : function(){
                            	
                            	$("#SCH_DEPT_CD").deptCdDropDownList({
                            		relation : $("#SCH_COLL_CD"),
                                    callback : function(){
                                    	
                                    	$("#SCH_MAJOR_CD").majorCdDropDownList({
                                    		relation : $("#SCH_DEPT_CD"),
                                            callback : function(){
                                                
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
        	}
        });
	}
	
	function fn_sch(data) {
		
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".search-box"));
        }
		/* 필수체크 */
		if (!gfn_val_validateDataMap(data,[{
            "id" : "SCH_SYSTEM_GCD",
            "name" : "시스템구분",
            "notNull" : true
        }])) return false;

		/* ajax처리 */
		gfn_ajax_request({
            url : "/common/sample/sample1SelectList",
            reqData : data,
            success : function(data, responseData) {            	
            	$("#resultTbody").listView({
                    dataSource : data,
                    dataBound : function(e) {
                    	$("#resultTbody tr").find("td:not(:last)").bind("click", function(e) {
                            scwin.detailObj = $(this).closest("tr").data();  
                            scwin.rowState = 'U';
                            fn_openPopup({
                            	filename : 'samplePop',
                            	headertitle : '수정'
                            });
                        });
                        $('#resultTbody .detail-btn').bind("click", function(e){
                        	scwin.detailObj = $(this).closest("tr").data();   
                            fn_openPopup({
                            	filename : 'sampleDetailPop',
                            	headertitle : '상세'
                            });
                        });
                        totalCnt = responseData.pageInfo.totCnt;
                        currentData = data;
                    },
                    template : $("#resultTemplate"),
                    totalCnt : responseData.totalCnt,
                    paging : {
                        pageInfo : responseData.pageInfo,
                        reqData : responseData.reqData,
                        func : "fn_sch"
                    }, 
                    excel : "fn_excelDownload"
                });
            }
        });
	}
	
	function fn_add() {
		scwin.detailObj = {};
		scwin.rowState = 'C';
		fn_openPopup({
        	filename : 'samplePop',
        	headertitle : '수정'
        });
	}
	
	function fn_openPopup(_option) {
		gfn_com_modalPopup({
        	width : 800,
            height : 600,
            index : 1,
            position : {
                top : 20,
                left : 20
            },
            target : null,                                
            title : "공통코드"+_option.headertitle,
            scrolling : "on",
            scroll : "off",
            move : "on",
            include : "/html/ost/core/popup/"+_option.filename+".html"
        });
	}
	
	function fn_excelDownload() {
		
		data = gfn_com_searchData($(".search-box"));
		data.pageSize = totalCnt; //전체데이터를 가지고 오기 위해서 pageSize를 전체건수로 세팅
		
		gfn_ajax_request({
            url : "/common/sample/sample1SelectList",
            reqData : data,
            success : function(data, responseData) {
            	if (data.length > 0) {
            		/* [엑셀다운로드 공통] */
                    gfn_com_excelDownloadFile(
                    [{
                        key : "RN",
                        name : "순번"
                    }, {
                        key : "SYSTEM_GCD_NM",
                        name : "시스템구분"
                    }, {
                        key : "COMMON_CD",
                        name : "공통코드"
                    }, {
                        key : "COMMON_CD_KOR_NM",
                        name : "공통코드명"
                    }], /* 엑셀에 표시할 컬럼 및 명칭 */
                    data, /* 엑셀로 다운로드 할 데이터 */
                    "공통코드엑셀다운로드" /* 엑셀로 다운로드 할 파일명 (확장자제외) */
                    );
                } else {
                    alert("엑셀로 다운로드할 데이터가 없습니다.");
                    return false;
                }	
            }
		});
	}
</script>