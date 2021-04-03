<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
		<div class="col-lg-4">
                            <div class="header-info-right f-right">
                                <ul class="header-social">    
                                    <li><a href="#" id="login">로그인</a></li>
                                    <li><a href="../member/join.do">회원가입</a></li>
                                </ul>
                            </div>
                        </div>
	
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="post" action="../member/logout_ok.jsp">
		<table class="table">
			<tr>
				<td>
					{$ name}
				</td>
			</tr>
			
		</table>
	</form>

</body>
</html>