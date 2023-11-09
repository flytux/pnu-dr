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
				<div class="btn-box">
					<div class="form-row btn-box-right">
						<div class="col-auto">
							<button class="btn btn-new " onclick="fn_openReport(true)" data-lang>팝업출력</button>
						</div>
					</div>
				</div>
				<div id="grp_head" ></div>
			
				<div id="grp_report" style="height:900px"></div>
			</div>
			<!-- /END CONTENT  BODY-->				
		</section>      
	</main>
</div>
<script src="/common/js/gfn/gfn_report.js"></script>
<script type="text/javascript">


	function fn_initScreen() {		

		fn_openReport(false);
	}
	
	
	function fn_openReport(isPop) {
		var options ={};
                    
        options.rptName = "/ses/sj/sjmng/comgraduategrades/OpticalCrosschkDataPrint/OpticalCrosschkDataPrint_001.crf";
   
        //파라메터 설정
        //var objParam = dma_SearchParam.getJSON();
        var objParam = {};
        objParam.SYEAR 							= "2007";  //기준년도
        objParam.TERM_GCD                       ="02";  //기준월
        objParam.SCH_COLL_GRAD_GCD              ="0001"; 
        objParam.SCH_GRAD_GCD                   ="0000"; 
        objParam.SCH_COLL_CD                    ="350000"; 
        objParam.SCH_DEPT_CD                    ="351100"; 
        objParam.DEG_COURSE_GCD                 ="0001";
        objParam.CHOICE2                        ="1";
        //레포트를 생성시킬 group component 또는 id를 넣는다.
        options.div = 'grp_report';

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
        if (isPop) {
           // common.openReportPopup(options, popOptions, 'V');
        	fn_openPopup(options);
           
        } else {
            //레포트 조회 함수.
            openReport(options);
        }
	}
	
	function fn_openPopup(rptOptions) {
		gfn_com_modalPopup({
        	width : 1200,
            height : 900,
            target : null,            
            title : "성적일람표",
            include : "/html/ost/core/popup/CommPopReport.html", 
            dataBound : function(e) {
            	rptOptions.div = "pop_grp_report";
            	openReport(rptOptions);
            }
        });
	}

	

</script>