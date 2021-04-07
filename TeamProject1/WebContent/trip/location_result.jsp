<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div >
          <ul class="nospace clear">
          <c:forEach var="vo" items="${list }" varStatus="s">
            <c:if test="${s.index%4==0 }">
             <li class="one_quarter first"><a href="../trip/detail_before.do?no=${vo.no }"><img src="${vo.poster }" title="${vo.title }" class="img-rounded" style="height:100px;width:200px;margin:0px auto"></a></li>
            </c:if>
            <c:if test="${s.index%4!=0 }">
             <li class="one_quarter"><a href="../trip/detail_before.do?no=${vo.no }"><img src="${vo.poster }" title="${vo.title }" class="img-rounded" style="height:100px;width:200px;margin:0px auto"></a></li>
            </c:if>
          </c:forEach>
          </ul>
          <figcaption></figcaption>
       
     </div>
</body>
</html>