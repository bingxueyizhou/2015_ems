<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>环境监测-实时</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width"/>
  <link rel="stylesheet" href="css/templatemo_main.css"/>
</head>
<body>
  <div id="main-wrapper">
    <jsp:include page="_headbar.jsp" flush="true"/>
    
    <div class="template-page-wrapper">
      <jsp:include page="_leftslide.jsp" flush="true"/>

      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
           <div id="realdata"></div>
        </div>
      </div>

      <jsp:include page="_footer.jsp" flush="true"/>
    </div>

</div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/templatemo_script.js"></script>
    <script src="../js/emsdata.js"></script>
    <script type="text/javascript">
    	setEMSDataById("#realdata");
    </script>
  </body>
</html>