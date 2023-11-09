<%@ page contentType="text/xml; charset=utf-8" pageEncoding="utf-8" isErrorPage="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

%>
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="/common/css/bootstrap.min.css" type="text/css"?>
<?xml-stylesheet href="/common/css/non-responsive.css" type="text/css"?>
<?xml-stylesheet href="/common/css/common.css" type="text/css"?>
<?xml-stylesheet href="/common/css/Style.css" type="text/css"?> 
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:ev="http://www.w3.org/2001/xml-events"
    xmlns:w2="http://www.inswave.com/websquare" xmlns:xf="http://www.w3.org/2002/xforms">
    <head>
    	<w2:type>DEFAULT</w2:type>
    	<w2:buildDate />
    	<xf:model>
    		<xf:instance>
    			<data xmlns="" />
    		</xf:instance>
    		<w2:dataCollection baseNode="map">
    		</w2:dataCollection>
    		<w2:workflowCollection></w2:workflowCollection>
    	</xf:model>
    	<script type="text/javascript" lazy="false"><![CDATA[
    		var msg = "<spring:message code='access.dinied'  />";
    		scwin.onpageload = function(){
    			if(msg) alert(msg);
    			lbl_msg.setValue(msg);
    		}
    		
    	]]></script>
    </head>
    <body ev:onpageunload="" ev:onpageload="scwin.onpageload" class="">
    	<xf:group style="" id="" class="">
    		<xf:group style="" id="" class="row">
    			<xf:group style="" id="" class="col-12">
    				<w2:textbox label="" style="" id="lbl_msg" class="h2"></w2:textbox>
    			</xf:group>
    		</xf:group>
    	</xf:group>
    </body>
</html>