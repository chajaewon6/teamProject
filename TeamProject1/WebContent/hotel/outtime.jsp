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
	$('.intime').click(function(){
		let time1=$(this).text();
		$('#reserve_outtime1').text(time1)
		
		$.ajax({
			type:'post',
			url:'../hotel/inwon.do',
			success:function(result)
			{
				$('#reserve_inwon').html(result);
				
			}
		});
	})
})
</script>
</head>
<body>
  <table class="table">
   <tr>
      <td class="text-left">
       
         <span class="btn btn-sm btn-success intime">06:00</span>
         <span class="btn btn-sm btn-success intime">07:00</span>
         <span class="btn btn-sm btn-success intime">08:00</span>
         <span class="btn btn-sm btn-success intime">09:00</span>
         <span class="btn btn-sm btn-success intime">10:00</span>
         <span class="btn btn-sm btn-success intime">11:00</span>
         <span class="btn btn-sm btn-success intime">12:00</span>    
      </td>
     </tr>
  </table>
</body>
</html>