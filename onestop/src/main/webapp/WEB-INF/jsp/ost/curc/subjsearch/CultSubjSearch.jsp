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
				<!-- 검색 영역 -->
				<div class="search-box">
					<div class="b-table-box flex-col-3" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_SYEAR" data-lang>학년도</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_SYEAR" class="form-control" title="학년도선택"></select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" data-lang>구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="RGROUP" id="R1" value="0001" checked> <label class="form-check-label" for="R1">정보화소양, 교양필수</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="RGROUP" id="R2" value="0002"> <label class="form-check-label" for="R2">교양선택</label>
									</div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="SCH_AREA_GCD"  id ="title01" data-lang>영역구분</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_AREA_GCD" class="form-control" onKeyUp="gfn_com_enterFunc(event,fn_sch);"></select>
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
							<caption>교양과목정보</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 120px;">
								<col style="min-width: 200px;">
								<col style="min-width: 140px;">
								<col style="min-width: 100px;">
								<col style="min-width: 140px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">교과목번호</th>
									<th scope="col">교과목명</th>
									<th scope="col">학점</th>
									<th scope="col">학기</th>
									<th scope="col">주관학과</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
							</tbody>
						</table>
					</div>
				</div>
				<!-- /END 테이블 -->
				<!-- 테이블 -->
				<div class="table-box" id=grid02>
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>교양과목정보</caption>
							<colgroup>
								<col style="min-width: 30px;">
								<col style="min-width: 120px;">
								<col style="min-width: 200px;">
								<col style="min-width: 50px;">
								<col style="min-width: 50px;">
								<col style="min-width: 140px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">교과목일련번호</th>
									<th scope="col">교과목명</th>
									<th scope="col">학점</th>
									<th scope="col">학기</th>
									<th scope="col">주관학과</th>
								</tr>
							</thead>
							<tbody id="resultTbody2">
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
	    <td>#:SUBJ_NO#</td> //교과목 번호
	    <td class="text-left">#:SUBJ_NM# [#:SUBJ_ENG_NM#]</td> //교과목명
	    <td>#:CRDT#</td> //학점
		<td>#:TERM_NM_KOR#</td> //학기
		<td>#:DEPT_KOR_NM#</td> //주관학과
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
        <td>#:RN#</td>
	    <td>#:SUBJ_SERIAL_NO#</td> //교과목 일련번호
	    <td class="text-left">#:SUBJ_NM# [#:SUBJ_ENG_NM#]</td> //교과목명
	    <td>#:CRDT#</td> //학점
		<td>#:TERM_NM_KOR#</td> //학기
		<td>#:DEPT_KOR_NM#</td> //주관학과
	</tr>
</script>
<script type="text/javascript">

	var totalCnt = 0;
    var _autoComplete;
	var _multi;
	var radio ='0001';
	
	var date = new Date();
	var maxdate = date.getFullYear();
	
	$(document).ready(function() {
				
	$('input[type=radio][name=RGROUP] ,#SCH_SYEAR').change(function() {
		radio = $(':radio[name="RGROUP"]:checked').val();
		var syear = gfn_com_searchData($(".search-box")).SCH_SYEAR;
		$.this = $('input[type=radio][name=RGROUP]:checked');
		if ($.this.val() == '0001') {
			$("#SCH_AREA_GCD").attr("disabled",true);
			$('#grid01').show();
			$('#resultTbody').empty();
			$('#grid02').hide();
			$("#SCH_AREA_GCD").empty();
			$("#title01").removeClass('req');
		} else if ($.this.val() == '0002') {
			$("#SCH_AREA_GCD").attr("disabled",false);
			$('#grid01').hide();
			$('#grid02').show();	
			$('#resultTbody2').empty();
			$("#title01").addClass('req');
			
	        
	        gfn_com_DropDownLists([{          
				elements : $("#SCH_AREA_GCD"),
	            commonCode : "0001_AREA_GCD",
	            dataTextField : "COMMON_DETAIL_CD_KOR_NM",
	            dataValueField : "COMMON_DETAIL_CD",
	            optionLabel : "선택",
	            optionValue : "",
	            defaultValue : "", 
	            expnCondition : "AND ISNULL(CHAR_1_CONTENT, '0000') <='"+syear+"' AND '"+syear+"' < ISNULL(CHAR_3_CONTENT, '9999')" ,
	            hakbuGradFg : false,
	            dataBound : function(e) {
	            }	            
			}]);
	        
	        $('select[id=SCH_AREA_GCD]').change(function() {
	        	$('#resultTbody2').empty();	
	        });
	       }
		});
	});
	
	function fn_initScreen() {			
		$('#grid02').hide();
		$("#SCH_AREA_GCD").attr("disabled",true);	
		
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
	}

	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".search-box"));
        }
		if(radio=="0001"){
		/* 필수체크 */
			if (!gfn_val_validateDataMap(data,[{
	            "id" : "SCH_SYEAR",
	            "name" : "학년도",
	            "notNull" : true
	        }])) return false;
			/* ajax처리 */
				gfn_ajax_request({	
		            url : "/ost/curc/subjsearch/CultSubjSearch/selectCultSubjSearch",
		            reqData : data,
		            success : function(data, responseData) {            	
		                $("#resultTbody").listView({
		                	dataSource : data,
		                	emptyComment : '등록된 교양과목이 없습니다.',
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
		else {
			/* 필수체크 */
			if (!gfn_val_validateDataMap(data,[{
	            "id" : "SCH_SYEAR",
	            "name" : "학년도",
	            "notNull" : true
	        },
		        {"id" : "SCH_AREA_GCD",
	            "name" : "영역구분",
	            "notNull" : true
	        }])) return false;
			/* ajax처리 */
			gfn_ajax_request({
	            url : "/ost/curc/subjsearch/CultSubjSearch/selectCultSubjSearch",
	            	reqData : data,
	                success : function(data, responseData) {            	
	                	$("#resultTbody2").listView({
	                		
	                        dataSource : data,
	                        emptyComment : '등록된 교양과목이 없습니다.',
	                        dataBound : function(e) {	
	                        	
	                            totalCnt = responseData.pageInfo.totCnt;
	                            currentData = data;	                           
	                        },
	                        template : $("#resultTemplate2"),
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
	}
	
/* 	function fn_SetSyear() {
		var date = new Date();
		var mindate = 2000;
		var maxdate = date.getFullYear();
		$('#SCH_SYSTEM_GCD').spinner({min : 2000, max : maxdate});		
	}
	 */
</script>