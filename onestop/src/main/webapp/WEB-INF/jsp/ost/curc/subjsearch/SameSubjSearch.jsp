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
			<!-- 메시지 박스 -->
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li><span class="dfn"> 폐강된 과목들에 대해, 동일과목으로 인정되는 과목들의 정보를 조회할 수 있습니다.</span></li>
								<li><span class="dfn" style="color:red;" > 2019.01.10자 법학과(351100)의 63개 과목의 동일과목이 전산오류로 잘못 표기된 것을 확인하였습니다.<br>
								 위 날짜 이전에 동일과목조회 내용을 참고하였다면, 다시 확인하거나 개설학과로 동일 과목에 대해 직접 문의하여 학점 이수에 불이익을 받는 일이 없도록 유의하시기 바랍니다.</span></li>						
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-4" role="table" aria-label="조회">
						<div class="b-row-box" role="row">						
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_COLL_GRAD_GCD" data-lang>대학/대학원</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_COLL_GRAD_GCD" class="form-control" />
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_GRAD_GCD" data-lang>대학원</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_GRAD_GCD" class="form-control" />
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_COLL_CD" data-lang>단과대학</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_COLL_CD" class="form-control" />
                                </div>
                        </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_DEPT_CD" data-lang>학과(부)/전공</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_DEPT_CD" class="form-control" />
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
				</div>
				<!-- /END 검색 영역 -->				
				<!-- 테이블 -->                
				<div class="table-box" id=grid01>
					<div class="table-body">                    
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>동일과목정보</caption>
							<colgroup>
							    <col style="min-width: 30px;">
								<col style="min-width: 100px;">
								<col style="min-width: 200px;">
								<col style="min-width: 140px;">
								<col style="min-width: 200px;">
								<col style="min-width: 140px;">
								<col style="min-width: 50px;">
								<col style="min-width: 200px;">
								<col style="min-width: 50px;">
								<col style="min-width: 250px;">
							</colgroup>
							<thead>
								<tr>
								    <th scope="col">NO</th>
									<th scope="col">년도</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">동일교과목명</th>
									<th scope="col">동일교과목번호</th>
									<th scope="col">교과목구분</th>
									<th scope="col">학과</th>
									<th scope="col">학점</th>
									<th scope="col">대체사유</th>
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
        <td>#:PRE_SYEAR#</td>//학년도
	    <td class="text-left">#:PRE_SUBJ_NM#</td> //교과목명
	    <td>#:PRE_SUBJ_NO#</td> //교과목번호
	    <td class="text-left">#:SAME_SUBJ_NM#</td> //동일과목명
		<td>#:SAME_SUBJ_NO#</td> //동일과목
		<td>#:SUBJ_GCD_NM#</td> //교과목구분
		<td class="text-left">#:DEPT_KOR_NM#</td> //주관학과
		<td>#:SAME_CRDT#</td> //학점
		<td class="text-left">#:REASON_CONTENT#</td> //대체사유

	</tr>
</script>

<script type="text/javascript">

	var totalCnt = 0;

	function fn_initScreen() {	
		
		/*학과소속 바인드*/
		gfn_com_assignCombo({
			collGradGcd : $("#SCH_COLL_GRAD_GCD"),
			gradGcd : $("#SCH_GRAD_GCD"),
			collCd : $("#SCH_COLL_CD"),
			deptCd : $("#SCH_DEPT_CD"),
			deptCdExtUrl : {
        		url:"/core/function/getAssignComboDeptMajorCdInfo"
        	},
			comboLvl : 4,
			dataBound : function(e) {

			}
		});

	}
	
	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".search-box"));
        }

		/* 필수체크 */
		if (!gfn_val_validateDataMap(data, [{
            "id" : "SCH_COLL_GRAD_GCD",
            "name" : "대학/대학원",
            "notNull" : true
            //mandatory : true
        },
        {
            "id" : "SCH_GRAD_GCD",
            "name" : "대학원",
            "notNull" : true
        },
        {
            "id" : "SCH_COLL_CD",
            "name" : "단과대학",
            "notNull" : true
        },
       {
            "id" : "SCH_DEPT_CD",
            "name" : "학과(부)/전공",
            "notNull" : true
        }])) return false;
		
		/* ajax처리 */		
			gfn_ajax_request({	
	            url : "/ost/curc/subjsearch/SameSubjSearch/selectSameSubjSearch",
	            reqData : data,
	            success : function(data, responseData) {            	
	                $("#resultTbody").listView({
	                	dataSource : data,
	                	emptyComment : "해당학과의 동일과목이 존재하지 않습니다.",
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