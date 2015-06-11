/*
*author ： zoubing
*date   : 2015/5/25 10:12
*function:to get ems realtime data
*/

function setEMSDataById(id){
	//异步请求操作
	$.ajax({ 
     	type: "GET", 
        url:  "../query/getRealData.jsp",
        dataType: "json",
        success: function (data) {
        	if (data['code'] === 0){
        		alert(data['msg']);
        	}else{
                $(id).append(
                		'<div class="table-responsive">'+
                        '<table class="table table-striped table-hover table-bordered">'+
                        '<thead><tr>'+
                		'	<th>地点</th>'+
                		'	<th>温度(℃)</th>'+
                		'	<th>湿度</th>'+
                		'	<th>PM2.5（μg/m3）</th>'+
                		'	<th>噪音</th>'+
                		'</tr></thead>'+
                		'<tbody><tr>'+ 
                		'	<td>'+data['place']+' </td>'+
                		'	<td>'+data['tem']+'</td>'+
                		'	<td>'+data['wet']+'</td>'+
                		'	<td>'+data['pm2_5']+'</td>'+
                		'	<td>'+data['noiser']+'</td>'+
                		'</tr></tbody></table></div>');
        	}
        }, 
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.error("表格请求失败\n"+errorThrown); 
        } 
   });
}