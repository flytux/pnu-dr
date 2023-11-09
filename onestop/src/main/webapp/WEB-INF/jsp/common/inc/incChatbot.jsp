<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 기존 코드  --%>
<%-- <div class="chatbot-wrapper right">
    <button onclick="window.open('https://chatbot.pusan.ac.kr', 'window_chatbot', 'width=450, height=800, top=100, left=200, location=no, resizeable=yes')" class="chatbot-button" title="챗봇 버튼" style="backgroud-color:rgb(47, 110, 141); border-radius: 50%">
        <div class="chatbot-img" style="width:100px; height:100px;"></div>
        <div class="chatbot-img-on" style="width:100px; height:100px;"></div>
    </button>
</div> --%>

<script type="text/javascript" language="javascript" >
    scwin._sToken = '${_sToken}';
    
    function linkToChatbot() {
    	// 챗봇 URL 기본값
    	scwin._chatbotUrl = "https://chatbot.pusan.ac.kr";
    	// 토큰 있을 경우 URL 변경 ("", null, undefined, 0, NaN이 아닌 경우)
    	if(scwin._sToken) {
    		scwin._chatbotUrl = "https://login.pusan.ac.kr/chatbot/loginPage";
    	} 
    	// 챗봇 팝업 열기
    	window.open(scwin._chatbotUrl, 'window_chatbot', 'width=450, height=800, top=100, left=200, location=no, resizeable=yes');
    }
</script>

<div class="chatbot-wrapper right">
    <button onclick="javascript:linkToChatbot();" class="chatbot-button" title="챗봇 새창열기" type="button" style="backgroud-color:rgb(47, 110, 141); border-radius: 50%">
        <%-- <div class="chatbot-img" style="width:100px; height:100px;"></div> --%>
        <div class="chatbot-change-image" style="width:100px; height:100px;"></div>
    </button>
</div>