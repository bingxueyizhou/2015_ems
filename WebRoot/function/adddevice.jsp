<!-- 
author:huangsong
date:2015/5/20
 -->
 <%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>环境监测 -添加设备</title>
  <meta name="description" content="环境监测系统">
  <meta name="keywords" content="环境监测系统">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="../i/envicon.png">
  <link rel="apple-touch-icon-precomposed" href="../i/app-icon72x72@2x.png">
  <link rel="stylesheet" href="../css/amazeui.min.css"/>
  <style>
  	.footer p {
      color: #7f8c8d;
      margin: 0;
      padding: 10px 0;
      text-align: center;
      background: #eeeeee;
    }
  </style>

</head>
<body>

<header class="am-topbar admin-header" onClick="window.location.href='../'" style="cursor:pointer;">
  <div class="am-topbar-brand">
    <strong><span class="am-icon-home"></span>  XM17</strong> <small>环境监测系统</small>
  </div>
  
</header>


<!-- content start -->
<body>
<div class="admin-content">
    
<div class="am-g">
  <div class="am-u-lg-4 am-u-md-8 am-u-sm-centered">
  	<%
  		String s = request.getParameter("sid");
  		if (s != null&& s.length() == 36) out.println("唯一标示:<font color='red'>"+s+"</font><br>");
  	%>
	<form method="post" class="am-form" action="../query/addDevice.jsp" method="get">
      <label for="name">设备名称:</label>
      <input type="text" name="name" id="name" value="">
      <br>
      
	  <label for="type">传感器类型:</label><br>
      <select id="type" name="type">
        <option value="pm2_5">PM2.5</option>
        <option value="tem">温度</option>
        <option value="wet">湿度</option>
        <option value="videor">噪音</option>
        <option value="noiser">视频</option>
        <option value="center">数据传输设备</option>
      </select>
      <br>
          
      <label for="x">经度:</label>
      <input type="text" name="x" id="x" value="">
      <br>
      <label for="y">纬度:</label>
      <input type="text" name="y" id="y" value="">
      <br>
      
	  <label for="info">备注</label>
         <textarea id="info" name="info" rows="5" placeholder="请填写备注信息！！！"resize:none"></textarea>
      <br>
       
      <input type="submit" name="" value="添加" class="am-btn am-btn-primary am-btn-lg am-btn-block">
      <br>
    </form>
  </div>
</div>

<footer class="footer">
  <p>@2015 <a herf="#">黄松</a> powered by <a href="http://amazeui.org/">AmazeUI team</a> and thank them
  </p>
</footer>


<script src="../js/jquery.min.js"></script>
<script src="../js/amazeui.min.js"></script>
<script src="../js/app.js"></script>
</body>
</html>
