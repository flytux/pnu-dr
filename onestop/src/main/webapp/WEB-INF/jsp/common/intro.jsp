<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부산대학교 - 학생지원시스템</title>
<link href="/common/bootstrap-4.6.1/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/common/css/intro.css" rel="stylesheet">
</head>
<body>
<div class="intro">
  <div class="container">
    <h1 class="logo"><a href="/"><img src="/common/images/intro-logo.png" alt="학생지원시스템 로고"></a></h1>
    <div class="page-main">
      <div class="page-box">
        <div class="page-header text-center">
          ${SYSTEM_EXAMINE_CONTENT }
        </div>
        <div class="page-inner">
          <div class="btn-list">
            <ul>
              <li><a href="https://onestop.pusan.ac.kr/login" class="btn btn-primary" target="_blank" title="학생지원시스템 새창 바로가기">학생지원시스템 바로가기</a></li>        
            </ul>
          </div>        
        </div>
        <div class="page-inner">
          <div class="d-flex w-100 justify-content-between">
            <h3 class="stit">수강신청(정정) 바로가기</h3>
          </div>
          <div class="btn-list">
            <ul>
              <li><a href="https://sugang.pusan.ac.kr" class="btn btn-success" target="_blank" title="수강신청 새창 바로가기"><strong>수강신청 바로가기</strong></a></li>
              <!-- 
              <li><a href="#" class="btn btn-info" target="_blank" title="새창열림"><strong>대학원</strong> 수강신청 바로가기</a></li>
              <li><a href="" class="btn btn-success" target="_blank" title="새창열림"><strong>타대생</strong> 수강신청 바로가기</a></li>
               -->
            </ul>
          </div>
        </div>
        <div class="page-inner">
          <h3 class="stit">수강편람 바로가기</h3>
          <div class="btn-list-sub">
            <ul>
              <li><a href="https://onestop.pusan.ac.kr/page?menuCD=000000000000335" class="btn" target="_blank" title="수강편람 새창열림">수강편람</a></li>
              <li><a href="https://onestop.pusan.ac.kr/page?menuCD=000000000000360" class="btn" target="_blank" title="타대생 수강편람 새창열림">타대생 수강편람</a></li>
              <!-- 
              <li><a href="" target="_blank" title="새창열림">Undergraduate Courses</a></li>
              <li><a href="" target="_blank" title="새창열림">Graduate Courses</a></li>
              <li><a href="" target="_blank" title="새창열림">Foreign Languages Courses</a></li>
               -->
            </ul>
          </div>
        </div>
        <div class="page-inner">
          <h3 class="stit">수강권 매매 신고센터 운영</h3>
          <div class="page-info">
            <ul class="ul-style-bullet">
              <li>운영부서 : 교육혁신과 <strong class="text-primary">051-510-1221</strong></li>
              <li>운영기간 : 상시</li>
              <li>신고방법 : <strong class="text-success">강좌 매매 증빙자료(게시글 캡처화면 등)</strong>를 첨부하고 <strong class="text-success">신고인 연락처</strong>를 기재하여 <strong class="text-primary"><u>이메일로 신고</u></strong><br>
                - 담당자 이메일 : <a href="mailto:kyttyj80@pusan.ac.kr">kyttyj80@pusan.ac.kr</a></li>
              <li>조치사항 : <strong class="text-danger">학생 징계 및 수강 신청 내역 삭제</strong><br>
                <span class="info-txt">원활한 운영을 위해 허위 신고가 발생하지 않도록 협조바랍니다.</span></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
