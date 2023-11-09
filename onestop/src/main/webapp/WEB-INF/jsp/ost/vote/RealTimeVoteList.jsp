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
			<!-- 바디영역 -->
			<div class="search-box">
				<input type="hidden" id="year" class="form-control" />
				<input type="hidden" id="term" class="form-control" />
			</div>
				<div class="expand text-right mb-2">조회일시 : <span id="d-msg"></span></div></br>
				<!-- 테이블 리스트 - 헤더 고정 -->
				<div class="table-box table-list">
					<div class="table-body">
						<table class="table table-hover" data-toggle="table" data-show-column="true">
							<caption>학생회 선거 실시간 투표율</caption>
							<colgroup>
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
								<col style="min-width: 100px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">투표명</th>
									<th scope="col">유권자수</th>
									<th scope="col">투표자수</th>
									<th scope="col">투표율</th>
								</tr>
							</thead>
							<tbody id="resultTbody">
						</table>
					</div>
				</div>
				<!-- /END 테이블 -->
			
			<!-- 바디영역 -->
			</div>
		</section>
	</main>
</div>

<script type="text/x-tbody-template" id="resultTemplate">
	<tr style="cursor:pointer;">
		<td>#:cnt#</td>
        <td>#:vote_nm#</td>
	    <td>#:total_voter_count#</td>
	    <td>#:voter_count#</td>
	    <td>#:vote_rate#</td>
	</tr>
</script>
<script type="text/javascript">

	var totalCnt = 0;
	var _autoComplete;
	var _multi;

	function fn_initScreen() {
		getCurrentTime();
		serviceTerm();
	}

/***************************************************************************
 * 해외파견 자비 신청자정보 조회
 **************************************************************************/		
 /* [2019-11-21 정문주]함수로 분리함  */
 function getCurrentTime() {
     var currentDate = new Date();
     var divClock = document.getElementById("d-msg");
     
     var mi = currentDate.getMinutes();
     var hh = currentDate.getHours();
     var dd = currentDate.getDate();
     var mm = currentDate.getMonth()+1;
     var year = currentDate.getFullYear();
     
     // 분
     if(mi < 10){
     	mi = '0'+mi;
     }
 	// 시간
 	if (hh < 10) {
 		hh = '0'+hh;
 	}
     // 일
     if(dd<10) {
         dd = '0'+dd;
     } 
 	// 월
     if(mm < 10) {
         mm = '0'+mm;
     } 
      
     var msg = year+"-"+mm+"-"+dd+" "+hh+":"+mi;
     divClock.innerText = msg;
 }
 /* [2019-11-21 정문주]조회기간 체크  */
 function serviceTerm() {
	 /*
 	var paramMap = {};
 	paramMap["pName"] = [ ];
 	paramMap["pValue"] = [ ];	
 	var html = "";
 	$.ajax({
 		url : "/ost/vote/realtimevote/serviceTerm",
 		type : 'POST',
 		dataType : 'json',
 		async : false,
 		data : JSON.stringify(paramMap),
 		contentType : 'application/json',
 		success : function(data) {
 			var datas1 = data.dataset1;
 			var msgDlgType = '';
 			msgDlgType = nvl(datas1[0].MSG);
 			if(msgDlgType != '조회불가'){
 				html = '<h3>' + datas1[0].MSG + '&nbsp(' + datas1[0].조회가능기간+ ')</h3>';
 				$("#autoMsg").html(html);
 			} else {
 				$("#year").val(datas1[0].년도);
 				$("#term").val(datas1[0].차수);
 				voteList();
 			}
 		},
 		error : function(data, status, er) {
 			alert("error: " + data + " status: " + status + " er:" + er);
 		}
 	});
 	*/
 	data = {
   	};
	gfn_ajax_request({
		url : "/ost/vote/realtimevote/serviceTerm",
		reqData : data,
		success : function(data, responseData) {
			if (!gfn_com_isEmptyObject(data)) {
				if (data[0].MSG == "조회불가") {
					alert2(data[0].조회가능기간, '');
					return;
				} else {
					$("#year").val(data[0].년도);
	 				$("#term").val(data[0].차수);
	 				
	 				//테스트
	 				/*
	 				$("#year").val("2019");
	 				$("#term").val("2");
					*/
	 				voteList();
				}
			}else{
				alert2("학생회 선거 실시간 투표율 열람기간이 아닙니다.",function (e){history.back();});
			}
		}
	});
 }
 /* 학생선거 리스트  */
 function voteList() {
 	var year = $("#year").val();
 	var term = $("#term").val();
 
 	data = {
		"year" : year,
		"term" : term
	};
 	
 	$.ajax({ 
 		url: "/vote/external/list", 
 	    type: 'GET', 
 	    dataType: 'json', 	    
 	    data: data,
 	    async: false,     //동기 비동기 설정
 		success: function(jsonData) {
 			
 	    	$.each(jsonData, function (i) {
 				var cnt = i+1;
 				jsonData[i].cnt = cnt;
 				$("#resultTbody").listView({
					dataSource : jsonData,
					emptyComment : '조회내역이 없습니다.',
					dataBound : function(e) {
						totalCnt = jsonData.length;
						currentData = jsonData;
					},
					template : $("#resultTemplate"),
					totalCnt : jsonData.length
				});
 				
 	    	});
 			
 	    },
 	    error:function(data,status,er) { 
 	        alert("error: "+data+" status: "+status+" er:"+er);
 	    }
 	});
 	
	/*
 	var year = $("#year").val();
	var term = $("#term").val();
	
	data = {
		"year" : year,
		"term" : term
	};
	gfn_ajax_request({
		url: "/vote/external/list", 
		reqData : data,
		success : function(data, responseData) {
			
			$("#resultTbody").listView({
				dataSource : data,
				dataBound : function(e) {
					totalCnt = responseData.totalCnt;
					currentData = data;
				},
				template : $("#resultTemplate"),
				totalCnt : responseData.totalCnt,
				paging : null,
				excel : null
			});
			
		}
	});
 	*/
 }
 
 

</script>
	