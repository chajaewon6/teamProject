<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ripple {
  background-position: center;
  transition: background 0.8s;
}
.ripple:hover {
  background: #47a7f5 radial-gradient(circle, transparent 1%, #47a7f5 1%) center/15000%;
}
.ripple:active {
  background-color: #6eb9f7;
  background-size: 100%;
  transition: background 0s;
}

/* Button style */
button {
  border: none;
  border-radius: 2px;
  padding: 12px 18px;
  font-size: 16px;
  text-transform: uppercase;
  cursor: pointer;
  color: white;
  background-color: #2196f3;
  box-shadow: 0 0 4px #999;
  outline: none;
}
</style>
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
          <button class="ripple outtime">${time2 }</button>
        </c:forEach>
      </td>
    </tr>
  </table>
</body>
</html>