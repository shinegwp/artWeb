<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://www.ijquery.cn/js/jquery.js"></script>  
        <script type="text/javascript" src="http://www.ijquery.cn/js/cityselect/jquery.cityselect.js"></script> 
</head>
<body>
	<p id="city" class="mb20 clearfix" align="Center">
								
    <select class="prov"></select>    
    <select class="city" disabled="disabled"></select>   
    <select class="dist" disabled="disabled"></select>   
							</p>
 <script type="text/javascript">  
$(document).ready(function() {  
    $("#city").citySelect({  
        prov: "陕西",  
        city: "西安",  
        dist: "雁塔区",  
        nodata: "none"  
    });  
});
</script>
</body>
</html>