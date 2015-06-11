<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="sql.getAllDevice"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>设备管理</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="../css/amazeui.min.css"/>        
  <link rel="stylesheet" href="css/templatemo_main.css">
</head>
<body>
  <div id="main-wrapper">
  <jsp:include page="_headbar.jsp" flush="true"/>
    
    <div class="template-page-wrapper">
    <jsp:include page="_leftslide.jsp" flush="true"/>

      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
          <h1>管理设备</h1>

          <div class="row">
            <div class="col-md-12">
              <div class="btn-group pull-right" id="templatemo_sort_btn">
              </div>
              <div class="table-responsive">
                <table class="table table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>设备名称</th>
                      <th>传感器类型</th>
                      <th>地图指引</th>
                      <th>UUID</th>   
                      <th>操作</th>
                      <th>提交</th>
                    </tr>
                  </thead>
                  <tbody>

                   <tr> 
                    <%
                    ResultSet rs = (new getAllDevice()).getResult();
                    
                    int k=0;
                    while(rs.next()){
                    String kId = rs.getString("id");
                    String UUID = rs.getString("mark");
                    String jingdu = rs.getString("x");
                    String weidu = rs.getString("y");
                    String sensor = rs.getString("type");
                    String name = rs.getString("name");
                    String[] isSel = new String[5];
                    for(int i=0;i<isSel.length;i++){isSel[i]="";}
                   	if(sensor.equals("pm2_5")){
                   		isSel[0] = "selected";
                   	}else if(sensor.equals("tem")){
                   		isSel[1] = "selected";
                   	}else if(sensor.equals("wet")){
                   		isSel[2] = "selected";
                   	}else if(sensor.equals("noiser")){
                   		isSel[3] = "selected";
                   	}else if(sensor.equals("video")){
                   		isSel[4] = "selected";
                   	}
                    %>
                    <form action="../query/updateDevice.jsp" method="post">
                      <tr>
                      <td><%=k%></td>  
                      <td><input type="text" class="form-control" id="longitude" name="name" value="<%=name %>"> </td>
                      <td> 
                    <select class="margin-bottom-15" width="1000" name="type" id="singleSelect"+i+> 
	                    <option value="pm2_5" <%=isSel[0]%> >pm2.5</option>
	                    <option value="tem"   <%=isSel[1]%> >温 度</option>
	                    <option value="wet"   <%=isSel[2]%> >湿 度</option>
	                    <option value="noiser"<%=isSel[3]%> >噪 音</option>
	                    <option value="video" <%=isSel[4]%> >视 频</option>
	                    <option value="video" <%=isSel[4]%> >数据传输</option>
                    </select>
                    <input type="hidden" name="op" value="update"/>
                    <input type="hidden" name="id" value="<%=kId %>"/>
                    <a herf="../query/updateDevice.jsp?op=delete&id=<%=kId %>"></a>
                      </td> 
                      <td><a href="maps.jsp?x=<%=jingdu %>&y=<%=weidu %>" <i class="am-icon-send-o am-icon-sm"></i></a></td>
                      <td><p><%=UUID%></p></td>
                      <td><a href="../query/updateDevice.jsp?op=delete&id=<%=kId %>" class="btn btn-link">Delete</a></td>
                      <td><button type="submit" class="btn btn-primary">submit</button></a></td>
                      </tr>
                      </form>
                      <%k++;}%>
                    </tr>

                                      
                  </tbody>
                </table> 
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
    <script src="js/templatemo_script.js"></script>
  </body>
</html>