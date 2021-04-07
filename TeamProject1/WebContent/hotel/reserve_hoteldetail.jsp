<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.detail').hover(function(){
		$(this).css("cursor","pointer");
	},function(){
		$(this).css("cursor","");
	});
	
	$('.detail').click(function(){
		let poster=$(this).attr("data-poster");
		let title=$(this).attr("data-title");
		let no=$(this).attr("data-no");
		let grade=$(this).attr("data-grade");
		let price=$(this).attr("data-price");
		
		$('#reserve_poster').attr("src",poster);
		$('#reserve_title').text(title);
		$('#reserve_grade').text(grade);
		$('#reserve_price').text(price);
		
		$.ajax({
			type:'post',
			url:'../hotel/date.do',
			data:{"no":no},
			success:function(result)
			{
				$('#hotel_date').html(result);
				
			}
		});
	});
})
</script>
</head>
<body>
  <table class="table">
    <c:forEach var="vo" items="${list }">
      <tr class="detail" data-poster="${vo.poster }" data-title="${vo.title }" data-no="${vo.no }" data-grade="${fn:substring(vo.grade,0,fn:indexOf(vo.grade,'(')) }" data-price="${vo.price }">
       <td class="text-center"><img src="${vo.poster }" style="height: 50px;width:60px"></td>
       <td>${vo.title }</td>
       <td>${fn:substring(vo.grade,0,fn:indexOf(vo.grade,'(')) }</td>
       <td>${vo.price }</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>