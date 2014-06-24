package com.nhnent.rookie.NHNGuestBook.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloWorldController { 

	@RequestMapping(value="/hello", method = RequestMethod.GET)
    public String hello(HttpServletRequest req, HttpServletResponse res) {
		String name = req.getParameter("name");
		req.setAttribute("name", name);
        
        return "helloworld";
    }

}
