<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
		<script>
		var dataCollect = {};
		
        var gCsrfTokenHeaderName = '${_csrf.headerName}';
        var gCsrfTokenParameterName = '${_csrf.parameterName}';
        var gCsrfToken = '${_csrf.token}';
        var _sToken = '${_sToken}';
        var _pipToken = '${_pipToken}';
        var _localHost = '${_localHost}';
        var _connLastDt = '${_connLastDt}';
        var _connIp = '${_connIp}';
        scwin.frameMenuAuth = opener.scwin.menuInfo.AUTH_STR;
        scwin.frameMenuData = opener.scwin.menuInfo;
        scwin.menuInfo = opener.scwin.menuInfo;
		</script>
        <script src="/common/js/tree/manual-dtree.js"></script>
        
        <script>

        </script>
        
        <style>
<!--
.tree-label{cursor: pointer;}
.tree-label.selected {font-weight: bold;}
-->
</style>
