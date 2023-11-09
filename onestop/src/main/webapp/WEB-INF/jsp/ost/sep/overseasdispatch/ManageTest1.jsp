<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<div class="col-main">
	<main id="main">
		<section class="sec-1">
			<header>
				<div class="header-item">
	                <h2 id="titleHeader"></h2>
				</div>
				<div class="header-item">
				</div>
			</header>
			<div class="sec-body">
				<div class="search-box">
					<input type="text" id="SYEAR" class="form-control" style="display: none;" /> 
					<input type="text" id="TERM_GCD" class="form-control" style="display: none;" /> 
					<input type="text" id="EXCHG_DETAIL_GCD" class="form-control" style="display: none;" /> 
					<input type="text" id="CHASU_NO" class="form-control" style="display: none;" /> 
					<input type="text" id="STDT_NO" class="form-control" style="display: none;" /> 
				</div>
				<!-- 메시지 박스 -->
				<header>
					<h3 class="sec-title">Note</h3>
				</header>
				<div class="message-box">
					<div class="message-box-inner">
						<div class="message-body">
							<ul class="list list-style-1">
								<li>This form should be filed out in English.</li>
								<li>Please remember your email address and password. These are needed to amend the Information.</li>
								<li>All the fields are required.</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /END 메시지 박스 -->
				<!-- 입력 영역 -->
				<div class="ins-box">
					<div class="b-table-box flex-col-2" role="table" aria-label="Instirution and Coordinator Details">
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label for="Email" data-lang>Email</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="Email" type="text" class="form-control"></input>
									<div class="text-primary">(ex : global@pusan.ac.kr) <br>* Email address is your login ID.</div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="Password" data-lang>Password</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="Password" type="password" class="form-control"></input>
									<div class="text-primary">* Password at least 8 characters</div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="ConfirmPassword" data-lang>Confirm Password</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="ConfirmPassword" type="password" class="form-control"></input>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label for="Name" data-lang>Name of Contact Person</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="Name" type="text" class="form-control"></input>
									<div class="text-primary">(Family Name Given name) *Capital letters</div>
								</div>
							</div>
						</div>
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="CountryUniversity" data-lang>Country of Home University</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="CountryUniversity" class="form-control"></select>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="HomeUniversity" class="req" data-lang>Name of Home University</label>
								</div>
								<div class="b-con-box" role="cell">
									<select id="HomeUniversity" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="b-row-box " role="row">
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="Office" class="req" data-lang>Office</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="Office" type="text" class="form-control"></input>
									<div class="text-primary">(ex: International Office)</div>
								</div>
							</div>
							<div class="b-row-item">
								<div class="b-title-box" role="rowheader">
									<label for="Title" class="req" data-lang>Title</label>
								</div>
								<div class="b-con-box" role="cell">
									<input id="Title" type="text" class="form-control"></input>
									<div class="text-primary">(ex: International Coordinator)</div>
								</div>
							</div>
						</div>
						<div class="b-row-box " role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label for="Tel" data-lang>Tel</label>
								</div>
								<div class="b-con-box">
									<input id="Tel" type="text" class="form-control"></input>
									<div class="text-primary">(ex: +82-51-510-1873) *Don't enter space characters.</div>
								</div>
							</div>
						</div>
						<div class="b-row-box " role="row">
							<div class="b-row-item merge-2">
								<div class="b-title-box" role="rowheader">
									<label for="MailingAddres" data-lang>Mailing Address</label>
								</div>
								<div class="b-con-box">
									<input id="MailingAddres" type="text" class="form-control"></input>
									<div class="text-primary">(Street, City, Country, Zipcode)</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /END 개인정보 영역 -->
					
					<div class="card-header" id="heading1" style="background-color: #d3d3d3;">
						<label class="text-left dfn" style="font-size: 18px;" data-lang><strong>Student Details</strong></label>
					</div>
					<div class="b-table-box flex-col-1" role="table" aria-label="조회">
						<div class="b-row-box" role="row">
							<div class="b-row-item">
								<div class="b-con-box" role="cell">
									<ul class="list list-style-1">
										<li><span class="dfn" data-lang> This form should be filled out in English. </span></li>
										<li><span class="dfn" data-lang> All the fields are required. </span></li>
										<li><span class="dfn" data-lang> Given Name, Family Name fields should only be filled out in Roman alphabet as in the student's passport because the certificate of admission does not allow any other kinds of alphabet by the system. (ex: HONG GILDONG) </span></li>
										<li><span class="dfn" data-lang> Initial password for student login is set 8-digit number of birthday. (YYYYMMDD ex:19910131) </span></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="form-row btn-box-right">
						<div class="col-auto">
							<button class="btn btn-outline-primary mb-2" onclick="fn_rowAdd()" data-lang>+ADD</button>
						</div>
					</div>
					<!-- 테이블 -->
					<div class="table-box">
						<div class="table-body">
							<table class="table table-hover" data-toggle="table" data-height="" data-show-column="true">
								<caption>Sample Table</caption>
								<colgroup>
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
									<col style="min-width: 50px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">Given<br>Name</th>
										<th scope="col">Family<br>Name</th>
										<th scope="col">Email<br>&nbsp;</th>
										<th scope="col">Date<br>of Birth</th>
										<th scope="col">Gender<br>&nbsp;</th>
										<th scope="col">Student<br>Type</th>
										<th scope="col">Period<br>of study</th>
										<th scope="col">Nationality<br>&nbsp;</th>
										<th scope="col">Current<br>Degree Level</th>
										<th scope="col">Department<br>at Home University</th>
										<th scope="col">Saved<br>Delete</th>
									</tr>
								</thead>
								<tbody id="resultTbody">
									<tr class="Apply_Row0" style="cursor:pointer;">
								        <td><input id="Givenname_Tab" type="text" class="form-control"></input></td>
									    <td><input id="Familyname_Tab" type="text" class="form-control"></input></td>
									    <td><input id="Email_Tab" type="text" class="form-control"></input></td>
									    <td><input id="Birth_Tab" type="text" class="form-control"></input></td>
									    <td><select id="Gender_Tab" class="form-control"></select></td>
									    <td><select id="Std_Type_Tab" class="form-control"></select></td>
									    <td><select id="PerofStd_Tab" class="form-control"></select></td>
									    <td><select id="Nationailty_Tab" class="form-control"></select></td>
									    <td><select id="Level_Tab" class="form-control"></select></td>
									    <td><input id="Uni_Tab" type="text" class="form-control"></input></td>
									    <td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- /END 테이블 -->
				</div> <br>
				<!-- /END 검색 영역 -->
				<div class="text-center">
					<div class="form-group">
						<button class="btn btn-outline-primary mb-2" onclick="fn_applySave()" data-lang>Save</button>
					</div>
				</div>
			</div>
		</section>      
	</main>
</div>
<script type="text/x-tbody-template" id="resultTemplate">
	
</script>
<script type="text/javascript">

	var totalCnt = 0;
    var _autoComplete;
	var _multi;
	var rowNum = 0;
	var rowList = new Array();

	function fn_initScreen() {		
		$("#titleHeader").text("Application for Inbound Exchange Students and Visiting Students Program");
		rowList.push(0);
	}
	
	function fn_rowAdd() {
		rowNum = rowNum+1;
		rowList.push(rowNum);
		
		var newRow = '<tr class=Apply_Row' + rowNum + '>';
		newRow = newRow + '<td><input id="Givenname_Tab" type="text" class="form-control"></input></td>';
		newRow = newRow + '<td><input id="Familyname_Tab" type="text" class="form-control"></input></td>';
		newRow = newRow + '<td><input id="Email_Tab" type="text" class="form-control"></input></td>';
		newRow = newRow + '<td><input id="Birth_Tab" type="text" class="form-control"></input></td>';
		newRow = newRow + '<td><select id="Gender_Tab" class="form-control"></select></td>';
		newRow = newRow + '<td><select id="Std_Type_Tab" class="form-control"></select></td>';
		newRow = newRow + '<td><select id="PerofStd_Tab" class="form-control"></select></td>';
		newRow = newRow + '<td><select id="Nationailty_Tab" class="form-control"></select></td>';
		newRow = newRow + '<td><select id="Level_Tab" class="form-control"></select></td>';
		newRow = newRow + '<td><input id="Uni_Tab" type="text" class="form-control"></input></td>';
		newRow = newRow + '<td><button class="btn btn-outline-primary mb-2" onclick="fn_rowDelete('+rowNum+')" data-lang>-</button></td>';
		newRow = newRow + '</tr>';
		
		$("#resultTbody").append(newRow);
	}
	
	function fn_rowDelete(num) {
		var del = document.getElementById('resultTbody');
		var arrNum = rowList.indexOf(num);
		del.deleteRow(arrNum);
		
		rowList = rowList.filter(function(data) { return data != num });

		//rowNum = rowNum-1;
	}
	
	function fn_applySave() {
		var data = new Array();
		
		for (var i = 0; i<rowList.length; i++) {
			var map = gfn_com_inputdata($(".Apply_Row"+rowList[i]));
			data.push(map);
		}
		
		alert(JSON.stringify(data));
	}


</script>