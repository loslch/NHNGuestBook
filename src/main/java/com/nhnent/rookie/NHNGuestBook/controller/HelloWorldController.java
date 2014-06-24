package com.nhnent.rookie.NHNGuestBook.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloWorldController {

	@RequestMapping(value="/hello", method=RequestMethod.GET)
    public String hello(HttpServletRequest req, HttpServletResponse res) {
		String name = req.getParameter("name");
		req.setAttribute("name", name);
        
        return "helloworld";
    }

	@RequestMapping(value = "/json", method=RequestMethod.GET)
	public String login(HttpServletRequest req, HttpServletResponse res) {
		Map<String, String> result = new HashMap<String, String>();
		result.put("status", "success");
		result.put("message", "You have accessed servlet page.");

		JSONObject jsonResult = JSONObject.fromObject(result);
		req.setAttribute("output", jsonResult);
		return "output";
	}
}
