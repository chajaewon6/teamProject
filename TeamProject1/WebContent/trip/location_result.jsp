<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div >
          <ul class="nospace clear" >
          <c:forEach var="vo" items="${list }" varStatus="s">
          <div class="col-xl-3 col-xl-3 col-md-6" >
            <c:if test="${s.index%4==0 }">
          
             <li class="one_quarter first" ><a href="../trip/detail_before.do?no=${vo.no }"><img src="${vo.poster }" title="${vo.title }" class="img-rounded" style="height:100px;width:200px;margin:0px auto"></a></li>
            	<c:choose>
			        <c:when test="${fn:length(vo.title) gt 15}">
			        <c:out value="${fn:substring(vo.title, 0, 14)}">
			        </c:out></c:when>
			        <c:otherwise>
			        <c:out value="${vo.title}">
			        </c:out></c:otherwise>
				</c:choose>
            </c:if>
            <c:if test="${s.index%4!=0 }">
             <li class="one_quarter" ><a href="../trip/detail_before.do?no=${vo.no }"><img src="${vo.poster }" title="${vo.title }" class="img-rounded" style="height:100px;width:200px;margin:0px auto"></a></li>
           	<c:choose>
			        <c:when test="${fn:length(vo.title) gt 15}" >
			        <c:out value="${fn:substring(vo.title, 0, 14)}" >
			        </c:out></c:when>
			        <c:otherwise>
			        <c:out value="${vo.title}">
			        </c:out></c:otherwise>
				</c:choose>
            </c:if>
            </div>
          </c:forEach>
          </ul>
          <figcaption></figcaption>
       
     </div>
</body>
</html>