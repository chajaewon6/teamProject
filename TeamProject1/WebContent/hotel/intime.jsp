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
	$('.outtime').click(function(){
		let time2=$(this).text();
		$('#reserve_intime1').text(time2)
		
		/* $.ajax({
			type:'post',
			url:'../hotel/intime.do',
			success:function(result)
			{
				$('#reserve_outtime').html(result);
			}
		}) */
		$.ajax({
			type:'post',
			url:'../hotel/outtime.do',
			
			success:function(result)
			{
				$('#reserve_outtime').html(result);
			}
		});
	})
})
</script>
</head>
<body>
  <table class="table">
    <tr>
      <td>
        <c:forEach var="time2" items="${list1 }">
          <span class="btn btn-sm btn-success outtime">${time2 }</span>
        </c:forEach>
      </td>
    </tr>
  </table>
</body>
</html>