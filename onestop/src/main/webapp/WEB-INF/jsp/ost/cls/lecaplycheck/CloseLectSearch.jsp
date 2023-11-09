<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<!-- CONTENT HEADER -->
			<header>
				<div class="header-item">
	                <h2 class="sec-title"></h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<!-- /END CONTENT HEADER -->		
			
			<!-- CONTENT BODY -->		
			<div class="sec-body">
			
				<div class="search-box">
				<!-- 검색영역 -->
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
								    <label class="req" for="SCH_SYEAR" data-lang>학년도/학기</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_SYEAR" class="form-control" style="width:30%;" title="학년도선택"></select>&nbsp;
									<select id="SCH_TERM_GCD" class="form-control" style="width:30%;" title="학기선택"></select>
								</div>
							</div>
							
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_COLL_GRAD_GCD" data-lang>대학/대학원</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <select id="SCH_COLL_GRAD_GCD" class="form-control"></select>
                                </div>
                            </div>
						</div>
					</div>
					
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
                                <button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
							</div>
						</div>
					</div>						
					
				<!-- 테이블 리스트 - 헤더 고정 -->
				<div class="table-box table-list">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>폐강강좌내역</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 100px;">
								<col style="min-width: 50px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 30px;">
								<col style="min-width: 100px;">
								<col style="min-width: 50px;">
								<col style="min-width: 50px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">주관학과명</th>
									<th scope="col">학년</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">분반</th>
									<th scope="col">교과목구분</th>
									<th scope="col">학점</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
						</table>
					</div>
				</div>
				<!-- /END 테이블 -->					
					
				<!-- /END 검색영역 -->
				</div>			
			
			
			

			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
        <td>#:MNG_DEPT_CD#</td>
	    <td>#:OPEN_STDT_YEAR_GCD#</td>
	    <td>#:SUBJ_NM #</td>
	    <td>#:SUBJ_NO#</td>
	    <td>#:CLASS_NO#</td>
	    <td>#:SUBJ_GCD#</td>
	    <td>#:CRDT#</td>
	    <td>폐강</td>
	</tr>
</script>

<script type="text/javascript">

var CollGradGcd = scwin.loginUser.collGradGcd;

var date = new Date();
var maxdate = date.getFullYear();

	function fn_initScreen() {		
		
		/*학년도 바인드*/
		gfn_ajax_request({
			url : "/ost/curc/common/curccommon/selectSearchBoxSyear",
			reqData : {
				"BOUNDARY" : "",
				"STARTYEAR" : "2000",
				"ENDYEAR" : maxdate
			},
			success : function(data, responseData) {

				$("#SCH_SYEAR").dropDownList({
				dataSource : data,
				commonCode : "",
				dataTextField : "LABEL",
				dataValueField : "CODE",
				optionLabel : "선택",
				optionValue : "",
				defaultValue : maxdate,
				expnCondition : "",
				dataBound : function(e) {
	
				}	
				});
			}
		});		

		/* 학기 */
		gfn_com_DropDownLists([{          
			elements : $("#SCH_TERM_GCD"),
            commonCode : "0001_TERM_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "선택",
            optionValue : "",
            defaultValue : "", 
            expnCondition : "AND COMMON_DETAIL_CD IN ('0010', '0020', '0011', '0021') AND CHAR_1_CONTENT LIKE '%B%' " ,
            hakbuGradFg : false,
            dataBound : function(e) {
            	var param = gfn_com_inputdata($(".search-box"));
        		param.SYSTEM_GCD = scwin.menuInfo.SYSTEM_GCD;
        		param.MENU_CD = scwin.menuInfo.MENU_CD;
            	/* 기준학년도학기 ajax처리 */
        		gfn_ajax_request({
        			url : "/ost/cls/lecaplycheck/AtlectSearch/selectOneShafYyShtm",
        			reqData : param,
        			success : function(data, responseData) {
        				
        				$("#SCH_SYEAR").val(data.SYEAR);
        				$("#SCH_TERM_GCD").val(data.TERM_GCD);
        			}
        		});
            	
            }
        }]);		

		/* 대학/대학원 */
		gfn_com_DropDownLists([{          
			elements : $("#SCH_COLL_GRAD_GCD"),
            commonCode : "0001_COLL_GRAD_GCD",
            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
            dataValueField : "COMMON_DETAIL_CD",
            optionLabel : "",
            optionValue : "",
            defaultValue : CollGradGcd, 
            expnCondition : "",
            hakbuGradFg : false,
            dataBound : function(e) {
            }
        }]);		
		
		
	}

	/***************************************************************************
	 * 입력 필수 조건 확인
	 **************************************************************************/
	function fn_validate(param) {
		var rtnValue = true;
		
		rtnValue = gfn_val_validateDataMap(param, [ {
			"id" : "SCH_SYEAR",
			"name" : "학년도",
			"notNull" : true
		}, {
			"id" : "SCH_TERM_GCD",
			"name" : "학기",
			"notNull" : true
		}, {
			"id" : "SCH_COLL_GRAD_GCD",
			"name" : "대학/대학원",
			"notNull" : true
		},	]);
		
		if (!rtnValue){
			return rtnValue;
		}
		
		return rtnValue;	
	}

	/***************************************************************************
	 * 폐강강좌조회 - 목록
	 **************************************************************************/
	function fn_sch(data) {		
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".search-box"));
        }

		/* 필수체크 */
		if (!fn_validate(data)){
			return false;
		}
		
		/* ajax처리 */
		gfn_ajax_request({
            url : "/ost/cls/lecaplycheck/closelectsearch/selectCloseLectSearch",
            	reqData : data,
                success : function(data, responseData) {            	
                	$("#resultTbody").listView({
                        dataSource : data,
                        emptyComment : "등록된 폐강강좌가 없습니다.",
                        dataBound : function(e) {	
                            totalCnt = responseData.pageInfo.totCnt;
                            currentData = data;
                        },
                        template : $("#resultTemplate"),
                        totalCnt : responseData.totalCnt,
                        paging : {
                            pageInfo : responseData.pageInfo,
                            reqData : responseData.reqData,
                            func : "fn_sch"
                        }
                    });
                }
          });			
			
			
		}		
	

</script>