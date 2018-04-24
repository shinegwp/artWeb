package com.art.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.art.service.UserService;

@Controller
public class PageController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String showIndex() {
		userService.userJedisTest();
		return "index";
	}

	@RequestMapping("/{page}")
	public String showpage(@PathVariable String page) {
		return page;
	}
	
}
