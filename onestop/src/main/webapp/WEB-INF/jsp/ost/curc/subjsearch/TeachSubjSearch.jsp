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
								    <label class="req" for="SCH_SYEAR" data-lang>학년도</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="SCH_SYEAR" class="form-control"></select>
								</div>
							</div>
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
                            <div class="b-row-item merge-2">
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
							<caption>교직과목정보</caption>
							<colgroup>
							    <col style="min-width: 30px;">
								<col style="min-width: 100px;">
								<col style="min-width: 200px;">
								<col style="min-width: 140px;">
								<col style="min-width: 100px;">
								<col style="min-width: 140px;">
							</colgroup>
							<thead>
								<tr>
								    <th scope="col">NO</th>
									<th scope="col" id = "License">표시과목</th>
									<th scope="col">기본이수영역</th>
									<th scope="col">이수교과목</th>
									<th scope="col">학점</th>
									<th scope="col">교과목구분</th>
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
	    <td class="table-secondary" scope="row">#:LICENSE_MARK_SUBJ_NM#</td> //표시과목
	    <td class="text-left">#:AREA_NM#</td> //기본이수영역
	    <td>#:SUBJ_NM #</td> //이수교과목
		<td>#:CRDT#</td> //학점
		<td>#:SUBJ_GCD_NM#</td> //교과목구분
	</tr>
</script>

<script type="text/javascript">

	var totalCnt = 0;
    var _autoComplete;
	var _multi;
	var radio ='0001';
	
	var date = new Date();
	var maxdate = date.getFullYear();
	
	function fn_initScreen() {
		var collGradGcd = scwin.loginUser.collGradGcd; //대학구분
		var collCd = scwin.loginUser.collCd; //단과대학명
		var gradGcd = scwin.loginUser.gradGcd; //대학원명
		var assignNm = scwin.loginUser.assignNm; //학과명
		var assignCd = scwin.loginUser.assignCd; //학과코드
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
				$("#SCH_COLL_GRAD_GCD").setValue("0001", function() {
					$("#SCH_COLL_GRAD_GCD").setReadOnly(true);
				});
				$("#SCH_GRAD_GCD").setValue("0000", function() {
					$("#SCH_GRAD_GCD").setReadOnly(true);
				});
				$("#SCH_COLL_CD").setValue(collCd);
				$("#SCH_DEPT_CD").setValue(assignCd);
			}
		});
/* 		gfn_com_assignCombo({
			collGradGcd : $("#SCH_COLL_GRAD_GCD")
			,gradGcd : $("#SCH_GRAD_GCD")
			,collCd : $("#SCH_COLL_CD")
			,deptCd : $("#SCH_DEPT_CD")
			,comboLvl : 4
			,dataBound : function(e) {		
				$("#SCH_COLL_GRAD_GCD").setValue("0001", function() {
					$("#SCH_COLL_GRAD_GCD").setReadOnly(true);
				});
				$("#SCH_GRAD_GCD").setValue("0000", function() {
					$("#SCH_GRAD_GCD").setReadOnly(true);
				});
				$("#SCH_COLL_CD").setValue(collCd);
				$("#SCH_DEPT_CD").setValue(assignCd);
		    }
		}); */
		
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

		/* 필수체크 */
		if (!gfn_val_validateDataMap(data,[{
            "id" : "SCH_SYEAR",
            "name" : "학년도",
            "notNull" : true
        }])) return false;
		/* ajax처리 */
		
			gfn_ajax_request({	
	            url : "/ost/curc/subjsearch/TeachSubjSearch/selectTeachSubjSearch",
	            reqData : data,
	            success : function(data, responseData) {            	
	                $("#resultTbody").listView({
	                	dataSource : data,
	                	emptyComment : "학년도와 교직과목조회 조건을 선택하신 후, 검색버튼을 클릭 하십시오. ",
	                    dataBound : function(e) {
	                    	Rowspan("table-secondary");
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
	
	function Rowspan(className){
	    $("." + className).each(function() {
	        var rows = $("." + className + ":contains('" + $(this).text() + "')");
	        if (rows.length > 1) {
	            rows.eq(0).attr("rowspan", rows.length);
	            rows.not(":eq(0)").remove();
	        }
	    });
	}
	
	/* function fn_SetSyear() {
		var date = new Date();
		var mindate = 2000;
		var maxdate = date.getFullYear();
		$('#SCH_SYEAR').spinner({min : 2000, max : maxdate});		
	} */
</script>