<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Wellcome to my KINGDOM
</h1>
<p>I am SungHyeonOh , nice meet you, have you nice today~</p>

<P>  The time on the server is ${serverTime}. </P>
<a href="/articleAdd">글쓰기</a>
<a href="/articleList">글 목록 보기</a>
<a href="http://blog.naver.com/crossosh">블로그가기</a>
</body>
</html>
