<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 목록</title>
</head>
<body>
<a	href="/">Home</a>
<h1>글목록</h1>
<!-- 전체글목록 -->
	<div>
	<c:forEach var="list" items="${map.articleList}">
		<div> 
			글번호: ${list.articleNo }, 글제목: <a href="/articleContent?articleNo=${list.articleNo }">${list.articleTitle }</a>,
			글쓴이: ${list.articleWriter }, 날짜: ${list.articleDate}
		</div>
	</c:forEach>
</div>
<!-- 검색결과 글목록 -->
<div>
	<c:forEach var="searchList" items="${map.searchList}">
		<div> 
			글번호: ${searchList.articleNo }, 글제목: <a href="/articleContent?articleNo=${searchList.articleNo }">${searchList.articleTitle }</a>,
			글쓴이: ${searchList.articleWriter }, 날짜: ${searchList.articleDate}
		</div>
	</c:forEach>
</div>
<div>
	<form action="/articleSearch" method="post">
		<select name="searchOption">
			<option value="title">제목</option>
			<option value="writer">글쓴이</option>
		</select>
		<input type="text" name="search"/> <button>검색</button>
	</form>
	<div>
		<c:if test="${map.searchCheck != 1}">
			<a href="/articleList?nowPage=1"> [맨첨] </a>
			
			<c:if test="${map.pageHelper.movePage-limitLink > map.pageHelper.limitLink}">
				<a href="/articleList?nowPage=${map.pageHelper.movePage-map.pageHelper.limitLink}">[이전]</a>
			</c:if>
				
			<c:if test="${map.pageHelper.movePage <= map.pageHelper.limitLink}">
				[이전]
			</c:if>
			<c:forEach var="link" items="${map.pageHelper.linkPages}">
				<a href="/articleList?nowPage=${link}">[${link}]</a>
			</c:forEach>
			
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink < map.pageHelper.totalPage}">			
				<a href="/articleList?nowPage=${map.pageHelper.movePage+map.pageHelper.limitLink}">[다음]</a>
			</c:if>
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink > map.pageHelper.totalPage}">
				[다음]
			</c:if>
			
			<a href="/articleList?nowPage=${map.pageHelper.totalPage}"> [마지막] </a>
		</c:if>
		
		
		<c:if test="${map.searchCheck == 1}">
			<a href="/articleSearch?nowPage=1&search=${map.search}&searchOption=${map.searchOption}"> [맨첨] </a>
	<%-- 		<c:if test="${map.pageHelper.movePage-limitLink > map.pageHelper.limitLink}"> --%>
	<%-- 		</c:if> --%>
			
			<c:if test="${map.pageHelper.movePage-limitLink > map.pageHelper.limitLink}">
				<a href="/articleSearch?nowPage=${map.pageHelper.movePage-map.pageHelper.limitLink}&search=${map.search}&searchOption=${map.searchOption}">[이전]</a>
			</c:if>
			<c:if test="${map.pageHelper.movePage <= map.pageHelper.limitLink}">
				[이전]
			</c:if>
			<c:forEach var="link" items="${map.pageHelper.linkPages}">
				<a href="/articleSearch?nowPage=${link}&search=${map.search}&searchOption=${map.searchOption}">[${link}]</a>
			</c:forEach>
	<%-- 		<c:if test="${map.pageHelper.movePage+10 >= map.pageHelper.totalPage}"> --%>
	<%-- 		</c:if> --%>
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink <= map.pageHelper.totalPage}">			
				<a href="/articleSearch?nowPage=${map.pageHelper.movePage+map.pageHelper.limitLink}&search=${map.search}&searchOption=${map.searchOption}">[다음]</a>
			</c:if>
			
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink > map.pageHelper.totalPage}">
				[다음]
			</c:if>
			<a href="/articleSearch?nowPage=${map.pageHelper.totalPage}&search=${map.search}&searchOption=${map.searchOption}"> [마지막] </a>
		</c:if>
	</div>
	
</div>
</body>
</html>