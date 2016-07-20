<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script>
// 	$(document).ready(function() {
// 		var btn = $('.updateCommentBtn');
		
// 		for(var i=0; i < btn.length; i++){
// 			$(btn[i]).click(function(){
// 				console.log(i+"Ŭ��");
// 			});
// 		}
		
		
		
// 	});
</script>
</head>
<body>
<a	href="/">Home</a>
<h1>ArticleContent</h1>
	<div>
		<div>
			<div>
				������ : ${articleContent.articleTitle} 				
			</div>
			<div>
				�ۼ��� : ${articleContent.articleWriter}
			</div>
			<div align="center">
				�ۼ��� : ${articleContent.articleDate}
			</div>
			<div>
			<textarea rows="30" cols="132" style="resize:none" readonly="readonly">${articleContent.articleContent}</textarea>
				
			</div>
			<div>
				<a href="/updateArticle?articleNo=${articleContent.articleNo}">����</a><a href="/deleteArticle?articleNo=${articleContent.articleNo}">����</a><a href="/articleList">���</a>
			</div>
		</div>

		<div>
			<form action="/insertComment" method="POST">
				<div>
					<input type="hidden" name="articleNo" value="${articleContent.articleNo}">
				</div>
				<div>
					��� : <input type="text" name=commentContent>
				</div>
				<div>
					�ۼ��� : <input type="text" name="commentWriter">
				</div>
				<div>
					��й�ȣ : <input type="password" name="commentPw">
				</div>
				<input type="submit" value="�Է�">				
			</form>
		</div>
		<c:forEach var="c" items="${map.commentList}">
			<div>
				�ۼ��� : ${c.commentDate}
			</div>
			<div>
				<div>

					<div>
						�ۼ��� : ${c.commentWriter} 
					</div>
					
					<form action="/updateComment" method="POST">
						<div>
							���� : <input type="text" name="commentContent" value="${c.commentContent}">
						</div>
						<div>
							<input type="hidden" name="articleNo" value="${c.articleNo}">
							<input type="hidden" name="commentNo" value="${c.commentNo}">
							��й�ȣ : <input type="password" name="commentPw">
							<input type="submit" value="����">
						</div>
					</form>
					
				</div>
			
				<div>
					<form action="/deleteComment" method="post">
						<input type="hidden" name="articleNo" value="${c.articleNo}">
						<input type="hidden" name="commentNo" value="${c.commentNo}">
						��й�ȣ : <input type="password" name="commentPw">
						<input type="submit" value="����">
					</form>
				</div>
			</div>
		</c:forEach>

			<a href="/articleContent?nowPage=1&articleNo=${articleContent.articleNo}"> [��÷] </a>
			
			<c:if test="${map.pageHelper.movePage-limitLink > map.pageHelper.limitLink}">
				<a href="/articleContent?nowPage=${map.pageHelper.movePage-map.pageHelper.limitLink}&articleNo=${articleContent.articleNo}">[����]</a>
			</c:if>
				
			<c:if test="${map.pageHelper.movePage <= map.pageHelper.limitLink}">
				[����]
			</c:if>
			<c:forEach var="link" items="${map.pageHelper.linkPages}">
				<a href="/articleContent?nowPage=${link}&articleNo=${articleContent.articleNo}">[${link}]</a>
			</c:forEach>
			
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink <= map.pageHelper.totalPage}">			
				<a href="/articleContent?nowPage=${map.pageHelper.movePage+map.pageHelper.limitLink}&articleNo=${articleContent.articleNo}">[����]</a>
			</c:if>
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink > map.pageHelper.totalPage}">
				[����]
			</c:if>
			
			<a href="/articleContent?nowPage=${map.pageHelper.totalPage}&articleNo=${articleContent.articleNo}"> [������] </a>

	</div>
</body>
</html>