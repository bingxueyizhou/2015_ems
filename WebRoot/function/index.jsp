<!-- 
author:zoubing
date:2015/5/20
 -->
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>环境监测系统</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">        
  <link rel="stylesheet" href="css/templatemo_main.css">
</head>

<body>
	<div id="main-wrapper">
  		<jsp:include page="_headbar.jsp" flush="true"/>

    <div class="template-page-wrapper">
    	<jsp:include page="_leftslide.jsp" flush="true"/>

      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
        
       
          <ol class="breadcrumb">
          		<h1>我们做了什么?</h1>		 
          </ol>

          <div class="row">
          	
          	<div class="col-md-6">
               <div class="list-group">
                 <a href="maps.jsp" class="list-group-item active">
                   <h4 class="list-group-item-heading">地图指引</h4>
                   <p class="list-group-item-text">显示传感器所处位置</p>
                 </a>
               </div>
            </div>
          	
            <div class="col-md-6">
              <div class="list-group">
                 <a href="video.jsp" class="list-group-item">
                   <h4 class="list-group-item-heading">视频监控</h4>
                   <p class="list-group-item-text">显示视频监控情况</p>
                 </a>
               </div>         
            </div>
            
          </div>
          <div class="templatemo-panels">
          
            <div class="row">
            
              <div class="col-md-6 col-sm-6 margin-bottom-30">
                <div class="panel panel-success">
                  <div class="panel-heading">数据可视化</div>
                  <canvas id="templatemo-line-chart" height="120" width="500"></canvas>
                </div> 
                <span class="btn btn-success"><a href="chart.jsp">进入视图</a></span>
              </div>
                 
              <div class="col-md-6 col-sm-6 margin-bottom-30">
                <div class="panel panel-primary">
                  <div class="panel-heading">设备登录</div>
                  <div class="panel-body">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>First Name</th>
                          <th>Last Name</th>
                          <th>User name</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td>John</td>
                          <td>Smith</td>
                          <td>@js</td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>Bill</td>
                          <td>Jones</td>
                          <td>@bj</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <span class="btn btn-primary"><a href="device.jsp">Go管理</a></span>
              </div>       
            </div>
          </div>    
        </div>
      </div>
     
      <jsp:include page="_footer.jsp" flush="true"/>
    </div>
  </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/templatemo_script.js"></script>
    <script type="text/javascript">
    // Line chart
    var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
    var lineChartData = {
      labels : ["1月","2月","3月","4月","5月","6月","7月"],
      datasets : [
      {
        label: "My First dataset",
        fillColor : "rgba(220,220,220,0.2)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(220,220,220,1)",
        data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
      },
      {
        label: "My Second dataset",
        fillColor : "rgba(151,187,205,0.2)",
        strokeColor : "rgba(151,187,205,1)",
        pointColor : "rgba(151,187,205,1)",
        pointStrokeColor : "#fff",
        pointHighlightFill : "#fff",
        pointHighlightStroke : "rgba(151,187,205,1)",
        data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
      }
      ]

    }

    window.onload = function(){
      var ctx_line = document.getElementById("templatemo-line-chart").getContext("2d");
      window.myLine = new Chart(ctx_line).Line(lineChartData, {
        responsive: true
      });
    };

    $('#myTab a').click(function (e) {
      e.preventDefault();
      $(this).tab('show');
    });

    $('#loading-example-btn').click(function () {
      var btn = $(this);
      btn.button('loading');
      // $.ajax(...).always(function () {
      //   btn.button('reset');
      // });
  });
  </script>
</body>
</html>