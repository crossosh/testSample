package com.cafe24.ksmart02.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.ksmart02.model.Comment;

@Repository
public class CommentDaoImpl implements CommentDao{

	private final String NS ="com.cafe24.ksmart02.repository.commentMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionCom;
	
	/**
	 * 댓글 전체리스트 출력!!
	 * @param map
	 * @return
	 */
	public List<Comment> selectCommentList(Map<String, Object> map){
		return sqlSessionCom.selectList(NS+".selectCommentList", map);
	};
	
	public int selectCommentListCount(int articleNo){
		return sqlSessionCom.selectOne(NS+".selectCommentListCount",articleNo);
	}
	/**
	 * 댓글 삭제 or 수정시 비밀번호 체크
	 * @param commentNo
	 * @return
	 */
	public Comment selectCommentPw(int commentNo){
		return sqlSessionCom.selectOne(NS+".selectCommentPw", commentNo);
	}
	/**
	 * 댓글입력
	 * @param comment
	 * @return
	 */
	public int insertComment(Comment comment){
		return sqlSessionCom.insert(NS+".insertComment", comment);
	}
	/**
	 * 댓글수정
	 * @param comment
	 * @return
	 */
	public int updateComment(Comment comment){
		return sqlSessionCom.update(NS+".updateComment", comment);
	}
	/**
	 * 댓글삭제
	 * @param commentNo
	 * @return
	 */
	public int deleteComment(int commentNo){
		return sqlSessionCom.delete(NS+".deleteComment", commentNo);
	}
	
	public int deleteComment(Map map) {
		System.out.println("CommentDaoImpl deleteComment");
		System.out.println("CommentDaoImpl : " + map);
		return sqlSessionCom.delete(NS+".deleteComment", map);
	}
	public int deleteArticleComment(Map map) {
		System.out.println("CommentDaoImpl deleteComment");
		System.out.println("CommentDaoImpl : " + map);
		return sqlSessionCom.delete(NS+".deleteArticleComment", map);
	}
	

	
	
	
}
