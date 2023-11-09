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
				<section class="sec-2">
					<div class="sec-body">
						<section class="sec-3">
							<div class="search-box">
									<!-- 1단 테이블 START -->
									<div class="b-table-box flex-col-1" role="table" aria-label="1단 테이블">
										<div class="b-row-box" role="row">
											<div class="b-row-item">
												<div class="b-title-box" role="rowheader">
													<label>검색방법</label>
												</div>
												<div class="b-con-box" role="cell">
													<input type="radio" id="SEARCH_GBN_0" name="SEARCH_GBN" class="" style="" value="001" checked="checked"/>
													<LABEL for="SEARCH_GBN_0" style="margin-right:10px">전체성적</LABEL>
													<input type="radio" id="SEARCH_GBN_1" name="SEARCH_GBN" class="" style="merge-right:2px" value="002"/>
													<LABEL for="SEARCH_GBN_1" style="margin-right:10px">교과목 구분별 성적</LABEL>
													<input type="radio" id="SEARCH_GBN_2" name="SEARCH_GBN" class="" style="merge-right:2px" value="003" />
													<LABEL for="SEARCH_GBN_2" style="margin-right:10px">누계학점</LABEL>
												</div>
											</div>
										</div>
									</div>
									<!-- 1단 테이블 END-->
									
									<!-- 버튼 목록 START -->
									<div class="btn-box">
										<div class="form-row">
											<div class="col-auto">
												<button class="btn print-btn" type="button" onclick="fn_print()">출력</button>
											</div>
										</div>
									</div>
									<div class="message-box allSch_hidden">
										<div class="message-box-inner">
											<div class="message-body">
												<ul class="list list-style-1">
													<div id="doc" style="">
														<li class="allsch_txt"></li>
													</div>
												</ul>
											</div>
										</div>
									</div>
									<!-- 버튼 목록 END -->
								</div>
						</section>
						<section class="sec-3">
							<div class="sec-body">
								<header>
									<h4 class="sec-title" id="title">전체성적</h4>
								</header>
								<div class="sec-body">
									<div class="table-box" id="table1">
										<div class="table-body">
											<table class="table table-hover"  data-show-columns="false" >
												<caption>전체성적정보</caption>
												<colgroup>
														<col style="min-width:80px;">
														<col style="min-width:95px;">
														<col style="min-width:90px;">
														<col style="min-width:90px;">
														<col style="min-width:200px;">
														<col style="min-width:70px;">
														<col style="min-width:70px;">
														<col style="min-width:225px;">
												</colgroup>
												<thead>
													<tr>
														<th scope="col" >학년도</th>
														<th scope="col" >학기</th>
														<th scope="col" >성적분류</th>
														<th scope="col" >교과구분</th>
														<th scope="col" >교과목명</th>
														<th scope="col" >학점</th>
														<th scope="col" >성적등급</th>
														<th scope="col" >비고</th>
													</tr>
												</thead>
												<tbody id="resultTbody1">
												</tbody>
											</table>
										</div>
									</div>
									<div class="table-box" id="table2">
										<div class="table-body">
											<table class="table table-hover"   data-show-columns="false">
												<caption>교과목 구분별 성적정보</caption>
												<colgroup>
													<col style="min-width:90px;">
													<col style="min-width:80px;">
													<col style="min-width:90px;">
													<col style="min-width: 200px;">
													<col style="min-width: 70px;">
													<col style="min-width: 70px;">
													<col style="min-width:225px;">
												</colgroup>
												<thead>
													<tr>
														<th scope="col" >교과구분</th>
														<th scope="col" >학년도</th>
														<th scope="col" >학기</th>
														<th scope="col" >교과목명</th>
														<th scope="col" >학점</th>
														<th scope="col" >성적등급</th>
														<th scope="col" >비고</th>
													</tr>
												</thead>
												<tbody id="resultTbody2">
												</tbody>
											</table>
										</div>
									</div>
									<div class="table-box" id="table3">
										<div class="table-body">
											<table class="table table-hover"   data-show-columns="false">
												<caption>누계학점정보</caption>
												<colgroup>
													<col style="min-width: 80px;width:100px">
													<col style="min-width: 90px;width:120px">
													<col style="min-width: 90px;width:120px">
													<col style="min-width: 80px;">
													<col style="min-width: 80px;">
													<col style="min-width: 80px;">
													<col style="min-width: 80px;">
													<col style="min-width: 80px;">
												</colgroup>
												<thead>
													<tr>
														<th scope="col" >학년도</th>
														<th scope="col" >학기</th>
														<th scope="col" >성적분류</th>
														<th scope="col" >신청학점</th>
														<th scope="col" >취득학점</th>
														<th scope="col" >총평점</th>
														<th scope="col" >평균평점</th>
														<th scope="col" >석차</th>
													</tr>
												</thead>
												<tbody id="resultTbody3">
												</tbody>
											</table>
										</div>
									</div>
									<div class="table-box" id="table4">
										<div class="table-body">
											<table class="table table-hover"  data-show-columns="false">
												<caption>재이수 대상과목정보</caption>
												<colgroup>
													<col style="min-width: 80px;">
													<col style="min-width: 90px;">
													<col style="min-width: 90px;">
													<col style="min-width: 90px;">
													<col style="min-width: 200px;">
													<col style="min-width: 70px;">
													<col style="min-width: 70px;">
												</colgroup>
												<thead>
													<tr>
														<th scope="col" >학년도</th>
														<th scope="col" >학기</th>
														<th scope="col" >성적분류</th>
														<th scope="col" >교과구분</th>
														<th scope="col" >교과목명</th>
														<th scope="col" >학점</th>
														<th scope="col" >성적등급</th>
													</tr>
												</thead>
												<tbody id="resultTbody4">
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</section>
			</div>
		</section>
	</main>
</div>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/x-tbody-template" id="resultTemplate1">
	<tr style="cursor:pointer;">
	    <td class=" table-secondary">#:SYEAR#</td>
		<td class="table-secondary">#:TERM_NM#</td>
		<td class="table-secondary">#:SJ_CATE_GCD_NM#</td>
        <td >#:SUBJ_GCD_NM#</td>
	    <td class="text-left">#:SUBJ_NM#</td>
	    <td >#:CRDT#</td>
		<td class="text-center">#:GRADE_CD#</td>
	    <td class="text-left">#:RMRK#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate2">
	<tr style="cursor:pointer;">
        <td>#:SUBJ_GCD_NM#</td>
	    <td>#:SYEAR#</td>
		<td >#:TERM_NM#</td>
	    <td class="text-left">#:SUBJ_NM#</td>
	    <td class="">#:CRDT#</td>
		<td class="text-center">#:GRADE#</td>
	    <td class="text-left">#:RMRK#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate3">
	<tr style="cursor:pointer;">
	    <td>#:SYEAR#</td>
		<td>#:TERM_NM#</td>
		<td>#:SJ_CATE_GCD_NM#</td>
        <td>#:APPLY_CRDT#</td>
		<td>#:ACQ_CRDT#</td>
	    <td>#:GEP_TOT#</td>
		<td>#:GPA#</td>
	    <td>#:ALL_RANKING#</td>
	</tr>
</script>
<script type="text/x-tbody-template" id="resultTemplate4">
	<tr style="cursor:pointer;">
	    <td class="table-secondary">#:SYEAR#</td>
		<td class="table-secondary">#:TERM_NM#</td>
		<td >#:SJ_CATE_GCD_NM#</td>
		<td >#:SUBJ_GCD_NM#</td>
		<td class="text-left">#:SUBJ_NM#</td>
		<td class="">#:CRDT#</td>
		<td class="text-center">#:GRADE#</td>
	</tr>
</script>
<script type="text/javascript">
	var totalCnt = 0;
	var _autoComplete;
	var _multi;
	
	$(function (){
		$(".allSch_hidden").hide();
 		if(scwin.loginUser.userGcd === '0003'){
			$('.b-con-box').append(
					'<input type="radio" id="SEARCH_GBN_3" name="SEARCH_GBN" class="" style="" value="004" />'
					+'<LABEL for="SEARCH_GBN_3">재이수 대상과목</LABEL>'
			)
		}
		
		$('input[type=radio][name=SEARCH_GBN]').change(function (){
			fn_search(this.value);
		});
	});
	
	function fn_initScreen() {
		fn_GradeConf()
		hideAllTable();
		$("#table1").show();
		fn_search('001');
	}
	function hideAllTable(){
		$("#table1").hide();
		$("#table2").hide();
		$("#table3").hide();
		$("#table4").hide();
	}
	
	function fn_search(value){
		const radioValue = value;
		let ajaxPath = '/ost/sj/sjsearch/allsjsearch';
		//const userId = scwin.loginUser.userId;
		let success;
		hideAllTable();
		if(radioValue == '001'){ // 전체성적 조회
			$("#table1").show();
			ajaxPath += '/selectQueryAllSj';
			$("#title").text("전체성적");
			success =  function(data, responseData) {
				
				$("#resultTbody1").listView(
					{
						emptyComment:'해당검색조건의 성적 데이터가 존재하지 않습니다.',
						dataSource : data,
						dataBound : function(e) {
							currentData = data;
						},
						template : $("#resultTemplate1"),
						totalCnt : responseData.totalCnt,
				});
				if(data.length == 0 ) return; //2023-06-09 추가 김동영
				
				if(data[0].O_RSLT == "N") {
					let html2 = `<tr style="cursor:pointer;">`;
					html2 += `<td colspan="8" class="text-center table-secondary">  ${'${data[0].O_MSG}'} `
					html2 += `</td></tr>`	
					$('#resultTbody1').children()[0].innerHTML = html2;
					
				} else {
				
					for(index in data){
						if(data[index].CRDT === '999'){
							let html = `<tr style="cursor:pointer;">`;
							if(data[index].TERM_NM === "총학기"){
								html += `<td colspan="8" class="text-left table-secondary"> `
								html += `  총신청학점 : ${'${parseFloat(Math.round(data[index].APPLY_CRDT * 100)/ 100).toFixed(1)}'} `
								html += `&nbsp;&nbsp;&nbsp;&nbsp;총취득학점 : ${'${parseFloat(Math.round(data[index].ACQ_CRDT * 100)/ 100).toFixed(1)}'} `
								html += `&nbsp;&nbsp;&nbsp;&nbsp;총평점 : ${'${parseFloat(Math.round(data[index].GEP_TOT * 100)/ 100).toFixed(2)}'} `
								html += `&nbsp;&nbsp;&nbsp;&nbsp;총평균평점 : ${'${parseFloat(Math.round(data[index].GPA * 100)/ 100).toFixed(2)}'} `
								html += `&nbsp;&nbsp;&nbsp;&nbsp;총전공평점 : ${'${parseFloat(Math.round(data[index].MAJOR_GPA * 100)/ 100).toFixed(2)}'} `
								html += `&nbsp;&nbsp;&nbsp;&nbsp;백분환산율 :  ${'${data[index].CHANGE_RATE}'}`
								html += `&nbsp;&nbsp;&nbsp;&nbsp;전체석차 :  ${'${data[index].ALL_RANKING}'}`
							}else{
								html += `<td class="table-secondary">${'${data[index].SYEAR}'}</td>`
								html += `<td colspan="7" class="text-left table-secondary text-danger"> `
								html += `신청학점 : ${'${parseFloat(Math.round(data[index].APPLY_CRDT * 100)/ 100).toFixed(1)}'} `
								html += `&nbsp;&nbsp;&nbsp;&nbsp;취득학점 : ${'${parseFloat(Math.round(data[index].ACQ_CRDT * 100)/ 100).toFixed(1)}'} `
								html += `&nbsp;&nbsp;&nbsp;&nbsp;총평점 : ${'${parseFloat(Math.round(data[index].GEP_TOT * 100)/ 100).toFixed(2)}'} `
								html += `&nbsp;&nbsp;&nbsp;&nbsp;평균평점 : ${'${parseFloat(Math.round(data[index].GPA * 100)/ 100).toFixed(2)}'} `
								html += `&nbsp;&nbsp;&nbsp;&nbsp;전공평점 : ${'${parseFloat(Math.round(data[index].MAJOR_GPA * 100)/ 100).toFixed(2)}'} `
								if(data[index].ALL_RANKING != "0/0"){
									html += `&nbsp;&nbsp;&nbsp;&nbsp;전체석차 : ${'${data[index].ALL_RANKING}'}`
								}
								
							}
							html += `</td></tr>`	
							$('#resultTbody1').children()[index].innerHTML = html;
						}
					}
				}
			}
		}else if(radioValue == '002'){ // 교과목 구분별 성적
			$("#table2").show();
			$("#title").text("교과목 구분별 성적");
			ajaxPath += '/selectQuerySubjGcd';
			success =  function(data, responseData) {
				$("#resultTbody2").listView(
					{
						emptyComment:'해당검색조건의 성적 데이터가 존재하지 않습니다.',
						dataSource : data,
						dataBound : function(e) {
							currentData = data;
						},
						template : $("#resultTemplate2"),
						totalCnt : responseData.totalCnt,
						
				});
			}
		}else if(radioValue == '003'){ // 누계학점
			$("#table3").show();
			$("#title").text("누계학점");
			ajaxPath += '/selectQueryTotalCrdt';
			success =  function(data, responseData) {
				$("#resultTbody3").listView(
					{
						emptyComment:'해당검색조건의 성적 데이터가 존재하지 않습니다.',
						dataSource : data,
						dataBound : function(e) {
							currentData = data;
						},
						template : $("#resultTemplate3"),
						totalCnt : responseData.totalCnt,
				});
				for(index in data){
					if(data[index].SYEAR === "9999"){
						let html = `<td class="text-left" colspan="6">`;
						html += `  총신청학점 : ${'${parseFloat(Math.round(data[index].APPLY_CRDT * 100)/ 100).toFixed(1)}'} `
						html += `&nbsp;&nbsp;&nbsp;&nbsp;총취득학점 : ${'${parseFloat(Math.round(data[index].ACQ_CRDT * 100)/ 100).toFixed(1)}'} `
						html += `&nbsp;&nbsp;&nbsp;&nbsp;총평점 : ${'${parseFloat(Math.round(data[index].GEP_TOT * 100)/ 100).toFixed(2)}'} `
						html += `&nbsp;&nbsp;&nbsp;&nbsp;총평균평점 : ${'${parseFloat(Math.round(data[index].GPA * 100)/ 100).toFixed(2)}'} `
						html += `&nbsp;&nbsp;&nbsp;&nbsp;석차 :  ${'${data[index].ALL_RANKING}'}`
						html += `</td>`;
						$('#resultTbody3').children()[index].innerHTML = html;
						
					}
				}
			}
		}else if(radioValue == '004'){ // 재이수 대상과목
			$("#table4").show();
			$("#title").text("재이수 대상과목");
			ajaxPath += '/selectQueryTatgetSubj';
			success =  function(data, responseData) {
				$("#resultTbody4").listView(
					{
						emptyComment:'재이수 대상과목이 존재하지 존재하지 않습니다.',
						dataSource : data,
						dataBound : function(e) {
							currentData = data;
						},
						template : $("#resultTemplate4"),
						totalCnt : responseData.totalCnt,
						
				});
			}
		}
		gfn_ajax_request({
			url : ajaxPath,
			reqData : {
				//USER_ID : scwin.loginUser.userId,
			},
			success : success
		});
		
	}
	
	function fn_GradeConf(){
		let ajaxPath = '/ost/sj/sjsearch/allsjsearch';
		let success;
		ajaxPath += '/selectQueryGradeConf';
		success =  function(data, responseData) {
			if(Object.keys(data).length > 0){
				if(data[0].O_RSLT == "N") {
					$(".allSch_hidden").show();
					let html3 = `<span class="dfn">※ `;
					html3 += `${'${data[0].O_MSG}'} `;
					html3 += `</span>`;
					$('.allsch_txt').html(html3);
					
				} 
			} else {
				$(".allSch_hidden").show();
			}
			
		}
		gfn_ajax_request({
			url : ajaxPath,
			reqData : {
			},
			success : success
		});
		
	}
	
	function fn_print(){
		const radioValue = $('input[name="SEARCH_GBN"]:checked').val();
		if(radioValue === '001'){ //전체성적
			fn_openReport('001','전체성적');
		}
		else if(radioValue === '002'){ //교과목 구분별 성적
			fn_openReport('002','교과목 구분별 성적');
		}
		else if(radioValue === '003'){ //누계학점
			fn_openReport('003','누계학점');
		}
		else if(radioValue === '004'){ //재이수 대상과목
			fn_openReport('004','재이수 대상과목');
		}
	}
	
	
	
	function fn_openReport(rptNo,rptTitle) {
		var options ={};
                    
        options.rptName = "/ses/sj/sjmng/ledgerlist/sjSearch/AllSjSearch_"+rptNo+".crf";
   
        //파라메터 설정
        //var objParam = dma_SearchParam.getJSON();
        var objParam = {};
        //objParam.STDT_NO 							= scwin.loginUser.userId;
        objParam.STDT_NM 							= scwin.loginUser.nm;
        //레포트를 생성시킬 group component 또는 id를 넣는다.
        options.div = 'grp_report';
        options.rptTitle = rptTitle;
        objParam.bind = [{
            db : "OST",
            proc : "OST_성적_전체성적_조회",
            params : [scwin.loginUser.userId]
    	}];

        if(rptNo === '001'){ //전체성적
        	objParam.bind[0].proc = "OST_성적_전체성적_조회"
		}
		else if(rptNo === '002'){ //교과목 구분별 성적
			objParam.bind[0].proc = "OST_성적_교과구분별성적_조회"
		}
		else if(rptNo === '003'){ //누계학점
			objParam.bind[0].proc = "OST_성적_누계학점_조회"
		}
		else if(rptNo === '004'){ //재이수 대상과목
			objParam.bind[0].proc = "OST_성적_재이수과목_조회"
		}
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
        fn_openPopup(options);
	}
	
	function fn_openPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : rptOptions.rptTitle,
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}
</script>