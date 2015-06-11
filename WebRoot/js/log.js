/**
*@author zoubing
*@data 2015/5/25
*@function to record us
*/

function record(){
	var text   =  "-------求女票两枚-------\n"+
				"因考虑项目组员长期单身,对身心健康都不好,现急求两名妹子";
	var footer =  "by. 热心的组长:冰雪一舟\n"+
	  			  "2015.3.15-2015.5.26\n"+
	  			  "group:XM17环境监测系统\n"+
				  "date:2015/5/26\n";
	console.error(text);
	console.group("黄松");
    console.log("计算机学院2013级9班");
    console.log("年龄:20");
    console.log("个人描述:文艺青年一枚");
    console.groupEnd();
  　    console.group("陈增超");
    console.log("计算机学院2013级9班");
    console.log("年龄:21");
    console.log("个人描述:考得住的男主人");
  　    console.groupEnd();
	console.info(footer);
}