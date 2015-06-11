<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>环境监测系统-视频监控</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width">        
		<link rel="stylesheet" href="css/templatemo_main.css">
		<style type="text/css">
		#imgDisplay {
			width:100%;border:#ccc solid 1px;float:left;
		}
		</style>
	</head>
	
	<script type="text/javascript" src="../js/video.js"></script>
	<body>
		<div id="main-wrapper">
	  		<jsp:include page="_headbar.jsp" flush="true"/>
	
	    <div class="template-page-wrapper">
	    	<jsp:include page="_leftslide.jsp" flush="true"/>
	
	      <div class="templatemo-content-wrapper">
	        <div class="templatemo-content">
        
				<div id="camcon">
					<img alt="snapshot" id="imgDisplay" NOSAVE onload="OnImgLoad();"/><br><br>
				</div>
			</div>
		  </div>
		  
		</div>
		
		
		<jsp:include page="_footer.jsp" flush="true"/>
		</div>
	</body>
	<script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/templatemo_script.js"></script>
	<script type="text/javascript">
		showVideo("imgDisplay");
	</script>
</html>