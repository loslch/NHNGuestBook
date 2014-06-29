package com.nhnent.rookie.NHNGuestBook.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nhnent.rookie.NHNGuestBook.model.Article;
import com.nhnent.rookie.NHNGuestBook.model.ResponseMessage;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
    Statement stmt = null;
    ResultSet rs = null;
    Connection conn = null;
    
	@RequestMapping(method=RequestMethod.GET)
	public @ResponseBody ResponseMessage getArticles() {
		ResponseMessage msg = new ResponseMessage();
    	List<Article> articles = new ArrayList<Article>();
    			
	    try {
	        Context initCtx = new InitialContext();
	        Context envCtx = (Context)initCtx.lookup("java:/comp/env");
	        DataSource ds = (DataSource)envCtx.lookup("jdbc/CUBRIDDS");        
	        conn = ds.getConnection();
	        
	        String sQuery = "select [no], email, body, regtime, modtime from articles";
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(sQuery);
	        
			while (rs.next()) {
				Article article = new Article();
				article.setNo(rs.getLong(1));
				article.setEmail(rs.getString(2));
				article.setBody(rs.getString(3));
				article.setRegtime(rs.getTimestamp(4));
				article.setModtime(rs.getTimestamp(5));
				articles.add(article);
			}

			msg.setStatus("success");
			msg.setArticles(articles);
	    } catch(Exception ex) {
	        ex.printStackTrace();
			msg.setStatus("fail");
			msg.setMessage("Something went wrong!");
	    } finally {
	        if (rs != null) try {rs.close(); } catch (Exception ex2) {}
	        if (stmt != null) try {stmt.close(); } catch (Exception ex3) {}
	        if (conn != null) try {conn.close(); } catch (Exception ex4) {}
	    }
		
		return msg;
	}

	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody ResponseMessage postArticle(@RequestBody final Article article) {
		ResponseMessage msg = new ResponseMessage();
		msg.setStatus("success");
		msg.setMessage("Your message has been successfully submitted.");
		
		return msg;
	}

	@RequestMapping(value="/{no}", method=RequestMethod.GET)
	public String getArticle(@PathVariable int name) {
		return null;
	}
}
