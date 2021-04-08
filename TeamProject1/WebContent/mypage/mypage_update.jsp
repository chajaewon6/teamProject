<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Sign Up</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="../css/join_style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">


</script>

</head>
<body>
<!-- partial:index.partial.html -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>

      
      <form method=post action="../member/update_save.do" name="join_frm">
        <h1>회원가입</h1>
        
        <fieldset>
          <legend><span class="number">1</span>기본사항</legend>
          <label for="id">아이디</label>
         <input type=text name="id" id="id" class="input-sm" style="float:left" value="${id }" readonly>&nbsp;
      
          
          <label for="name">이름</label>
          <input type=text name="name" id="name" class="input-sm" value="${name }"readonly>
          
          <label for="pwd">비밀번호</label>
           <input type=password name="pwd" id="pwd" class="input-sm" style="float:left">
      	 <label for="pwd1">비밀번호&nbsp;확인</label>
     	   <input type=password name="pwd" id="pwd1" class="input-sm" style="float:left" placeholder="재입력">
          
          <label for="birthday">생년월일</label>
          <input type=date size="20" name="birthday" value="${birthday }">
          
           <label for="post">우편번호 &nbsp; &nbsp; <input type=button value="우편번호검색" class="btn btn-sm btn-primary" id="postBtn" ></label>
          
           <input type=text name="post" id="post" class="input-sm" size=10 value="${post }" readonly style="float: left">
      
          
           <label for="addr1">주소</label>
          <input type=text name="addr1" id="addr1" class="input-sm" size=45 value="${addr1 }" readonly>
          
            <label for="addr2">상세주소</label>
           <input type=text name="addr2" id="addr2" class="input-sm" value="${addr2 }" size=45>
          
           <label for="tel">전화번호</label>
			<input type=text name="tel" id="tel" class="input-sm" size=5 value="${tel }"
      			style="float: left">
          
           <label for="email">이메일</label>
            <input type=text name="email" id="email" class="input-sm" value="${email }" size=45>
             </fieldset>
             
             
         <legend><span class="number">2</span>추가사항</legend>
     		<fieldset>
	          <label for="bio">자기소개</label>
	          <textarea id="bio" name="user_bio" value="${content }" >${content }</textarea>
        </fieldset>
     
        <button type="submit" id="memberUpdateBtn">수정&nbsp;완료</button>
        <button type="button" onclick="javascript:history.back()" class="btn btn-sm btn-warning">취소</button >
      </form>
      
    </body>
</html>
<!-- partial -->
  
</body>
</html>
