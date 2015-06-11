
      
      <%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>  
    <json:object>  
      <json:property name="itemCount" value="${cart.itemCount}"/>  
      <json:property name="subtotal" value="${cart.subtotal}"/>  
      <json:array name="items" var="item" items="${cart.lineItems}">  
        <json:object>  
          <json:property name="title" value="${item.title}"/>  
          <json:property name="description" value="${item.description}"/>  
          <json:property name="imageUrl" value="${item.imageUrl"/>  
          <json:property name="price" value="${item.price}"/>  
          <json:property name="qty" value="${item.qty}"/>  
        </json:object>  
      </json:array>  
    </json:object>
    
var arr = '{"red":{"id":1,"name":"mary"},"blue":{"id":2,"name":"u71d5u5b50"}}';//u71d5u5b50这个是php中自动转换的
var dataObj = eval("("+arr+")");//这里要加上加好括号和双引号的原因我也不知道，就当是json语法，只能死记硬背了
  $.each(dataObj,function(idx,item){   
   //输出  
   alert(item.id+"哈哈"+item.name);   
})


var arr = {"red":{"id":1,"name":"mary"},"blue":{"id":2,"name":"u71d5u5b50"}};
  $.each(arr,function(idx,item){     
   //输出
   alert(item.id+"哈哈"+item.name);
})