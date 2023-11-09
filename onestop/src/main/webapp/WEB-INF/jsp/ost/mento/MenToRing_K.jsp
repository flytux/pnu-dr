<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <link href="/common/bootstrap-4.6.1/css/bootstrap.min.css" rel="stylesheet">  
	<link href="/common/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet">
  <link href="/common/css/common.css" rel="stylesheet">
  <link href="/common/css/owl.carousel.min.css" type="text/css" rel="stylesheet">
  <link href="/common/css/style.css" rel="stylesheet">
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
					<div class="b-table-box flex-col-2" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label class="req" for="sel_val" data-lang>프로그램 선택</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="sel_val" class="form-control" title="프로그램 선택"></select><span id="lblMSG"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="btn-box">
						<div class="form-row">
							<div class="col-auto">
								<button class="btn search-btn" type="button" onclick="applySearch();return false;" data-lang>신청내역조회</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /END 검색 영역 -->
				<!-- 테이블 -->
				<div id="list" class="table_m"
					style="padding-bottom: 10px; padding-top: 10px"></div>

				<!-- /END 테이블 -->
			</div>
		</section>
	</main>
</div>


<!-- 신청서화면 -->
<div id="mo1" class="modal bs-large-modal-lg" tabindex="-1"
	role="dialog" aria-labelledby="myLargeModalLabel" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div class="modal-header">
				<!-- modal header -->

				<h4 class="modal-title" id="myModalLabel"><%-- ${term_year}학년도 ${fn:substring(term, 0, 1)}학기  --%>진로.취업.학사 멘토링 참여 신청서</h4>
								<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
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
							<caption>신청학생(멘티) 개인정보</caption>
							<thead>
								<tr>
									<th scope="colgroup" colspan="4" class="table_blue_tx">◎ 신청학생(멘티) 개인정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" class="table_box_background table_m table_w15">소속</th>
									<td class="table_m table_w40">&nbsp;<span id="lbl소속"></span></td>
									<th scope="row" class="table_box_background table_m table_w15">학적상태</th>
									<td class="table_m table_w30">&nbsp;<span id="lbl학적"></span></td>
								</tr>
								<tr>
									<th scope="row" class="table_box_background table_m">학번</th>
									<td class="table_m">&nbsp;<span id="lbl학번"></span></td>
									<th scope="row" class="table_box_background table_m">성명 (성별)</th>
									<td class="table_m">&nbsp;<span id="lbl성명"></span></td>
								</tr>
								<tr>
									<th scope="row" class="table_box_background table_m">연락처(핸드폰)</th>
									<td class="table_m">&nbsp;<span id="lbl연락처"></span></td>
									<th scope="row" class="table_box_background table_m">이메일</th>
									<td class="table_m">&nbsp;<span id="lbl이메일"></span></td>
								</tr>
							</tbody>
						</table>
						<table class="table table_line table-bordered">
							<caption>참여프로그램</caption>
							<thead>
								<tr>
									<th scope="colgroup" colspan="4" class="table_blue_tx">◎ 참여프로그램</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" class="table_box_background table_m table_w15">프로그램명칭</th>
									<td class="table_m" style="text-align:left;" colspan="3">&nbsp;<span
										id="lbl프로그램명칭"></span></td>
								</tr>
								<tr>
									<th scope="row" class="table_box_background table_m table_w15">멘토소속</th>
									<td class="table_m table_w40">&nbsp;<span id="lbl멘토소속"></span></td>
									<th scope="row" class="table_box_background table_m table_w15">멘토성명</th>
									<td class="table_m table_w30">&nbsp;<span id="lbl멘토성명"></span></td>
								</tr>
							</tbody>
						</table>
						<table class="table table_line">
							<caption>프로그램 동의여부</caption>
							<thead>
								<tr>
									<td scope="col" class="table_blue_tx">◎ &nbsp;<label for="chk1">프로그램 동의여부</label> &nbsp; <input
										type="checkbox" id="chk1">
									</td>
								</tr>
							</thead>
							<tbody>
								<TR>
									<TD class="ta-l">
										<DIV style="MARGIN: 8px">
											상기 본인은 PNU 진로.취업.학사 멘토링(<span id="lbl프로그램명칭1"></span>)에 참여를
											신청하며, 향후 해당 일정에 따라 진행되는 프로그램에 적극적으로 참여할 것을 약속합니다.
										</DIV>
									</TD>
								</TR>
							</tbody>
						</table>
						<table class="table table_line">
							<caption>개인정보 동의여부</caption>
							<thead>
								<tr>
									<td scope="col" class="table_blue_tx">◎ &nbsp;<label for="chk2">개인정보 동의여부</label> &nbsp; <input
										type="checkbox" id="chk2">
									</td>
								</tr>
							</thead>
							<tbody>
								<TR>
									<TD class="ta-l">
										<DIV style="MARGIN: 8px">아울러, 프로그램 운영을 위해 신청학생(멘티) 개인정보를
											담당 교직원(멘토)에게 제공하는 것에 동의합니다.</DIV>
									</TD>
								</TR>
							</tbody>
						</table>
						<div class="setWidth">
							<p>
							<h3>
								<b>부산대학교 학생처장 귀하</b>
							</h3>
							</p>
							<input type="button" class="btn btn-primary"
								onclick="javascript:btnClick(); return false;" value="신청하기">
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

				<h4 class="modal-title" id="myModalLabel"><%-- ${term_year}학년도 ${fn:substring(term, 0, 1)}학기 --%> 진로.취업.학사 멘토링 참여 신청 내역</h4>
								<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
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
							<caption>본인 정보 확인</caption>
							<thead>
								<tr>
									<td scope="colgroup" colspan="4" class="table_blue_tx">◎ 본인 정보 확인</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" class="table_box_background table_m table_w15">소속</th>
									<td class="table_m table_w40">&nbsp;<span id="lbl소속2"></span></td>
									<th scope="row" class="table_box_background table_m table_w15">학적상태</th>
									<td class="table_m table_w30">&nbsp;<span id="lbl학적2"></span></td>
								</tr>
								<tr>
									<th scope="row" class="table_box_background table_m">학번</th>
									<td class="table_m">&nbsp;<span id="lbl학번2"></span></td>
									<th scope="row" class="table_box_background table_m">성명 (성별)</th>
									<td class="table_m">&nbsp;<span id="lbl성명2"></span></td>
								</tr>
								<tr>
									<th scope="row" class="table_box_background table_m">연락처(핸드폰)</th>
									<td class="table_m">&nbsp;<span id="lbl연락처2"></span></td>
									<th scope="row" class="table_box_background table_m">이메일</th>
									<td class="table_m">&nbsp;<span id="lbl이메일2"></span></td>
								</tr>
							</tbody>
						</table>
						<table class="table table_line table-bordered">
							<caption>신청내역 확인</caption>
							<thead>
								<tr>
									<td scope="colgroup" colspan="4" class="table_blue_tx">◎ 신청내역 확인</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" class="table_box_background table_m table_w15">프로그램명칭</th>
									<td class="table_m" style="text-align:left;" colspan="3">&nbsp;<span
										id="lbl프로그램명칭2"></span></td>
								</tr>
								<tr>
									<th scope="row" class="table_box_background table_m table_w15">멘토소속</th>
									<td class="table_m table_w40">&nbsp;<span id="lbl멘토소속2"></span></td>
									<th scope="row" class="table_box_background table_m table_w15">멘토성명</th>
									<td class="table_m table_w30">&nbsp;<span id="lbl멘토성명2"></span></td>
								</tr>
							</tbody>
						</table>
						<table class="table table_line">
							<caption>신청, 취소일시</caption>
							<thead></thead>
							<tbody>
								<tr>
									<td class="table_blue_tx">◎ &nbsp;신청일시:&nbsp;<span id="lbl신청일시2"></span></td>
								</tr>
								<TR>
									<TD class="ta-l">
										<DIV style="MARGIN: 8px">
											<p><span id="lbl취소일시2"></span></p>
										</DIV>
									</TD>
								</TR>
							</tbody>
						</table>
						<table class="table table_line">
							<caption>신청정보</caption>
							<thead></thead>
							<tbody>
							<tr>
								<td class="table_blue_tx">◎ &nbsp;신청정보:&nbsp;<span id="lbl신청정보2"></span>
								</td>
							</tr>
							</tbody>
							<!-- <TR>
								<TD class="ta-l">
									<DIV style="MARGIN: 8px">
										<p>※ 신청대기자의 경우, 신청자 중 취소자가 발생할 때 대기 순서에 따라 참여가 가능할 수 있습니다.<br>
										&nbsp;&nbsp;이 경우, 학생과에서 해당 학생에게 개별적으로 연락할 예정입니다.</p>
									</DIV>
								</TD>
							</TR> -->
						</table>
						<div class="setWidth" style="padding-top: 10px">
							<input id="btnAppDel" type="button" class="btn btn-primary"
								onclick="javascript:btnDel(); return false;" value="취소하기">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



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
		//return;
		memberChk();
	}
	
	//대상여부확인
	function memberChk(){
		data = {
	    };
		gfn_ajax_request({
	        url : "/ost/mento/mentoring/mentoringInfoChk",
	        reqData : data,
	        success : function(data, responseData) {
	        	if (!gfn_com_isEmptyObject(data)) {
	                var size=data.length;
					var dat;
					var dat1;
					var dat2;
					var isOK;
					
					if(size==1){
					    dat=data[0];
					    alert(dat.메세지);
					    isOK=dat.신청가능여부;
					    
					    //history.go(-1);
					    return;
					}else{
					    dat=data[0][0];
					    isOK=dat.신청가능여부;
					    if(data[2].length > 0){
						    if(isOK=="Y"){
						        _year = dat.연도;
						        _term = dat.학기;
						        
						        dat1=data[1][0];
						        dat2=data[2][0];
						        
						        $("#lbl소속").text(dat2.대학+" "+dat2.학과);
						        $("#lbl학적").text(dat2.학적상태);
						        $("#lbl학번").text(dat2.학번);
						        $("#lbl성명").text(dat2.성명+" ("+dat2.성별+")");
						        $("#lbl연락처").text(dat2.휴대폰번호);
						        $("#lbl이메일").text(dat2.이메일);
						        
						        $("#lbl소속2").text(dat2.대학+" "+dat2.학과);
						        $("#lbl학적2").text(dat2.학적상태);
						        $("#lbl학번2").text(dat2.학번);
						        $("#lbl성명2").text(dat2.성명+" ("+dat2.성별+")");
						        $("#lbl연락처2").text(dat2.휴대폰번호);
						        $("#lbl이메일2").text(dat2.이메일);
						        
						        if (data[1].length>0){
						            _appYN = "Y"
						            $("#btnAppSch").show();
						            _appYear = dat1.연도;
						            _appTerm = dat1.학기;
						            _appProj = dat1.계획서번호;
						            
						            //신청내역 띄우기
						            applySearch();
						        }
						        
						        fn_event();
						        ProgramList();
						    }
					    }
					}
	            }
	        }
	    });
	}
	
	//ProgramList
	function ProgramList() {
		data = {
        };
        gfn_ajax_request({
            url : "/ost/mento/mentoring/mentoringSearch",
            reqData : data,
            success : function(data, responseData) {
                
                if (!gfn_com_isEmptyObject(data)) {
                	
                    var html='<option value="">선택</option>';
                    $(data).each(function(key,val){
                        html += '<option value="'+val.코드+'">'+val.코드명+'</option>';
                    });
                }
                $("#sel_val").html(html);
            }
        });
		
	}
	
	//ProgramListDetail
	function ProgramListDetail(data) {		
		
        gfn_ajax_request({
            url : "/ost/mento/mentoring/mentoringDetailSearch",
            reqData : data,
            success : function(data, responseData) {
            	var datas=data;
                var size=data.length;
                var html='';
                
                if (!gfn_com_isEmptyObject(data)) {
					$(data).each(function(key,val){
					    html += '<table class="table table_line table-bordered"><tr>';
					    html += '<td class="table_box_background3 table_w15">성명</td><td>'+val.성명+'</td>';
					    html += '<td class="table_box_background3 table_w15">성별</td><td>'+val.성별+'</td>';
					    html += '</tr><tr>';
					    html += '<td class="table_box_background3">소속</td><td colspan="3" style="text-align:left;">'+val.소속+'</td>';
					    html += '</tr><tr>';
					    html += '<td class="table_box_background3">프로그램명</td><td colspan="3" style="text-align:left;">'+val.프로그램명+'</td>';
					    html += '</tr><tr>';
					    html += '<td class="table_box_background3">멘토링장소</td><td colspan="3" style="text-align:left;">'+val.멘토링장소+'</td>';
					    html += '</tr><tr>';
					    html += '<td class="table_box_background3">멘토링소개</td><td colspan="3" style="white-space:pre-line; text-align:left;">'+val.멘토링소개+'</td>';
					    html += '</tr><tr>';
					    html += '<td class="table_box_background3">자격(경력)</td><td colspan="3" style="white-space:pre-line; text-align:left;">'+val.자격및경력+'</td>';
					    html += '</tr><tr>';
					    
					    if (val.신청가능여부=="Y"){
					        //html += '<td><button class="btn btn-primary" onclick="app_ins('+datas[i].성명+');return false;">신청하기</button></td>';
					        html += '<td><input type="button" value="신청하기" class="btn btn-primary btn-sm"'; 
					        html += 'onclick="app_ins(\''+val.프로그램명+'\',\''+val.성명+'\',\''+val.소속+'\',\''+val.계획서번호+'\',\'N\')"</td>';
					        html += '<td colspan="3" style="text-align:left;">신청인원: '+val.신청인원+'명</td>';
					    }else{
					        html += '<td><button class="btn" disabled="disabled">신청마감</button></td>';
					        if (val.대기자신청가능여부=="Y"){
					            html += '<td colspan="2" style="text-align:left;">신청인원: '+val.신청인원+'명</td>';
					            //html += '<td><button class="btn btn-primary" onclick="waitapp_ins();return false;">대기자 신청</button></td>';
					            html += '<td class="table_w15" ><input type="button" value="대기자신청" class="btn btn-primary btn-sm"';
					            html += 'onclick="app_ins(\''+val.프로그램명+'\',\''+val.성명+'\',\''+val.소속+'\',\''+val.계획서번호+'\',\'Y\')"</td>';
					        }else{
					            html += '<td colspan="3" style="text-align:left;">신청인원: '+val.신청인원+'명</td>';
					        }
					    }
					    html += '</tr></table>';
					});
                }
                $("#list").html(html);
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
				confirm(mentoNM + "님을 멘토로 선택하여 신청합니다. 계속하시겠습니까?",function(_flag){
		    		if(_flag) {
		    			$("#txt계획서번호").val(projCD);
		    			$("#lbl프로그램명칭").text(programNM);
		    			$("#lbl프로그램명칭1").text(programNM);
		    			$("#lbl멘토소속").text(sosok);
		    			$("#lbl멘토성명").text(mentoNM);
		    			
		    			//신청서 레이어팝업
		    			$("#mo1").modal('show');
		    		}else{
		    			return;
		    		}
		    			
	    		});
			}else{
				confirm(mentoNM + "님을 멘토로 선택하여 대기자로 신청합니다.\n취소자 발생 시 대기 순서에 따라 참여 가능할 수 있습니다.\n계속하시겠습니까?",function(_flag){
		    		if(_flag) {
		    			$("#txt계획서번호").val(projCD);
		    			$("#lbl프로그램명칭").text(programNM);
		    			$("#lbl프로그램명칭1").text(programNM);
		    			$("#lbl멘토소속").text(sosok);
		    			$("#lbl멘토성명").text(mentoNM);
		    			
		    			//신청서 레이어팝업
		    			$("#mo1").modal('show');
		    		}else{
		    			return;
		    		}
		    			
	    		});
				
			}

		}
	}
	
	//신청서의 신청하기버튼
	function btnClick(){
		if(!validation()){
			return;
		}
		
		data = {"YEAR" : _year,
				"TERM_CD" : _term,
				"PROJ_CD" : $("#txt계획서번호").val()
			   };
        gfn_ajax_request({
            url : "/ost/mento/mentoring/applyInsert",
            reqData : data,
            success : function(data, responseData) {
                if (!gfn_com_isEmptyObject(data[0])) {
                    var dat=data[0];
                    alert(dat.메세지);
                    
                    if (dat.신청여부 == 'Y'){
                        $("#mo1").modal('hide');
                        location.reload();
                    }else{
                        return;
                    }
                }
            }
        });
	}
	
	function validation(){
		var chk1=$("#chk1").is(":checked");
		var chk2=$("#chk2").is(":checked");
		if(chk1==false){
			alert("프로그램 동의여부를 체크하여 주십시오.");
			return false;
		}else if(chk2==false){
			alert("개인정보 동의여부를 체크하여 주십시오.");
			return false;
		} 
		
		return true;
	}
	
	//신청내역 조회
	function applySearch(){
		data = {"YEAR" : _appYear,
				"TERM_CD" : _appTerm,
				"PROJ_CD" : _appProj
		};
		gfn_ajax_request({
            url : "/ost/mento/mentoring/applySearch",
            reqData : data,
            success : function(data, responseData) {
                
                if (!gfn_com_isEmptyObject(data[0])) {
					var dat=data[0][0];
					var dat1=data[1][0];
					
					$("#txt연도2").val(_appYear);
					$("#txt학기2").val(_appTerm);
					$("#txt계획서번호2").val(_appProj);
					$("#lbl프로그램명칭2").text(dat.프로그램명칭);
					$("#lbl멘토소속2").text(dat.멘토소속);
					$("#lbl멘토성명2").text(dat.멘토성명);
					$("#lbl신청일시2").text(dat.신청일시);
					$("#lbl신청정보2").text(dat.신청구분);
					$("#lbl취소일시2").text(dat1.일정);
					
					if (dat1.취소가능여부 == "Y"){
					    $("#btnAppDel").show();
					}else{
					    $("#btnAppDel").hide();
					}
					
					//신청내역 레이어팝업
					$("#mo2").modal('show');
                } else {
                	alert("신청 내역이 없습니다.");
                }
            }
        });
	}
	
	//신청내역 신청취소
	function btnDel(){
		data = {"YEAR" : $("#txt연도2").val(),
                "TERM_CD" : $("#txt학기2").val(),
                "PROJ_CD" : $("#txt계획서번호2").val()
               };
		
		confirm("신청취소하시겠습니까?",function(_flag){
        	if(_flag){
                gfn_ajax_request({
                    url : "/ost/mento/mentoring/applyDelete",
                    reqData : data,
                    success : function(data, responseData) {
      				    alert("신청취소 되었습니다.");
      				    $("#btnAppSch").hide();
      				    $("#mo2").modal('hide');
      				    location.reload();
                    }
                });
        	}else{
        		return
        	};
        });
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
				data = {"YEAR" : _year,
		                "TERM_CD" : _term,
		                "ITEM_CD" : sel_val
		        };
				
				ProgramListDetail(data);
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
