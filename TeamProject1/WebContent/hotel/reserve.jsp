<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mypage_row{
  margin: 0px auto;
  width:1500px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'POST',
		url:'../hotel/reserve_hoteldetail.do',
		success:function(result)
		{
			$('#hotel_detail').html(result);
		}
	});
	
	$('#rBtn').click(function(){
		let title=$('#reserve_title').text();
		let day=$('#reserve_day').text();
		let time1=$('#reserve_time1').text();
		let time2=$('#reserve_time2').text();
		let inwon=$('#reserve_inwon1').text();
		
		$.ajax({
			type:'post',
			url:'../hotel/reserve_save.do',
			data:{"title":title,"day":day,"time1":time1,"time2":time2,"inwon":inwon},
			success:function(result)
			{
				location.href="../hotel/mypage.do";
			}
		})
	});
});
</script>
</head>
<body>
<div class="wrapper row3 mypage_row">
  <h2 class="sectiontitle">예약하기</h2>
  <table class="table">
   <tr>
     <td width=35%>
       <div style="height: 500px">
         <table class="table">
          <h4>호텔정보</h4>
          <tr>
           <td>
             <div style="height: 400px;overflow-y:auto" id="hotel_detail">
             </div>
           </td>
          </tr>
         </table>
       </div>
     </td>
     <td width=30%>
       <div style="height: 500px">
         <table class="table">
          <h4>예약일정보</h4>
          <tr>
            <td id="hotel_date"></td>
          </tr>
         </table>
       </div>
     </td>
     <td width=35% rowspan=2>
         <table class="table">
          <h4>예약정보</h4>
          <tr>
            <td colspan="2" class="text-center">
             <img id="reserve_poster" style="height:150px;width:250px">
            </td>
          </tr>
          <tr>
            <th class="text-right" width="20%">업체명</th>
            <td width="80%"><span id="reserve_title"></span></td>
          </tr>
          <tr>
            <th class="text-right" width="20%">예약일</th>
            <td width="80%"><span id="reserve_day"></span></td>
          </tr>
          <tr>
            <th class="text-right" width="20%">체크인</th>
            <td width="80%"><span id="reserve_time1"></span></td>
          </tr>
          <tr>
            <th class="text-right" width="20%">체크아웃</th>
            <td width="80%"><span id="reserve_time2"></span></td>
          </tr>
          <tr>
            <th class="text-right" width="20%">인원</th>
            <td width="80%"><span id="reserve_inwon1"></span></td>
          </tr>
          <tr style="display:none" id="reserveBtn">
            <td colspan="2" class="text-center">
             
              <input type="button" value="예약하기" class="btn btn-lg btn-danger" id="rBtn">
             
            </td>
          </tr>
         </table>
     </td>
   </tr>
   <tr>
     <td width=35%>
       <div style="height: 100px">
         <table class="table">
          <h4>체크인</h4>
          <tr>
            <td id="reserve_time"></td>
          </tr>
         </table>
       </div>
       <div style="height: 100px">
         <table class="table">
          <h4>체크아웃</h4>
          <tr>
            <td id="reserve_tim"></td>
          </tr>
         </table>
       </div>
     </td>
     <td width=30%>
       <div style="height: 100px">
         <table class="table">
          <caption>인원정보</caption>
          <tr>
            <td id="reserve_inwon"></td>
          </tr>
         </table>
       </div>
     </td> 
   </tr>
   
  </table>
  </div>
</body>
</html>