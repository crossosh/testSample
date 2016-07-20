package com.cafe24.ksmart02.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.ksmart02.model.Article;
import com.cafe24.ksmart02.model.PageHelper;
import com.cafe24.ksmart02.repository.ArticleDaoImpl;
import com.cafe24.ksmart02.repository.CommentDaoImpl;

@Service
public class ArticleServiceImpl {

	@Autowired
	private ArticleDaoImpl articleDao;
	
	@Autowired
	private CommentDaoImpl commentDao;
	

	@Transactional
	public int deleteArticleService(Map<String,Object> map) {
		
		
		commentDao.deleteArticleComment(map);
		
		int result = articleDao.deleteArticle(map);
		
		
		return result;
	}
	
	
	public Article artilcleContentService(int articleNo){
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("articleNo", articleNo);
		
		return articleDao.selectArticleContent(articleNo);
	}
	
	
	public Map<String, Object> selectArticleService(int nowPage,int limitList,int limitLink,int movePage) {
		int totalList = articleDao.selectArticleTotalCount();
		PageHelper pageHelper = new PageHelper(nowPage,totalList,limitList,limitLink,movePage);
		List<Article> articleList = articleDao.selectArticleList(pageHelper);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("articleList", articleList);
		map.put("pageHelper", pageHelper);

		
		return map;
	}


	public Map<String, Object> selectArticleSearchService(String search, String searchOption,int nowPage,int limitList,int limitLink,int movePage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("searchOption", searchOption);
		int totalList 				= articleDao.searchArticleTotalCount(map);
		PageHelper pageHelper 		= new PageHelper(nowPage,totalList,limitList,limitLink,movePage);
		
		map.put("pageHelper", pageHelper);
		
		List<Article> searchList 	= articleDao.selectArticleSearch(map);
		
		
		map.put("searchList", searchList);
		map.put("searchCheck", 1);//체크하기위해
		return map;
	}
	public void insertArticleService(Article article) {
		articleDao.insertArticle(article);
		
	}
	
	public int updateArticleService(Article article){
		return articleDao.updateArticle(article);
	}
	
}
