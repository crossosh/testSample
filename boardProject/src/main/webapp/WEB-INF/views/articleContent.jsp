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
// 				console.log(i+"클릭");
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
				글제목 : ${articleContent.articleTitle} 				
			</div>
			<div>
				작성자 : ${articleContent.articleWriter}
			</div>
			<div align="center">
				작성일 : ${articleContent.articleDate}
			</div>
			<div>
			<textarea rows="30" cols="132" style="resize:none" readonly="readonly">${articleContent.articleContent}</textarea>
				
			</div>
			<div>
				<a href="/updateArticle?articleNo=${articleContent.articleNo}">수정</a><a href="/deleteArticle?articleNo=${articleContent.articleNo}">삭제</a><a href="/articleList">목록</a>
			</div>
		</div>

		<div>
			<form action="/insertComment" method="POST">
				<div>
					<input type="hidden" name="articleNo" value="${articleContent.articleNo}">
				</div>
				<div>
					댓글 : <input type="text" name=commentContent>
				</div>
				<div>
					작성자 : <input type="text" name="commentWriter">
				</div>
				<div>
					비밀번호 : <input type="password" name="commentPw">
				</div>
				<input type="submit" value="입력">				
			</form>
		</div>
		<c:forEach var="c" items="${map.commentList}">
			<div>
				작성일 : ${c.commentDate}
			</div>
			<div>
				<div>

					<div>
						작성자 : ${c.commentWriter} 
					</div>
					
					<form action="/updateComment" method="POST">
						<div>
							내용 : <input type="text" name="commentContent" value="${c.commentContent}">
						</div>
						<div>
							<input type="hidden" name="articleNo" value="${c.articleNo}">
							<input type="hidden" name="commentNo" value="${c.commentNo}">
							비밀번호 : <input type="password" name="commentPw">
							<input type="submit" value="수정">
						</div>
					</form>
					
				</div>
			
				<div>
					<form action="/deleteComment" method="post">
						<input type="hidden" name="articleNo" value="${c.articleNo}">
						<input type="hidden" name="commentNo" value="${c.commentNo}">
						비밀번호 : <input type="password" name="commentPw">
						<input type="submit" value="삭제">
					</form>
				</div>
			</div>
		</c:forEach>

			<a href="/articleContent?nowPage=1&articleNo=${articleContent.articleNo}"> [맨첨] </a>
			
			<c:if test="${map.pageHelper.movePage-limitLink > map.pageHelper.limitLink}">
				<a href="/articleContent?nowPage=${map.pageHelper.movePage-map.pageHelper.limitLink}&articleNo=${articleContent.articleNo}">[이전]</a>
			</c:if>
				
			<c:if test="${map.pageHelper.movePage <= map.pageHelper.limitLink}">
				[이전]
			</c:if>
			<c:forEach var="link" items="${map.pageHelper.linkPages}">
				<a href="/articleContent?nowPage=${link}&articleNo=${articleContent.articleNo}">[${link}]</a>
			</c:forEach>
			
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink <= map.pageHelper.totalPage}">			
				<a href="/articleContent?nowPage=${map.pageHelper.movePage+map.pageHelper.limitLink}&articleNo=${articleContent.articleNo}">[다음]</a>
			</c:if>
			<c:if test="${map.pageHelper.movePage+map.pageHelper.limitLink > map.pageHelper.totalPage}">
				[다음]
			</c:if>
			
			<a href="/articleContent?nowPage=${map.pageHelper.totalPage}&articleNo=${articleContent.articleNo}"> [마지막] </a>

	</div>
</body>
</html>