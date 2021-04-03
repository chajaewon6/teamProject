<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Login/Logout animation concept</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes"><link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'><link rel="stylesheet" href="../css/login_css.css">
<style type="text/css">
.svg-icon{
	margin: 0px auto;
}
</style>
</head>
<body>
<!-- partial:index.partial.html -->

    <div class="login">
      <!-- <div class="login__check"></div> -->
      <div class="login__form">
        <div class="login__row">
          <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
            <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
          </svg>
          <input type="text" class="login__input name" placeholder="아이디"/>
        </div>
        <div class="login__row">
          <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
            <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
          </svg>
          <input type="password" class="login__input pass" placeholder="비밀번호"/>
        </div>
        <button type="button" class="login__submit">로그인</button>
        <p class="login__signup">계정이 없으신가요? &nbsp;<a href="#">회원가입</a></p>
      </div>
    </div>
    
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="../js/login_script.js"></script>

</body>
</html>


<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
	width:300px;
	margin: 0px auto;
}
</style>
</head>
<body>
	<div style="height:20px"></div>
	<div class="container">
	 <div class="row">
	  <table class="table">
	   <tr>
	    <th width=30% class="text-right danger">ID</th>
	    <td width=70%>
	     <input type=text name=id size=15 class="input-sm">
	    </td>
	   </tr>
	   <tr>
	    <th width=30% class="text-right danger">Password</th>
	    <td width=70%>
	     <input type=password name=pwd size=15 class="input-sm">
	    </td>
	   </tr>
	   <tr>
	    <td colspan="2" class="text-center">
	     <input type="button" value="로그인" class="btn btn-sm btn-success">
	     <input type="button" value="취소" class="btn btn-sm btn-info">
	    </td>
	   </tr>
	  </table>
	 </div>
	</div>
</body>
</html>
-->