<!-- 
author:zoubing
date:2015/5/20
 -->
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>环境监测-图表</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width"/> 
  <link rel="stylesheet" href="../css/amazeui.min.css"/>
  <link rel="stylesheet" href="css/templatemo_main.css"/>
</head>
<body>
  <div id="main-wrapper">
  <jsp:include page="_headbar.jsp" flush="true"/>
    
    <div class="template-page-wrapper">
    <jsp:include page="_leftslide.jsp" flush="true"/>

      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
          
          
		  <div>
			<form>
			<select id="type" name="type" 
					data-am-selected="{btnWidth: 100, btnSize: 'sm', btnStyle: 'secondary'}" 
					data-changed="type_change"
					>
				<option value="pm2_5" selected="selected">PM2_5</option>
				<option value="noiser">噪音</option>
				<option value="tem">温度</option>
				<option value="wet">湿度</option>
			</select>
			
	    	<select id="date" name="date" 
	    			data-am-selected="{btnWidth: 50, btnSize: 'sm', btnStyle: 'secondary'}" 
	    			data-changed="date_change">
				<option value="year">年</option>
				<option value="month">月</option>
				<option value="day" selected="selected">日</option>
			</select>
			
	    	<select id="detail" name="detail"
	    			data-am-selected="{btnWidth: 80, btnSize: 'sm', btnStyle: 'secondary'}" 
	    			data-changed="del_change"
	    			>
				<option value="val_0">当前</option>
			</select>
		    </form>
	 	  </div>
		  <br>
           
          <div class="templatemo-charts">
            
            <div class="row">
              <div class="col-md-16 col-sm-16">
                <div class="panel panel-success">
                  <div class="panel-heading">统计图</div>
                  <canvas id="main-line-chart"></canvas>
                </div>                       
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
    <script src="../js/jquery.min.js"></script>
	<script src="../js/amazeui.min.js"></script>
	<script src="../js/app.js"></script>
    <script type="text/javascript">
	var ctx_line = document.getElementById("main-line-chart").getContext("2d");
	var mlabel;
	var mdata ;
    function getLineChartData(){
	  	var lineChartData = {
	        labels : mlabel,
	        datasets : [{
	          label: "main chart",
	          fillColor : "rgba(151,187,205,0.2)",
	          strokeColor : "rgba(151,187,205,1)",
	          pointColor : "rgba(151,187,205,1)",
	          pointStrokeColor : "#fff",
	          pointHighlightFill : "#fff",
	          pointHighlightStroke : "rgba(151,187,205,1)",
	          data : mdata
	        }]
	      }
	    return lineChartData;
	}
	
	function getDataLabel(data){
		var aimP = "";
		var startI = 1;
		if($("#date").val() === "day"){
			aimP = 'd';
        }else if ($("#date").val() === "month"){
        	aimP = 'Mon';
        }else if ($("#date").val() === "year"){
        	startI = 2013;
        	aimP = 'y';
        }
        var dlabel = new Array();
        for(var i=0;i<data.length;i++){
        	dlabel[i] = i+startI+aimP;
        }
		return dlabel;
	}
	
	var rtimes = 0;
	function getArrayData(){//isfirst than onload
		rtimes ++;
		if (rtimes === 1) return;//avoid too more request
		
		//数据处理
		var qurl = "../query/getChartData.jsp?type="+
					$("#type").val()+
					"&date="+
					$("#date").val();
					
		var str_del = $("#detail").val();
		if (str_del !== 'val_0'){
		
			var now = new Date();
			str_del = str_del.substring(4,str_del.length);
			if($("#date").val() === "day"){
 				str_del = now.getMonth()+1 - str_del;
           	}else if ($("#date").val() === "month"){
 				str_del = now.getFullYear() - str_del;
           	}else if ($("#date").val() === "year"){
           		
           	}
           	//alert(qurl+"&detail="+str_del);
			qurl = qurl+"&detail="+str_del;
			//alert(qurl);
		}
		//异步请求操作
		$.ajax({ 
         	type: "GET", 
            url:  qurl,
            dataType: "json",
            success: function (data) {
            	if (data['code'] === 0){
            		alert(data['msg']);
            	}else{
            		mdata = data['data'];
					mlabel = getDataLabel(mdata);
					//alert(mdata);
			        DrawLine();
            	}
            }, 
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("失败\n"+errorThrown); 
            } 
       });
	   //alert(rtimes);
	}
	
	function DrawLine(){
		//alert($("#type").val()+"\n"+$("#date").val()+"\n"+$("#detail").val());
        new Chart(ctx_line).Line(getLineChartData() , {
		  responsive: true
		});
	}

	window.onload = function(){
		var e=$("#date");
	    var tf = 0,df=0,delf=0;
	    var isYear = 0;
		getArrayData();
		
	    $("[data-changed]").on("change",function(){
	        var t=$(this).data("changed");
			
	        if ("date_change"===t){
				var now = new Date();
		  		var nMax = 0;
		  		var aimI = 0;//目标数字
		  		var aimP = "";//目标单位
	            $("#detail").empty();
	            
	            if (df == 0){
	                $("#detail").append('<option value="val_0">当前</option>');
	  				nMax = now.getMonth()+1;
			  		for(var i=1;i<nMax;i++){
			  			aimI = nMax - i;
			  			$("#detail").append('<option value="val_'+i+'">'+aimI+'月</option>');
			  		}
	                df = 1;
	            }else{
	            	if(e.val() === "day"){
	            		aimP = "月";
	            		isYear = 0;
	  					nMax = now.getMonth()+1;
	            	}else if (e.val() === "month"){
	            		aimP = "年";
	  					nMax = now.getFullYear() - 2013;
	  					isYear = 2013;
	            	}else if (e.val() === "year"){
	            		nMax = 0;
	            	}
	            	
	                $("#detail").append('<option value="val_0">当前</option>');
			  		for(var i=1;i<nMax;i++){
			  			aimI = nMax - i + isYear;
			  			$("#detail").append('<option value="val_'+i+'">'+aimI+aimP+'</option>');
			  		}
			  		delf = 0;
	        		getArrayData();
	            }
	        }else if ("type_change"===t){
	        	if (tf == 0){
	                tf = 1;
	            }else{
	        		getArrayData();
	            }
	        }else if ("del_change"===t){
	        	if (delf == 0){
	                delf = 1;
	            }else{
	        		getArrayData();
	            }
	        }
	        if (!$.AMUI.support.mutationobserver){
	        	alert("不支持JQuery");
	        	e.trigger("changed.selected.amui");
	        }
	    });
	}
    </script>
  </body>
</html>