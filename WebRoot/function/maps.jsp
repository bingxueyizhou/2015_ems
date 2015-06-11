<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--
author:chenzengchao
time: 23:32  2015/5/14
 -->
<%
	String str_x = request.getParameter("x");
	String str_y = request.getParameter("y");
	String place = "104.003323, 30.557691";
	if (str_x!=null&&str_y!=null){
		place = str_x+","+str_y;
	}
 %>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>地图指引</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="../css/amaze.min.css">
  <link rel="stylesheet" href="../css/amazeui.min.css"> 
  <link rel="stylesheet" href="css/templatemo_main.css">
  <style type="text/css">
	/* Small screens (default) */
	#container {
		width:100%;height:600px;border:#ccc solid 1px;float:right;
	}

	/* Medium screens (640px) */
	@media (min-width: 40rem) {
		#container {
			width:100%;height:600px;border:#ccc solid 1px;float:right;
		}
	}

	/* Large screens (1024px) */
	@media (min-width: 64rem) { 
		#container {
			width:81%;height:600px;border:#ccc solid 1px;float:right;
		}
	}
  </style>
  <script type="text/javascript" 
  	src="http://api.map.baidu.com/api?v=1.5&ak=iXqgoku7by1cUSYfROuQnga1">
  </script>
</head>
<body>
  <div id="main-wrapper">
    <jsp:include page="_headbar.jsp" flush="true"/>
    <div class="template-page-wrapper">
      <jsp:include page="_leftslide.jsp" flush="true"/>
		
		<div class="row">
	      	<div class="am-map col-md-16 col-sm-16"
	      		 id="container">
			</div>
		</div>
        <jsp:include page="_footer.jsp" flush="true"/>
      </div>
	</div>
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/templatemo_script.js"></script>  
      <script type="text/javascript">
        var map = new BMap.Map("container");          // 创建地图实例  
		var point = new BMap.Point(<%=place%>);  // 创建点坐标  
		map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别  
		var marker = new BMap.Marker(point);        // 创建标注    
		map.addOverlay(marker);                     // 将标注添加到地图中
		
		map.addControl(new BMap.NavigationControl());    
		map.addControl(new BMap.ScaleControl());  
	  </script>
</div>
</body>
</html>