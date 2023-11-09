<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.onestop.core.util.CommonStaticFile" %>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expries" content="-1">
  <meta http-equiv="Cache-Control" content="no-cache">
  <!-- 웹취약점관련 조치 후 주소찾기 안되어서 주석처리 
  <meta http-equiv="Content-Security-Policy" content="default-src *; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' 'unsafe-eval' http://www.google.com http://www.w3.org/;img-src 'self' data:">
   -->
  <title>부산대학교 - 학생지원시스템</title>
  <link rel="shortcut icon" href="/common/images_ses/logo.ico" type="image/x-icon">
  <link href="/common/css/jquery-ui.min.css" rel="stylesheet"> 
  <link href="/common/bootstrap-4.6.1/css/bootstrap.min.css" rel="stylesheet"> 
  <link href="/common/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet"> 
  <link href="/common/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
  
  <link href="/common/css/common.css?${CommonStaticFile.makeVersion('/common/css/common.css') }" rel="stylesheet">
  <link href="/common/css/style.css?${CommonStaticFile.makeVersion('/common/css/style.css') }" rel="stylesheet">
  <link href="/common/css/loading.css?${CommonStaticFile.makeVersion('/common/css/loading.css') }" rel="stylesheet">
  <link href="/common/css/popup.css?${CommonStaticFile.makeVersion('/common/css/popup.css') }" rel="stylesheet">
  <link href="/common/css/layer-popup.css?${CommonStaticFile.makeVersion('/common/css/layer-popup.css') }" rel="stylesheet">
  <link href="/common/css/common_dev.css?${CommonStaticFile.makeVersion('/common/css/common_dev.css') }" rel="stylesheet">
  <link href="/common/css/contents.css?${CommonStaticFile.makeVersion('/common/css/contents.css') }" rel="stylesheet">
  <c:if test ="${SESSION_LOCALE != '0001'}">
    <link href="/common/css/common_global.css?${CommonStaticFile.makeVersion('/common/css/common_global.css') }" rel="stylesheet">
    <link href="/common/css/style_global.css?${CommonStaticFile.makeVersion('/common/css/style.css') }" rel="stylesheet">    
  </c:if>
</head>
