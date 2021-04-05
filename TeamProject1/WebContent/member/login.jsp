<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
   width:300px;
   margin: 0px auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#canBtn').click(function(){
		parent.Shadowbox.close();
	});
	$('#logBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()=="")
		{	
			 $('#result').text("아이디를 입력하세요");
			$('#id').focus();
			return;
		}
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			 $('#result').text("비밀번호를 입력하세요");
			$('#pwd').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/login.do',
			data:{"id":id,"pwd":pwd},
			success:function(result)
			{
				let s=result.trim();
				if(s=="NOID")
				{
					$('#result').html('<font color="red">아이디를 입력하세요!</font>');
					$('#check').html('');
				}
				else if(s=="NOPWD")
				{
					$('#result').html('<font color="red">비밀번호를 입력하세요!</font>');
		               $('#check').html('');
				}
				else
				{
					// 이동 => main.do로 이동 
					parent.location.href="../main/main.do";
				}
			}
		});
	})
});
function ok(){
	parent.join_frm.id.value=$('#id').val();
	parent.Shadowbox.close();
}
</script>
</head>
<body>
  <div style="height:20px"></div>
  <div class="container">
    <div class="row">
     <table class="table">
      <tr>
       <th width=30% class="text-right danger">ID</th>
       <td width=70%>
         <input type=text name=id size=15 class="input-sm" id=id>
       </td>
      </tr>
      <tr>
       <th width=30% class="text-right danger">Password</th>
       <td width=70%>
         <input type=password name=pwd size=15 class="input-sm" id=pwd>
       </td>
      </tr>
      <tr>
      	 <td colspan="2" class="text-center"><span id="result" style="color:red"></span></td>
     </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="button" value="로그인" class="btn btn-sm btn-success" id="logBtn">
          <input type="button" value="취소" class="btn btn-sm btn-info" id="canBtn">
        </td>
      </tr>
     </table>
    </div>
  </div>
</body>
</html>
