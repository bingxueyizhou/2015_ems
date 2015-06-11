<!-- 
author:huangsong
data:2015/5/20
-->
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>环境监测系统-视频回放</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width">        
		<link rel="stylesheet" href="css/templatemo_main.css">
		<style type="text/css">
		/* Small screens (default) */
		#imgDisplay {
			width:100%;border:#ccc solid 1px;float:right;
		}
	
		/* Medium screens (640px) */
		@media (min-width: 40rem) {
			#imgDisplay {
				width:100%;border:#ccc solid 1px;float:right;
			}
		}
	
		/* Large screens (1024px) */
		@media (min-width: 64rem) { 
			#imgDisplay {
				width:100%;border:#ccc solid 1px;float:right;
			}
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
					<img alt="视频观看完毕！！！" id="imgDisplay" NOSAVE onload="onPicLoad()"/><br><br>
					<input type="range" id="trackBar" min="1" max="500" step="1" value="1" />

                    </video>
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
		showPic("imgDisplay","trackBar",100);
		
		function c(){
			changeI(101);
		}
		
		
	    var trackBar = document.getElementById("trackBar");   
	    trackBar.min = 100;
	    trackBar.max = 600;
	    trackBar.step = 1;
	    trackBar.value = 1;
           trackBar.addEventListener("change",function(){ 
           setPicI(trackBar.value);         
        });
		

	</script>
</html>