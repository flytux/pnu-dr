<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">

	var _year; //년도
	var _term; //학기
	var _appYN; //신청여부
	var _appYear; //신청내역 연도
	var _appTerm; //신청내역 학기
	var _appProj; //신청내역 계획서번호
	var _datas;
	
	$(document).ready(function(){
		init();
	});
	
	//폼로드시
	function init(){
		_appYN = "N"
		$("#btnAppSch").hide();
		$("#lblMSG").text("프로그램을 선택하여 주십시오.");
		//$("#mo1").modal('show');
		memberChk();
	}
	
	//대상여부확인
	function memberChk(){
		var paramMap = {};  
		paramMap["pName"] = [ "STDT_CD" ];
		paramMap["pValue"] = [ "${encodedStdtCd}" ];
		
		$.ajax({ 
		    url: "/middleware/pnuMentoring/mentoring/mentoringInfoChkForeign", 
		    type: 'POST', 
		    dataType: 'json',
		    async: false,
		    data : JSON.stringify(paramMap),
		    contentType: 'application/json',
		    success: function(data) { 
				var datas=data.dataset1;
				var size=datas.length;
				//_datas=datas;
				
				if(size>0){
					var dat;
					var dat1;
					var dat2;
					var isOK;
					
					if(size==1){
						dat=datas[0];
						
						isOK=dat.신청가능여부;
						alert(dat.메세지);
						history.go(-1);
						return;
					}else{
						dat=datas[0][0];
						
						isOK=dat.신청가능여부;
						
						if(isOK=="Y"){
							_year = dat.연도;
							_term = dat.학기;
							
							dat1=datas[1][0];
							dat2=datas[2][0];
							
							$("#lbl국문성명").text(dat2.성명);
							$("#lbl영문성명").text(dat2.영문성명);
							$("#lbl이수과정").text(dat2.학위과정);
							$("#lbl성별").text(dat2.성별);
							$("#lbl학과").text(dat2.학과);
							$("#lbl학번").text(dat2.학번);
							$("#lbl국적").text(dat2.국적);
							$("#lbl연락처").text(dat2.휴대폰번호);
							$("#lbl이메일").text(dat2.이메일);
							
							$("#lbl국문성명2").text(dat2.성명);
							$("#lbl영문성명2").text(dat2.영문성명);
							$("#lbl이수과정2").text(dat2.학위과정);
							$("#lbl성별2").text(dat2.성별);
							$("#lbl학과2").text(dat2.학과);
							$("#lbl학번2").text(dat2.학번);
							$("#lbl국적2").text(dat2.국적);
							$("#lbl연락처2").text(dat2.휴대폰번호);
							$("#lbl이메일2").text(dat2.이메일);
							
							if (datas[1].length>0){
								_appYN = "Y"
								$("#btnAppSch").show();
								_appYear = dat1.연도;
								_appTerm = dat1.학기;
								_appProj = dat1.계획서번호;
								
								applySearch();
							}
							
							fn_event();
							ProgramList();
						}
					}
				}				
		    },
		    error:function(data,status,er) { 
		        alert("error: "+data+" status: "+status+" er:"+er);
		    }
		});		
	}
	
	//ProgramList
	function ProgramList() {
		var paramMap = {};  
		paramMap["pName"] = [ ];
		paramMap["pValue"] = [ ];
		
		$.ajax({ 
		    url: "/middleware/pnuMentoring/mentoring/mentoringSearchForeign", 
		    type: 'POST', 
		    dataType: 'json',
		    async: false,
		    data : JSON.stringify(paramMap),
		    contentType: 'application/json',
		    success: function(data) { 
				var datas=data.dataset1;
				var size=datas.length;
				var html='<option value="">선택</option>';
				
				if(size>0){
					$(datas).each(function(key,val){
						html += '<option value="'+val.코드+'">'+val.코드명+'</option>';
					});
				}
				
				$("#sel_val").html(html);
		    },
		    error:function(data,status,er) { 
		        alert("error: "+data+" status: "+status+" er:"+er);
		    }
		});
	}
	
	//ProgramListDetail
	function ProgramListDetail(paramMap) {		
		$.ajax({ 
		    url: "/middleware/pnuMentoring/mentoring/mentoringDetailSearchForeign", 
		    type: 'POST', 
		    dataType: 'json',
		    async: false,
		    data : JSON.stringify(paramMap),
		    contentType: 'application/json',
		    success: function(data) { 
				var datas=data.dataset1;
				var size=datas.length;
				var html='';
				
				if(size>0){
					$(datas).each(function(key,val){
						html += '<table class="table table_line table-bordered"><tr>';
						html += '<th class="table_box_background3 table_w15 wordbreak_keepall">성명(Name) 姓名</th><td>'+val.성명+'</td>';
						html += '<th class="table_box_background3 table_w20 wordbreak_keepall">성별(Gender) 性别</th><td>'+val.성별+'</td>';
						html += '</tr><tr>';
						html += '<th class="table_box_background3 wordbreak_keepall">소속(Position) 所属</th><td colspan="3" style="text-align:left;">'+val.소속+'</td>';
						html += '</tr><tr>';
						html += '<th class="table_box_background3 wordbreak_keepall">멘토링명칭<br>(Mentoring Title)<br>活动名称</th><td colspan="3" style="text-align:left;">'+val.프로그램명+'</td>';
						html += '</tr><tr>';
						html += '<th class="table_box_background3 wordbreak_keepall">주된 멘토링 장소<br>(Primary Mentoring Location)<br>主要辅导场所</th><td colspan="3" style="text-align:left;">'+val.멘토링장소+'</td>';
						html += '</tr><tr>';
						html += '<th class="table_box_background3 wordbreak_keepall">멘토 소개<br>(INTRODUCTION of MENTORS)<br>导师简介 </th><td class="wordbreak_keepall" colspan="3" style="white-space:pre-line; text-align:left;">'+val.멘토링소개+'</td>';
						html += '</tr><tr>';
						html += '<th class="table_box_background3 wordbreak_keepall">유학생 멘토링 중점 활동내용<br>(PNU HOST PROGRAM MAIN ACTIVITIES)<br>PNU HOST PROGRAM (留学生指导活动) 主要活动项目 </th><td class="wordbreak_keepall" colspan="3" style="white-space:pre-line; text-align:left;">'+val.자격및경력+'</td>';
						html += '</tr><tr>';
						
						if (val.신청가능여부=="Y"){
							html += '<td><input type="button" value="신청(Apply) 申请" class="btn btn-primary btn-sm"'; 
							html += 'onclick="app_ins(\''+val.프로그램명+'\',\''+val.성명+'\',\''+val.소속+'\',\''+val.계획서번호+'\',\'N\')"</td>';
							html += '<td colspan="3" style="text-align:left;">신청인원(Number of Applicants) 申请人数: '+val.신청인원+'명</td>';
						}else{
							html += '<td><button class="btn" disabled="disabled">신청마감</button></td>';
							if (val.대기자신청가능여부=="Y"){
								html += '<td colspan="2" style="text-align:left;">신청인원(Number of Applicants) 申请人数: '+val.신청인원+'명</td>';
								html += '<td class="table_w15"><input type="button" value="대기자신청(Apply for the Waiting List) 候补者申请" class="btn btn-primary btn-sm"';
								html += 'onclick="app_ins(\''+val.프로그램명+'\',\''+val.성명+'\',\''+val.소속+'\',\''+val.계획서번호+'\',\'Y\')"</td>';
							}else{
								html += '<td colspan="3" style="text-align:left;">신청인원(Number of Applicants) 申请人数: '+val.신청인원+'명</td>';
							}
						}
						html += '</tr></table>';
					});
				}
				
				$("#list").html(html);
		    },
		    error:function(data,status,er) { 
		        alert("error: "+data+" status: "+status+" er:"+er);
		    }
		});
	}
	
	//신청하기 클릭시
	function app_ins(programNM, mentoNM, sosok, projCD, waitYN){
		if (_appYN=="Y"){
			alert("이미 신청한 프로그램이 있습니다.\n취소 후 이용가능 합니다.");
			return;
		}else {
			//alert(projCD);
			if (waitYN=="N"){
				if(confirm(mentoNM + "님을 멘토로 선택하여 신청합니다. 계속하시겠습니까?\n\n You have applied for the mentoring program with "+mentoNM+" designated as your mentor. Do you want to continue?\n\n 你已申请将"+mentoNM+"选择作为你的导师，继续吗?")){
					//alert("신청");
				}else{
					return;
				}
			}else{
				if(confirm(mentoNM + "님을 멘토로 선택하여 대기자로 신청합니다.\n취소자 발생 시 대기 순서에 따라 참여 가능할 수 있습니다.\n계속하시겠습니까?\n\n You have applied for the waiting list with "+mentoNM+" designated as your mentor. You can participate in the program if there are cancellations depending on your position on the waiting list. Do you want to continue?\n\n 你已将"+mentoNM+"选择为导师并申请作为候补者, 如有取消者将按顺序选拔. 继续吗?")){
					//alert("대기자신청");
				}else{
					return;
				}
			}
			
			$("#txt계획서번호").val(projCD);
			$("#lbl프로그램명칭").text(programNM);
			$("#lbl멘토소속").text(sosok);
			$("#lbl멘토성명").text(mentoNM);
			
			//신청서 레이어팝업
			$("#mo1").modal('show');
		}
	}
	
	//신청서의 신청하기버튼
	function btnClick(){
		if(!validation()){
			return;
		}
		
		var paramMap = {};
		paramMap["pName"] = [ "YEAR", "TERM_CD", "PROJ_CD", "STDT_CD", "IP" ];
		paramMap["pValue"] = [ _year, _term, $("#txt계획서번호").val(), "${encodedStdtCd}", "${clientIP}" ]; 
		
		$.ajax({ 
		    url : "/middleware/pnuMentoring/mentoring/applyInsertForeign",
		    type: 'POST', 
		    dataType: 'json', 
		    async: false,
		    data : JSON.stringify(paramMap),
		    contentType: 'application/json',
		    success: function(data) { 
		    	//alert("신청되었습니다.\n\n Application is successfully submitted.\n\n 已经完成申请。");
		    	
		    	var datas=data.dataset1;
				var size=datas.length;
				
				if(size>0){
					var dat=datas[0];
					
					alert(dat.메세지);
					
					if (dat.신청여부 == 'Y'){
				    	$("#mo1").modal('hide');
				    	location.reload();
					}else{
						return;
					}
				}
		    },
		    error:function(data,status,er) { 
		    	alert("error: " + data + " status: " + status + " er:" + er);
		    }
		});
	}
	
	function validation(){
		var chk1=$("#chk1").is(":checked");
		var chk2=$("#chk2").is(":checked");
		if(chk1==false){
			alert("프로그램 동의여부를 체크하여 주십시오.\n\n Please check if you agree to the program or not.\n\n 请核对是否同意活动。");
			return false;
		}else if(chk2==false){
			alert("개인정보 동의여부를 체크하여 주십시오.\n\n Please check if you agree to provide personal information or not.\n\n 请核对是否同意提供个人信息。");
			return false;
		} 
		
		return true;
	}
	
	//신청내역 조회
	function applySearch(){
		var paramMap = {};  
		paramMap["pName"] = [ "YEAR", "TERM_CD", "PROJ_CD", "STDT_CD" ];
		paramMap["pValue"] = [ _appYear, _appTerm, _appProj, "${encodedStdtCd}" ];
		
		$.ajax({ 
		    url: "/middleware/pnuMentoring/mentoring/applySearchForeign", 
		    type: 'POST', 
		    dataType: 'json',
		    async: false,
		    data : JSON.stringify(paramMap),
		    contentType: 'application/json',
		    success: function(data) { 
				var datas=data.dataset1;
				var size=datas.length;
				//_datas=datas;
				
				if(size>0){
					var dat=datas[0][0];
					var dat1=datas[1][0];
					
					$("#txt연도2").val(_appYear);
					$("#txt학기2").val(_appTerm);
					$("#txt계획서번호2").val(_appProj);
					$("#lbl프로그램명칭2").text(dat.프로그램명칭);
					$("#lbl멘토소속2").text(dat.멘토소속);
					$("#lbl멘토성명2").text(dat.멘토성명);
					$("#lbl신청일시2").text(dat.신청일시);
					$("#lbl신청정보2").text(dat.신청구분);
					$("#lbl취소일시국문2").text(dat1.일정_국문);
					$("#lbl취소일시영문2").text(dat1.일정_영문);
					$("#lbl취소일시중문2").text(dat1.일정_중문);
					
					if (dat1.취소가능여부 == "Y"){
						$("#btnAppDel").show();
					}else{
						$("#btnAppDel").hide();
					}
					
					//신청내역 레이어팝업
					$("#mo2").modal('show');
				}				
		    },
		    error:function(data,status,er) { 
		        alert("error: "+data+" status: "+status+" er:"+er);
		    }
		});	
	}
	
	//신청내역 신청취소
	function btnDel(){
		var paramMap = {};
		paramMap["pName"] = [ "YEAR", "TERM_CD", "PROJ_CD", "STDT_CD", "IP" ];
		paramMap["pValue"] = [ $("#txt연도2").val(), $("#txt학기2").val(), $("#txt계획서번호2").val(), "${encodedStdtCd}", "${clientIP}" ];
		
		$.ajax({ 
		    url : "/middleware/pnuMentoring/mentoring/applyDeleteForeign",
		    type: 'POST', 
		    dataType: 'json', 
		    async: false,
		    data : JSON.stringify(paramMap),
		    contentType: 'application/json',
		    
		    success: function(data) { 
		    	if(confirm("신청취소하시겠습니까?")){
		    		alert("신청취소 되었습니다.\n\n Application is successfully canceled.\n\n 申请已经取消。");
			    	$("#btnAppSch").hide();
			    	$("#mo2").modal('hide');
			    	location.reload();
				}else{
					return;
				}
		    },
		    error:function(data,status,er) { 
		    	alert("error: " + data + " status: " + status + " er:" + er);
		    }
		});
	}
	
	function emulAcceptCharset(form) {
	    if (form.canHaveHTML) { // detect IE
	        document.charset = form.acceptCharset;
	    }
	    return true;
	}
	
	//이벤트 세팅
	function fn_event(){
		//프로그램리스트 변경시
		$('#sel_val').change(function(e){
			//alert($("#sel_val").val());
			var sel_val=$("#sel_val").val(); //프로그램 value
			var sel_text=$("#sel_val option:selected").text(); //프로그램text
			
			if(sel_val!=""){
				$("#lblMSG").text(sel_text);
				
				var paramMap = {};
				paramMap["pName"] = [ "YEAR", "TERM_CD", "ITEM_CD" ];
				paramMap["pValue"] = [ _year, _term, sel_val ];
				ProgramListDetail(paramMap);
			}else{
				$("#lblMSG").text("프로그램을 선택하여 주십시오.");
				reset();
			}
	  	});	
	}
	
	//reset
	function reset(){
		$("#list").html("");
	}
</script>
<div class="col-md-9">
	<h3>PNU 유학생 멘토링(PNU Host Program) 신청</h3>
	<input type="hidden" id="target_re" />
	
	<!-- TOGGLE -->
	<div class="toggle">
		<div class="toggle active">
			<label><b><i class="fa fa-angle-right"></i></b>&nbsp;PNU 유학생 멘토링(PNU Host Program) 신청</label>
			<div class="toggle-content">
				<table class="table table-borded">
					<tbody>
						<tr>
							<th class="table_box_background" style="width:15%">◎ 분류선택</th>
							<td class="table_m" style="text-align: left;">&nbsp;<select
								id="sel_val" style="width: 60%"></select>&nbsp;&nbsp;&nbsp;<span
								id="lblMSG"></span></td>
							<td class="table_m table_w20"><button id="btnAppSch" class='btn btn-primary' onclick='applySearch();return false;'>신청내역조회</button></td>
						</tr>
					</tbody>
				</table>
				<div id="list" class="table_m"
					style="padding-bottom: 10px; padding-top: 10px"></div>
			</div>
		</div>
	</div>
</div>

<!-- 신청서화면 -->
<div id="mo1" class="modal bs-large-modal-lg" tabindex="-1"
	role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div class="modal-header">
				<!-- modal header -->
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">
					PNU 외국인 유학생 진로.취업.학사 멘토링 (PNU Host Program) 참가 신청서<br>
					Application for mentoring (PNU Host Program)<br>
					PNU外国留学生前途․就业․学事辅导活动(PNU Host Program)申请书
				</h4>
			</div>
			<!-- /modal header -->

			<!-- modal body -->
			<div class="modal-body">
				<div class="col-md-12">
					<div style="TEXT-ALIGN: center">
						<input id="txt계획서번호" type="hidden" name="txt계획서번호">
					</div>
					<div style="clear: both; height: 10px"></div>
					<div>
						<table class="table table_line table-bordered">
							<tbody>
								<tr>
									<td colspan="5" class="table_blue_tx">
										◎ 신청학생 개인정보 (Personal Information of an Applicant)<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请学生个人信息
									</td>
								</tr>
								<tr>
									<th class="table_box_background table_m table_w10" rowspan="2">성명(Name)<br>姓名</th>
									<th class="table_box_background table_m table_w10">국문(Korean)<br>韩语</th>
									<td class="table_m" style="width:35%">&nbsp;<span id="lbl국문성명"></span></td>
									<th class="table_box_background table_m table_w15" rowspan="2">국적(Nationality)<br>国籍</th>
									<td class="table_m table_w30" rowspan="2">&nbsp;<span id="lbl국적"></span></td>
								</tr>
								<tr>	
									<th class="table_box_background table_m">영문(English)<br>英语</th>
									<td class="table_m">&nbsp;<span id="lbl영문성명"></span></td>
								</tr>
								<tr>
									<th class="table_box_background table_m" colspan="2">이수과정(Study Program)<br>所属课程</th>
									<td class="table_m">&nbsp;<span id="lbl이수과정"></span></td>
									<th class="table_box_background table_m">성별(Gender)<br>性别</th>
									<td class="table_m">&nbsp;<span id="lbl성별"></span></td>
								</tr>
								<tr>
									<th class="table_box_background table_m" colspan="2">학과(Major)<br>所属专业</th>
									<td class="table_m">&nbsp;<span id="lbl학과"></span></td>
									<th class="table_box_background table_m">학번(PNU ID)<br>学号</th>
									<td class="table_m">&nbsp;<span id="lbl학번"></span></td>
								</tr>
								<tr>
									<th class="table_box_background table_m" colspan="2">휴대폰(Cellphone)<br>手机</th>
									<td class="table_m">&nbsp;<span id="lbl연락처"></span></td>
									<th class="table_box_background table_m">이메일(Email)<br>电子邮件</th>
									<td class="table_m">&nbsp;<span id="lbl이메일"></span></td>
								</tr>
							</tbody>
						</table>
						<table class="table table_line table-bordered">
							<tbody>
								<tr>
									<td colspan="4" class="table_blue_tx">◎ 참여 희망 프로그램 (Program to Apply)<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;希望参与的活动</td>
								</tr>
								<tr>
									<th class="table_box_background table_m table_w20">프로그램명칭<br>(Mentoring Title)<br>活动名称</th>
									<td class="table_m" style="text-align:left;" colspan="3">&nbsp;<span
										id="lbl프로그램명칭"></span></td>
								</tr>
								<tr>
									<th class="table_box_background table_m table_w20">멘토소속(Position)<br>导师所属单位</th>
									<td class="table_m" style="width:35%">&nbsp;<span id="lbl멘토소속"></span></td>
									<th class="table_box_background table_m table_w15">멘토성명(Name)<br>导师姓名</th>
									<td class="table_m table_w30">&nbsp;<span id="lbl멘토성명"></span></td>
								</tr>
							</tbody>
						</table>
						<table class="table table_line">
							<tr>
								<td class="table_blue_tx">◎ &nbsp;프로그램 동의여부 (Confirm) 确认 &nbsp; 
								<input type="checkbox" id="chk1">
								</td>
							</tr>
							<TR>
								<TD class="ta-l">
									<DIV style="MARGIN: 8px">
										상기 본인은 PNU 외국인 유학생 진로․취업․학사 멘토링(PNU Host Program) 참가를 신청하며, 향후 진행되는 프로그램에 적극적으로 참여할 것을 약속합니다.<br>
										I am applying for the PNU career·job·school affairs mentoring program for international students (PNU Host Program) and promise to participate actively in the program.<br>
										我申请参加PNU外国留学生前途․就业․学事辅导活动(PNU Host Program)，并约定往后将积极参加进行的相关活动。
									</DIV>
								</TD>
							</TR>
						</table>
						<table class="table table_line">
							<tr>
								<td class="table_blue_tx">◎ &nbsp;개인정보 동의여부 (Agree) 同意 &nbsp; 
								<input type="checkbox" id="chk2">
								</td>
							</tr>
							<TR>
								<TD class="ta-l">
									<DIV style="MARGIN: 8px">
										아울러 프로그램 운영을 위해 신청학생(멘티) 개인정보를 담당 멘토(교직원)에게 제공하는 것에 동의합니다.<br>
										I agree to provide my mentor (faculty member) with necessary personal information (mentee) to successfully operate the program.<br>
										为了顺利进行活动，我同意将我的个人信息提供给导师(教职员)。
									</DIV>
								</TD>
							</TR>
						</table>
						<div class="setWidth">
							<p>
								<h3>
									<b>
										부산대학교 국제교류본부장 귀하<br>
										釜山大学对外交流本部张 启
									</b>
								</h3>
							</p>
							<input type="button" class="btn btn-primary"
								onclick="javascript:btnClick(); return false;" value="신청하기 (Apply) 申请">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 신청내역화면 -->
<div id="mo2" class="modal bs-large-modal-lg" tabindex="-1"
	role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div class="modal-header">
				<!-- modal header -->
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">
					PNU 외국인 유학생 진로․취업․학사 멘토링 (PNU Host Program) 참가 확인서<br>
					PNU外国留学生前途․就业․学事辅导活动(PNU Host Program)申请确认书
				</h4>
			</div>
			<!-- /modal header -->

			<!-- modal body -->
			<div class="modal-body">
				<div class="col-md-12">
					<div style="TEXT-ALIGN: center">
						<input id="txt연도2" type="hidden" name="txt연도2"> <input
							id="txt학기2" type="hidden" name="txt학기2"> <input
							id="txt계획서번호2" type="hidden" name="txt계획서번호2">
					</div>
					<div style="clear: both; height: 10px"></div>
					<div>
						<table class="table table_line table-bordered">
							<tbody>
								<tr>
									<td colspan="5" class="table_blue_tx">◎ 본인 정보 확인 (Confirm Personal Information)<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认本人信息</td>
								</tr>
								<tr>
									<th class="table_box_background table_m table_w10" rowspan="2">성명(Name)<br>姓名</th>
									<th class="table_box_background table_m table_w10">국문(Korean)<br>韩语</th>
									<td class="table_m" style="width:35%">&nbsp;<span id="lbl국문성명2"></span></td>
									<th class="table_box_background table_m table_w15" rowspan="2">국적(Nationality)<br>国籍</th>
									<td class="table_m table_w30" rowspan="2">&nbsp;<span id="lbl국적2"></span></td>
								</tr>
								<tr>	
									<th class="table_box_background table_m">영문(English)<br>英语</th>
									<td class="table_m">&nbsp;<span id="lbl영문성명2"></span></td>
								</tr>
								<tr>
									<th class="table_box_background table_m" colspan="2">이수과정(Study Program)<br>所属课程</th>
									<td class="table_m">&nbsp;<span id="lbl이수과정2"></span></td>
									<th class="table_box_background table_m">성별(Gender)<br>性别</th>
									<td class="table_m">&nbsp;<span id="lbl성별2"></span></td>
								</tr>
								<tr>
									<th class="table_box_background table_m" colspan="2">학과(Major)<br>所属专业</th>
									<td class="table_m">&nbsp;<span id="lbl학과2"></span></td>
									<th class="table_box_background table_m">학번(PNU ID)<br>学号</th>
									<td class="table_m">&nbsp;<span id="lbl학번2"></span></td>
								</tr>
								<tr>
									<th class="table_box_background table_m" colspan="2">휴대폰(Cellphone)<br>手机</th>
									<td class="table_m">&nbsp;<span id="lbl연락처2"></span></td>
									<th class="table_box_background table_m">이메일(Email)<br>电子邮件</th>
									<td class="table_m">&nbsp;<span id="lbl이메일2"></span></td>
								</tr>
							</tbody>
						</table>
						<table class="table table_line table-bordered">
							<tbody>
								<tr>
									<td colspan="4" class="table_blue_tx">◎ 신청내역 확인 (Confirm Application)<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认申请内容
									</td>
								</tr>
								<tr>
									<th class="table_box_background table_m table_w20">프로그램명칭<br>(Mentoring Title)<br>活动名称</th>
									<td class="table_m" style="text-align:left;" colspan="3">&nbsp;<span
										id="lbl프로그램명칭2"></span></td>
								</tr>
								<tr>
									<th class="table_box_background table_m table_w20">멘토소속(Position)<br>导师所属单位</th>
									<td class="table_m" style="width:35%">&nbsp;<span id="lbl멘토소속2"></span></td>
									<th class="table_box_background table_m table_w15">멘토성명(Name)<br>导师姓名</th>
									<td class="table_m table_w30">&nbsp;<span id="lbl멘토성명2"></span></td>
								</tr>
							</tbody>
						</table>
						<table class="table table_line">
							<tr>
								<td class="table_blue_tx">◎ &nbsp;신청일시 (Application time) 申请时间:&nbsp;<span id="lbl신청일시2"></span></td>
							</tr>
							<TR>
								<TD class="ta-l">
									<DIV style="MARGIN: 8px">
										<p><span id="lbl취소일시국문2"></span><br>
										&nbsp;&nbsp;<span id="lbl취소일시영문2"></span><br>
										&nbsp;&nbsp;<span id="lbl취소일시중문2"></span>
										</p>
									</DIV>
								</TD>
							</TR>
						</table>
						<table class="table table_line">
							<tr>
								<td class="table_blue_tx">◎ &nbsp;신청정보 (Application status) 申请信息:&nbsp;<span id="lbl신청정보2"></span>
								</td>
							</tr>
							<TR>
								<TD class="ta-l">
									<DIV style="MARGIN: 8px">
										<p>※ 신청 대기자의 경우, 신청완료자 중 취소자가 발생할 때 대기 순서에 따라 참여가 가능할 수 있습니다.<br>
										&nbsp;&nbsp;Applicants on the waiting list may be able to participate in the program if there are cancellations depending on their position on the waiting list.<br>
										&nbsp;&nbsp;申请候补者，当申请完成者中有人取消时将按顺序选拔参与
										</p>
									</DIV>
								</TD>
							</TR>
						</table>
						<div class="setWidth" style="padding-top: 10px">
							<input type="button" class="btn btn-primary"
								onclick="javascript:btnDel(); return false;" value="취소하기 (Cancel) 取消">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>