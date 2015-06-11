<!-- 
author:zoubing
date:2015/5/20
 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="sql.EMSSql" import="java.sql.*"%>
<%@page import="include.ylx_db.ylx_db"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String sql;
ResultSet rs = null;
ylx_db db = new ylx_db("ylxdb");
sql = "select * from teach_comment_ems order by id desc limit 20";
rs = db.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<title>Demo</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/semantic.css" type="text/css">
<link rel="stylesheet" href="css/zyComment.css" type="text/css">
<!--注意ajax不能跨域名请求 这段代码只能在服务器上运行-->
<link rel="stylesheet" href="/ylx/ems/function/css/templatemo_main.css"/>
</head>
<body>
	<div id="articleComment">
		<div id="commentItems" class="ui threaded comments" style="margin-bottom:20px;">
			<div id="realdata"></div>
			
			<%
			int i=0;
			while(rs.next()){
			String str_msg  = rs.getString("msg");
			String str_time = rs.getString("time");
			%>
			<div id="comment<%=i%>" class="comment">	
				<a class="avatar">		
					<img src="images/foot.png">	</a>	
				<div class="content ">
					<div class="metadata">			
						<span class="date"><%=str_time%></span>		
					</div>		
					<div class="text"><%=str_msg%> </div>		
				</div>
			</div>
  			<%
  			i++;
  			}
  			%>
			<div id="commentFrom">
				<form id="replyBoxAri" class="ui reply form">	
					<div class="ui large form ">
						<div class="contentField field">
							<textarea id="commentContent" name="msg"></textarea>
							<label class="commentContentLabel" for="commentContent">Content</label>
						</div>
						<div id="submitComment" class="ui button teal submit labeled icon" onclick="setData(event)">
							<i class="icon edit"></i> 提交评论		
						</div>	
					</div>
				</form>
			</div>
</body>
<!--自己目录下的Jquery也可以-->
<script src="/ylx/ems/function/js/jquery.min.js"></script>
<script src="/ylx/ems/js/emsdata.js"></script>
<script type="text/javascript">
	setEMSDataById("#realdata");
	
	function setData(ev){
		var c = document.getElementById("commentContent").value;
		window.location.href="/ylx/environment/t/setEMSComment.jsp?msg="+c;
	}
</script>
</html>
