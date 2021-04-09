<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
.jg{
font-family: 'Jeju Gothic', sans-serif;
}
.aaa {
	margin-top: 10px;
	font-size:18px;
	margin-bottom: 40px;
	}
</style>
</head>
<body>
<div >
          <ul class="nospace clear" >
          <c:forEach var="vo" items="${list }" varStatus="s">
          <div class="col-xl-3 col-xl-3 col-md-6" >
            <c:if test="${s.index%4==0 }">
          
             <li class="one_quarter first" ><a href="../trip/detail_before.do?no=${vo.no }"><img src="${vo.poster }" title="${vo.title }" class="img-rounded" style="height:100px;width:200px;margin:0px auto"></a></li>
            	<c:choose>
			        <c:when test="${fn:length(vo.title) gt 13}">
			         <li class="text-center aaa jg"><c:out value="${fn:substring(vo.title, 0, 12)}"><br>
			        </c:out></c:when>
			        <c:otherwise>
			        <li class="text-center aaa jg""><c:out value="${vo.title}"></li><br>
			        </c:out></c:otherwise>
				</c:choose>
            </c:if>
            <c:if test="${s.index%4!=0 }">
             <li class="one_quarter" ><a href="../trip/detail_before.do?no=${vo.no }"><img src="${vo.poster }" title="${vo.title }" class="img-rounded" style="height:100px;width:200px;margin:0px auto"></a></li>
           	<c:choose>
			        <c:when test="${fn:length(vo.title) gt 13}" >
			         <li class="text-center aaa jg"><c:out value="${fn:substring(vo.title, 0, 12)}" ><br>
			        </c:out></c:when>
			        <c:otherwise>
			         <li class="text-center aaa jg"><c:out value="${vo.title}"></li><br>
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