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
			<main>
        <!-- Favourite Places Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                <div class="row">
                	<c:forEach var="vo" items="${list }">	
	                    <div class="col-xl-4 col-lg- col-md-6">
	                        <div class="single-place mb-30">
	                        	<a href="../trip/trip_detail.do?no=${vo.no }">
	                            	<div class="place-img">
	                                <img src="${vo.poster }" alt="">
	                            	</div>
	                            	<div class="place-cap">
	                                <div class="place-cap-top">
	                                	<div class="#">
	                                    </div>
	                                    <h3>${vo.title }</h3>
	                                    <p class="dolor">${vo.category }</p> 
	                                </div>
	                            	</div>
	                            </a> 
	                        </div>
	                    </div>
                   </c:forEach>
                </div>
            </div>
        </div>
    </main>
</body>
</html>