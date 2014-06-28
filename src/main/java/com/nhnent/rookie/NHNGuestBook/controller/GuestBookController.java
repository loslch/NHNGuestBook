package com.nhnent.rookie.NHNGuestBook.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GuestBookController {

	@RequestMapping(value = "/json", method=RequestMethod.GET)
	public String json(HttpServletRequest req, HttpServletResponse res) {
		Map<String, String> result = new HashMap<String, String>();
		result.put("status", "success");
		result.put("message", "You have accessed servlet page.");

		JSONObject jsonResult = JSONObject.fromObject(result);
		req.setAttribute("output", jsonResult);
		res.setContentType("application/json; charset=UTF-8");
		res.setCharacterEncoding("UTF-8");
		try {
			res.getWriter().write(jsonResult.toString());
			res.flushBuffer();
			res.setStatus(HttpServletResponse.SC_OK);
		} catch (IOException e) {
			res.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
		}
		return null;
	}
}
