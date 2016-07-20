<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a	href="/">Home</a>
<h1>게시글 수정</h1>
	<form action="/updateArticle" method="POST">
		<div>
			<input type="hidden" name="articleNo" value="${articleUpdate.articleNo}">
			제목 : <input type="text" name="articleTitle" id="articleTitle"  value="${articleUpdate.articleTitle}" style="width:400px">
			글쓴이 : <input type="text" name="articleWriter" id="articleWriter" readonly="readonly" value="${articleUpdate.articleWriter}">
		</div>
		<div>
		<!-- 내용 -->
			<textarea style="resize:none" name="articleContent" id="articleContent" rows="30" cols="120">${articleUpdate.articleContent}</textarea>
		</div>
		<div>
			비밀번호 : <input type="password" name="articlePw" id="articlePw"/>
		</div>
		<input type="submit" value="등록"> 
	</form>
</body>
</html>