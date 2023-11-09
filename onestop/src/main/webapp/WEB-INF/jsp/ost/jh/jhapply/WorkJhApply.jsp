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
				</div>
				<section class="sec-2">
					<div class="sec-body">
						<p class="info-text info-text-style-1 text-danger d-none" id="MSG">신청기간이 아닙니다. </p>
						<p style="color: red">※ 신청내역 상세정보 확인(수정, 삭제 등)은 장학명(예: 근로봉사)을 클릭하시면 됩니다.</p>
						<div class="table-box" id=grid01>
							<div class="table-body">                    
								<table class="table table-hover" data-toggle="table" data-show-column="true">
									<caption>장학생(근로)신청</caption>
									<colgroup>
										<col style="min-width: 50px;">
										<col style="min-width: 50px;">
										<col style="min-width: 80px;">
										<col style="min-width: 150px;">
										<col style="min-width: 50px;">
										<col style="min-width: 300px;">
										<col style="min-width: 150px;">
										<col style="min-width: 90px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">학년도</th>
											<th scope="col">학기</th>
											<th scope="col">장학명</th>
											<th scope="col">차수</th>
											<th scope="col">접수서류</th>
											<th scope="col">접수일</th>
											<th scope="col">처리상태</th>
										</tr>
									</thead>
									<tbody id="resultTbody">
									</tbody>
								</table>
							</div>					
						</div>
						<div class="btn-box " id="BTN_BOX">
							<div class="form-row align-items-center btn-box-right">
								<div class="col-auto ">
									<p class="info-text info-text-style-2">근로장학금의 경우 신청기간에서 '접수불가' 처리시, 신청서 삭제 후 다른 기관으로 신청가능합니다.</p>
								</div>
								<div class="col-auto">
									<button class="btn btn-new mb-2" data-lang onclick="fn_openPopup('C')">등록</button>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>
<!-- 계획서입력내역 -->
<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:RN#</td>
		<td>#:SYEAR#</td>
		<td>#:TERM_NM#</td>
		<td><a href ="#popup">#:JH_NM#</a></td>
		<td>#:APPLY_CHASU#</td>
		<td>#:JH_SUBMIT_DOC_GCD_NM#</td>
		<td>#:CONF_DATE#</td>
		<td>#:CONF_NM#</td>
	</tr>
</script>
<script type="text/javascript">


	function fn_initScreen() {		
		if(scwin.loginUser.userGcd != '0003'){
			alert('해당 서비스를 사용할 수 없습니다.');
			location.href="/"
		}
		fn_sch();
	}

	var termInfo = []; //기준학년도/학기
	/***************************************************************************************************
	* 신청기간 조회
	***************************************************************************************************/
	function fn_sch(data){
		if (gfn_com_isEmptyObject(data)) {
			data = {"JH_APPLY_GCD" : '0020' };
		}
		gfn_ajax_request({
			url : "/ost/jh/jhapply/WorkJhApply/selectListWorkJhApplySchd",
			reqData : data,
			success : function(data, responseData) {
				termInfo = responseData.termInfo;
				var dataset1 = data[0];
	               
                if (!gfn_com_isEmptyObject(dataset1)) {
                	if(data[0].O_MSG){ //신청기간이 아니면 리턴 메세지
						$("#MSG").removeClass("d-none"); 
						$("#grid01").hide();		
						$("#BTN_BOX").hide();		
		        	}else{
		        		//신청리스트 조회
		        		fn_applySch();
		        	}
				}else{
					
				}
			}
		});
	}
	
	var chasu = 1;
	/***************************************************************************************************
	* 신청리스트 조회
	***************************************************************************************************/
	function fn_applySch() {
		 var searchParam = {"SYEAR" : termInfo.SYEAR
										, "TERM_GCD" : termInfo.TERM_GCD
										, "JH_CHARGE_VIA_GCD" : '0000' 
										, "JH_GCD" : '0021' 
										, "JH_APPLY_GCD" : '0020' 
										};

		 /* ajax처리 */
		gfn_ajax_request({
			url : "/ost/jh/jhapply/WorkJhApply/selectListWorkJhApply",
			reqData : searchParam,
			success : function(data, responseData) {
				chasu = Number(data.length+1);
				$("#resultTbody ").listView({
	                dataSource : data,
	                emptyComment : '등록된 지원신청이 없거나 검색된 지원신청이 없습니다.',
	                dataBound : function(e) {
                        $('#resultTbody tr').find("td:eq(3)").bind("click", function(e){ //그리드 장학명 클릭시 이벤트
	                        scwin.detailObj = $(this).closest("tr").data();
	                        fn_openPopup('U');
                        });
	                },
	                template : $("#resultTemplate"),
					totalCnt : responseData.totalCnt
	            });
			}
		});
	}

	/***************************************************************************************************
	* 등록 팝업 
	***************************************************************************************************/
	function fn_openPopup(param) {
		if(param == "C") {
			scwin.rowState = 'C';
			scwin.detailObj = {};
			
		};
		if(param == "U") {scwin.rowState = 'U';};
		
		// 세션데이터 담기
		fn_getSessionInfo(param);
		gfn_com_modalPopup({
			width : 1500,
			height : 850,
			index : 3,
			target : null,
			title : "장학생(근로) 신청",
			include : "/html/ost/jh/jhapply/WorkJhApplyPop.html"
		});
	}

	/***************************************************************************************************
	* 세션값 저장
	***************************************************************************************************/
	function fn_getSessionInfo(param) {
		scwin.detailObj.STDT_NO = scwin.loginUser.userId; //학번
	    scwin.detailObj.STDT_INFO = scwin.loginUser.userId; //학번(성명)
		scwin.detailObj.HJ_STA_NM = scwin.loginUser.hjStaGcdKorNm; //학적상태
		scwin.detailObj.STDT_KOR_NM = scwin.loginUser.nm; //성명
		if(scwin.loginUser.collGradGcd == '0001'){
			//대학
			scwin.detailObj.STDT_YEAR_NM = scwin.loginUser.stdtYearGcdKorNm;  //학년
		}else{
			//대학원
			scwin.detailObj.STDT_YEAR_NM = scwin.loginUser.atlectTermCnt; //학기
		}
		if(param == "C") {
			var nowDay = new Date();
			var today = nowDay.toISOString().slice(0, 10);
		
			scwin.detailObj.SYEAR = termInfo.SYEAR;
			scwin.detailObj.TERM_GCD = termInfo.TERM_GCD;
			scwin.detailObj.APPLY_DT = today;  
			scwin.detailObj.APPLY_SYEAR_TERM = termInfo.SYEAR + '학년도 ' + termInfo.TERM_GCD_KOR_NM;
			scwin.detailObj.APPLY_CHASU = 1;
			scwin.detailObj.JH_CD = '';
		}else{
			scwin.detailObj.APPLY_SYEAR_TERM = scwin.detailObj.SYEAR + '학년도 ' + scwin.detailObj.TERM_NM; 
		}
	}
</script>