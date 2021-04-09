<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
.jg{
margin-top:5px;
font-family: 'Jeju Gothic', sans-serif;
font-size:13px;
}

.add{
	float:left
	
}
</style>
</head>
<body>
	 <div class="favourite-place place-padding">
      <div class="container">
      <div class="col-lg-12 mb-12 mb-lg-12">
       <table>
       
          <c:forEach var="mvo" items="${zList }"> 
           <tr>
             <a href="../trip/trip_detail.do?no=${mvo.no }" style="float:left;padding-right:25px">
              <!-- div class="media post_item"> -->
                <img src="${mvo.poster }" style="width:140px;height:100px">
               
                <li class="jg">${mvo.title }</li>
             </a>
           </tr>
          </c:forEach>
          
  		</table> 
  		</div>
  	   </div>
  	  </div>
</body>
</html>