<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h4>근처 추천 여행지</h4>
	 <div class="favourite-place place-padding">
            <div class="container">
         	    <table>
                 <c:forEach var="mvo" items="${zList }"> 
                     	<tr>
                         <a href="../trip/trip_detail.do?no=${mvo.no }">
                              <!-- div class="media post_item"> -->
                               <img src="${mvo.poster }" style="width:160px;height:115px">
                               <h4>${mvo.title }</h4>
                            </a>
                         </tr>
                    </c:forEach>
  							</table> 
  					</div>
  			</div>
</body>
</html>