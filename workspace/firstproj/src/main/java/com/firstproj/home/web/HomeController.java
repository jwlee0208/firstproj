package com.firstproj.home.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/")
public class HomeController {
	@RequestMapping(value="/home.page")
	public String goHome() throws Exception{
		return "home";
	}
}
