<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a	href="/">Home</a>
	<h1>글쓰기</h1>
	<form action="/articleAdd" method="POST">
		<div>
			제목 : <input type="text" name="articleTitle" id="articleTitle" style="width:400px">
			글쓴이 : <input type="text" name="articleWriter" id="articleWriter"></div>
		<div>
		<!-- 내용 -->
			<textarea style="resize:none" name="articleContent" id="articleContent" rows="30" cols="120"></textarea>
		</div>
		<div>
			비밀번호 : <input type="password" name="articlePw" id="articlePw"/>
		</div>
		<button> 등록 </button>
	</form>
</body>
</html>