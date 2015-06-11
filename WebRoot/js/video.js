/** 
*author:zoubing
*date:2015/5/20
*/
var g_nIndex=0;
var itemId = "imgDisplay";
var ip="cdylx.3322.org";
var port="9033";
var ylx_user = "admin";
var ylx_key  = "admin";

function showVideo(item){
	itemId = item;
	OnBtnRefresh();
	OnImgLoad();
}

function OnImgLoad(){
	setTimeout("OnBtnRefresh()",1000);
}

function OnBtnRefresh(){
	document.getElementById(itemId).src = 
			"http://"+ip+
			":"+port+
			"/snap.jpg?user="+ylx_user+
			"&pwd="+ylx_key+
			"&idx="+g_nIndex++;
}


var ti = 100;
var picItem = "";
var barItem = "";

function showPic(item,bar_item,num){
	picItem = item;
	barItem = bar_item;
	ti = num;
	onPicRefresh();
}

function onPicLoad(){
	ti ++;
	setTimeout("onPicRefresh()",1000);
}

function onPicRefresh(){
	document.getElementById(itemId).src = "../i/pic/"+ti+".jpg";
	document.getElementById(barItem).value = ti;
}

function changeI(v){
	ti = v;
	onPicRefresh();
}

function setPicI(v){
	if (ti >= 600){
		ti = v;
		onPicRefresh();
	}else{
		ti = v;
	}
}
