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

package com.firstproj.angulartest.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="angular/")
public class AngularTestController {
	@RequestMapping(value="/test01.page")
	public String test(){
		return "angularTest/test01";
	}
	@RequestMapping(value="/test02.page")
	public String test2(){
		return "angularTest/test02";		
	}
}


