<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.rooms').click(function(){
		let inwon=$(this).text();
		$('#reserve_room1').text(inwon);
		$('#reserveBtn').show();
		
		
	})
})
</script>
</head>
<body>
   <table class="table">
     <tr>
      <td class="text-left">
       <c:forEach var="i" begin="1" end="10">
         <span class="btn btn-sm btn-warning rooms">${i }</span>
       </c:forEach>
      </td>
     </tr>
   </table>
</body>
</html>