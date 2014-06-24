/**
 * 1. FileName	: TestController.java
 * 2. Package	: com.fikrstproj.test.web
 * 3. Comments	: 	
 * 4. Author	: leejinwon
 * 5. DateTime	: 2014. 6. 24. 오전 10:44:45
 * 6. History	:
 * -----------------------------------------------------------------
 *	Date		 |	Name			|	Comment
 * -------------  -----------------   ------------------------------
 * 2014. 6. 24.		 | leejinwon			|	최초작성
 * -----------------------------------------------------------------
 **/

package com.firstproj.test.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping(value="/test")
	public String test(){
		return "test";
	}
}


