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
                                    <label class="req" for="SCH_EXAM_NO" data-lang>Application Number</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_EXAM_NO" class="form-control" title="수험번호"/>
                                </div>
                            </div>
                            <div class="b-row-item">
                                <div class="b-title-box" role="rowheader">
                                    <label class="req" for="SCH_PWD" data-lang>Password</label>
                                </div>
                                <div class="b-con-box" role="cell">
                                    <input type="text" id="SCH_PWD" class="form-control" />
                                </div>
                            </div>    
                            <div class="btn-box">
								<div class="b-con-box">
									<div class="col-auto">
		                                <button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>Search</button>
									</div>
								</div>
							</div>                       
						</div>
					</div>
					<!-- 
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
                                <button class="btn search-btn" type="button" onclick="javascript:return fn_sch();" data-lang>조회</button>
							</div>
						</div>
					</div>
					-->
				</div>
				<!-- /END 검색 영역 -->
				<div class="message-box mb-3">
					<div class="message-box-inner">
						<div class="message-body">
							※ Please enter the password used in onestop.
							<br/>
							※ Student number confirmation is available only for a month.(Spring semester : End of February ~ March, Fall Semester : End of August ~ September)
						</div>
					</div>
				</div>				
				<!-- 테이블 -->                
				<div class="table-box" id=grid01>
					<div class="table-body">                    
						<table class="table table-hover" data-toggle="table"  data-show-column="true">
							<caption>학생별 적용 교육과정 정보</caption>
							<colgroup>
								<col style="min-width: 500px;">
							</colgroup>
							<tbody id="resultTbody">
								<tr style="cursor:pointer;">
									<td><strong class="text-primary">Please click "Search" button after entering the student classification, application number, password.</strong></td>
								</tr>
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
		<td><strong class="text-primary">The student number "#:성명#" requested, is "#:학번#".</strong></td>
	</tr>
</script>

<script type="text/javascript">

	var totalCnt = 0;
	var nm = scwin.loginUser.nm;						//이름
	var dept_cd = scwin.loginUser.deptCd;			//학과코드
	var assign_nm = scwin.loginUser.assignNm;	//학과명
	var user_gcd = scwin.loginUser.userGcd;		//사용자구분
	var major_cd = scwin.loginUser.majorCd;		//전공코드
	var curcapplysyear = scwin.loginUser.curcApplySyear;
	
	function fn_initScreen() {	
		

	}
	
	/***************************************************************************
	 * 조회
	 **************************************************************************/
	function fn_sch(data) {
		/* 검색조건데이터 가져오기 */
		if (gfn_com_isEmptyObject(data)) {
            data = gfn_com_searchData($(".search-box"));
			data.EXAM_NO = SCH_EXAM_NO;
			data.PWD = SCH_PWD;
        }
		console.log(scwin.pageInfo)

		/* ajax처리 */		
		gfn_ajax_request({	
            url : "/ost/foregin/ForeginNewSearch/fnsList",
            reqData :  data,
            success : function(data, responseData) {       
                $("#resultTbody").listView({
                	dataSource : data,
                	emptyComment : '<strong class="text-danger">There is no student number that matches the application number and password entered. Please try again.</strong>',
                    dataBound : function(e) {	                      
	                    currentData = data;

	                     },
	                     template : $("#resultTemplate"),		                     
	                     totalViewYn : "N"
                    });
                }
          });
    }	
	
</script>