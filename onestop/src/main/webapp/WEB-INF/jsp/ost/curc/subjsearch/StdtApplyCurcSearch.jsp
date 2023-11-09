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
                                    <label class="req" for="SCH_STDT_NO" data-lang>학번/성명</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_STDT_NO" class="form-control" title="학번"/>
                                    <input type="text" id="SCH_STDT_NM" class="form-control" title="성명"/>
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_CURC_APPLY_SYEAR" data-lang>교육과정 적용년도</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_CURC_APPLY_SYEAR" class="form-control" />
                                </div>
                            </div>                           
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_DEPT_NM" data-lang>학과(부)/전공</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                   <input type="text" id="SCH_DEPT_NM" class="form-control" />
                                </div>
                            </div>
                                   <input type="hidden" id="SCH_DEPT_CD" class="form-control"  />
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
						<table class="table table-hover" data-toggle="table"  data-show-column="true">
							<caption>학생별 적용 교육과정 정보</caption>
							<colgroup>
							    <col style="min-width: 30px;">
								<col style="min-width: 80px;">
								<col style="min-width: 30px;">
								<col style="min-width: 80px;">
								<col style="min-width: 100px;">
								<col style="min-width: 300px;">
								<col style="min-width: 70px;">
								<col style="min-width: 50px;">
								<col style="min-width: 250px;">
								<col style="min-width: 70px;">
								<col style="min-width: 50px;">
							</colgroup>
							<thead>
								<tr>
								    <th scope="col">NO</th>
									<th scope="col">학년도</th>
									<th scope="col">학년</th>
									<th scope="col">학기</th>
									<th scope="col">교과목구분</th>
									<th scope="col">교과목명</th>
									<th scope="col">교과목번호</th>
									<th scope="col">학점</th>
									<th scope="col">동일교과목명</th>
									<th scope="col">동일과목코드</th>
									<th scope="col">동일과목학점</th>
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
        <td>#:CURC_APPLY_SYEAR#</td>//학년도
	    <td>#:STDT_YEAR_NM#</td> //학년
	    <td>#:OPEN_TERM_NM#</td> //학기
	    <td>#:SUBJ_GCD_NM#</td> //교과목구분
		<td class="text-left">#:SUBJ_NM#</td> //교과목명
		<td>#:SUBJ_NO#</td> //교과목번호
		<td>#:CRDT#</td> //학점
		<td class="text-left">#:SAME_SUBJ_NM#</td> //동일교과목명
		<td>#:SAME_SUBJ_NO#</td> //동일과목코드
		<td>#:PRE_CRDT#</td> //동일과목학점
	</tr>
</script>

<script type="text/javascript">

	var totalCnt = 0;
	var nm = scwin.loginUser.nm;						//이름
	var user_id = scwin.loginUser.userId;				//학번
	var dept_cd = scwin.loginUser.deptCd;			//학과코드
	var assign_nm = scwin.loginUser.assignNm;	//학과명
	var user_gcd = scwin.loginUser.userGcd;		//사용자구분
	var major_cd = scwin.loginUser.majorCd;		//전공코드
	var curcapplysyear = scwin.loginUser.curcApplySyear;
	
	function fn_initScreen() {	
		
		$("#SCH_CURC_APPLY_SYEAR").prop("disabled", true);
		$("#SCH_DEPT_NM").prop("disabled", true);
		$("#SCH_DEPT_NM").val(assign_nm);
		$("#SCH_CURC_APPLY_SYEAR").val(curcapplysyear);
		
		if(user_gcd == "0003"){ 			//학생 사용자일때
			$("#SCH_STDT_NO").val(user_id);
			$("#SCH_STDT_NM").val(nm);
			$("#SCH_STDT_NO").prop("disabled", true);
			$("#SCH_STDT_NM").prop("disabled", true);

		}

	}
	
	/***************************************************************************
	 * 조회
	 **************************************************************************/
	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".search-box"));
			data.SCH_DEPT_CD= dept_cd;
			data.MAJOR_CD = major_cd;
        }

		/* 필수체크 */
		if (!gfn_val_validateDataMap(data, [{
            "id" : "SCH_STDT_NO",
            "name" : "학번",
            "notNull" : true
        },
        {
            "id" : "SCH_STDT_NM",
            "name" : "성명",
            "notNull" : true
        },
        {
            "id" : "SCH_CURC_APPLY_SYEAR",
            "name" : "교육과정 적용년도",
            "notNull" : true
        },
       {
            "id" : "SCH_DEPT_NM",
            "name" : "학과(부)/전공",
            "notNull" : true
        }])) return false;
		
		/* ajax처리 */		
			gfn_ajax_request({	
	            url : "/ost/curc/subjsearch/StdtApplyCurcSearch/selectStdtApplyCurcSearch",
	            reqData :  data,
				
	            success : function(data, responseData) {       

	                $("#resultTbody").listView({
	                	dataSource : data,
	                	emptyComment : '학생의 교육과정적용학년도의 교육과정이 없습니다.',
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