package com.nhnent.rookie.NHNGuestBook.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
    
    private final String selectAllSQL =
    	"SELECT [no], email, body, regtime, modtime "
    	+ "FROM articles;";
    private final String selectOneSQL = 
    	"SELECT [no], email, body, regtime, modtime "
    	+ "FROM articles "
    	+ "WHERE [no] = ?;";
    private final String insertSQL =
		"INSERT INTO articles "
    	+ "( [no], email, [password], body, regtime, modtime ) VALUES " 
		+ "( NULL, ?, MD5(?), ?, NOW(), NOW() );";
    private final String updateSQL =
        "UPDATE articles SET "
        + "[no]=?, email='?', [password]=MD5('?'), body='?', modtime=NOW() "
        + "WHERE [no]=? and [password]=MD5('?');";
    
	@RequestMapping(method=RequestMethod.GET)
	public @ResponseBody ResponseMessage getArticles() {
		ResponseMessage msg = new ResponseMessage();
    	List<Article> articles = new ArrayList<Article>();
    			
	    try {
	        Context initCtx = new InitialContext();
	        Context envCtx = (Context)initCtx.lookup("java:/comp/env");
	        DataSource ds = (DataSource)envCtx.lookup("jdbc/CUBRIDDS");
	        conn = ds.getConnection();
	        
	        pstmt = conn.prepareStatement(selectAllSQL);
	        rs = pstmt.executeQuery();
	        
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
	        if (pstmt != null) try {pstmt.close(); } catch (Exception ex3) {}
	        if (conn != null) try {conn.close(); } catch (Exception ex4) {}
	    }
		
		return msg;
	}

	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody ResponseMessage postArticle(@RequestBody final Article article) {
		ResponseMessage msg = new ResponseMessage();
		
		if (!isValidEmailAddress(article.getEmail())) {
			msg.setStatus("fail");
			msg.setMessage("Invalid Email Address!");
			return msg;
		}
    			
	    try {
	        Context initCtx = new InitialContext();
	        Context envCtx = (Context)initCtx.lookup("java:/comp/env");
	        DataSource ds = (DataSource)envCtx.lookup("jdbc/CUBRIDDS");        
	        conn = ds.getConnection();
	        conn.setAutoCommit(false);
	        
	        pstmt = conn.prepareStatement(insertSQL);
	        pstmt.setString(1, article.getEmail());
	        pstmt.setString(2, article.getPassword());
	        pstmt.setString(3, article.getBody());
	        pstmt.executeUpdate();
	        conn.commit();

			msg.setStatus("success");
			msg.setMessage("Your message has been successfully submitted.");
	    } catch(Exception ex) {
	        ex.printStackTrace();
			msg.setStatus("fail");
			msg.setMessage("Something went wrong!");
	        if (conn != null) {
	            try {
	                System.err.println("Transaction is being rolled back");
	                conn.rollback();
	            } catch(SQLException excep) {}
	        }
	    } finally {
	        if (rs != null) try {rs.close(); } catch (Exception ex2) {}
	        if (pstmt != null) try {pstmt.close(); } catch (Exception ex3) {}
	        if (conn != null) try {conn.setAutoCommit(true); conn.close(); }
	        catch (Exception ex4) {}
	    }
		
		return msg;
	}

	@RequestMapping(value="/{no}", method=RequestMethod.GET)
	public String getArticle(@PathVariable int name) {
		return null;
	}
	
	public boolean isValidEmailAddress(String email) {
		String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(email);
		return m.matches();
	}
}
