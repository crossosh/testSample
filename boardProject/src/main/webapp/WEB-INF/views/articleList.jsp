<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���</title>
</head>
<body>
<a	href="/">Home</a>
<h1>�۸��</h1>
<!-- ��ü�۸�� -->
	<div>
	<c:forEach var="list" items="${map.articleList}">
		<div> 
			�۹�ȣ: ${list.articleNo }, ������: <a href="/articleContent?articleNo=${list.articleNo }">${list.articleTitle }</a>,
			�۾���: ${list.articleWriter }, ��¥: ${list.articleDate}
		</div>
	</c:forEach>
</div>
<!-- �˻���� �۸�� -->
<div>
	<c:forEach var="searchList" items="${map.searchList}">
		<div> 
			�۹�ȣ: ${searchList.articleNo }, ������: <a href="/articleContent?articleNo=${searchList.articleNo }">${searchList.articleTitle }</a>,
			�۾���: ${searchList.articleWriter }, ��¥: ${searchList.articleDate}
		</div>
	</c:forEach>
</div>
<div>
	<form action="/articleSearch" method="post">
		<select name="searchOption">
			<option value="title">����</option>
			<option value="writer">�۾���</option>
		</select>
		<input type="text" name="search"/> <button>�˻�</button>
	</form>
	<div>
		<c:if test="${map.searchCheck != 1}">
			<a href="/articleList?nowPage=1"> [��÷] </a>
			
			<c:if test="${map.pageHelper.movePage-limitLink > map.pageHelper.limitLink}">
				<a href="/articleList?nowPage=${map.pageHelper.movePage-map.pageHelper.limitLink}">[����]</a>
			</c:if>
				
			<c:if test="${map.pageHelper.movePage <= map.pageHelper.limitLink}">
				[����]
			</c:if>
			<c:forEach var="link" items="${map.pageHelper.linkPages}">
				<a href="/articleList?nowPage=${link}">[${link}]</a>
			</c:forEach>
			
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink < map.pageHelper.totalPage}">			
				<a href="/articleList?nowPage=${map.pageHelper.movePage+map.pageHelper.limitLink}">[����]</a>
			</c:if>
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink > map.pageHelper.totalPage}">
				[����]
			</c:if>
			
			<a href="/articleList?nowPage=${map.pageHelper.totalPage}"> [������] </a>
		</c:if>
		
		
		<c:if test="${map.searchCheck == 1}">
			<a href="/articleSearch?nowPage=1&search=${map.search}&searchOption=${map.searchOption}"> [��÷] </a>
	<%-- 		<c:if test="${map.pageHelper.movePage-limitLink > map.pageHelper.limitLink}"> --%>
	<%-- 		</c:if> --%>
			
			<c:if test="${map.pageHelper.movePage-limitLink > map.pageHelper.limitLink}">
				<a href="/articleSearch?nowPage=${map.pageHelper.movePage-map.pageHelper.limitLink}&search=${map.search}&searchOption=${map.searchOption}">[����]</a>
			</c:if>
			<c:if test="${map.pageHelper.movePage <= map.pageHelper.limitLink}">
				[����]
			</c:if>
			<c:forEach var="link" items="${map.pageHelper.linkPages}">
				<a href="/articleSearch?nowPage=${link}&search=${map.search}&searchOption=${map.searchOption}">[${link}]</a>
			</c:forEach>
	<%-- 		<c:if test="${map.pageHelper.movePage+10 >= map.pageHelper.totalPage}"> --%>
	<%-- 		</c:if> --%>
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink <= map.pageHelper.totalPage}">			
				<a href="/articleSearch?nowPage=${map.pageHelper.movePage+map.pageHelper.limitLink}&search=${map.search}&searchOption=${map.searchOption}">[����]</a>
			</c:if>
			
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink > map.pageHelper.totalPage}">
				[����]
			</c:if>
			<a href="/articleSearch?nowPage=${map.pageHelper.totalPage}&search=${map.search}&searchOption=${map.searchOption}"> [������] </a>
		</c:if>
	</div>
	
</div>
</body>
</html>