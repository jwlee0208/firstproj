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
	@RequestMapping(value="/test03.page")
	public String test3(){
		return "angularTest/test03";		
	}
	@RequestMapping(value="/test04.page")
	public String test4(){
		return "angularTest/test04";		
	}
	
	/**
	 * <pre>
	 * 1. MethodName	: test5
	 * 2. ClassName		: AngularTestController
	 * 3. Comment		: Using ng-src for images
	 * 4. 작성자			: leejinwon
	 * 5. 작성일			: 2014. 6. 25. 오전 10:48:27
	 * </pre>
	 *   @return
	 *   @return String
	 */
	@RequestMapping(value="/test05.page")
	public String test5(){
		return "angularTest/test05";		
	}
	
	/**
	 * 
	 * <pre>
	 * 1. MethodName	: test6
	 * 2. ClassName		: AngularTestController
	 * 3. Comment		: A simple set of tabs
	 * 4. 작성자			: leejinwon
	 * 5. 작성일			: 2014. 6. 25. 오전 11:30:48
	 * </pre>
	 *   @return
	 *   @return String
	 */
	@RequestMapping(value="/test06.page")
	public String test6(){
		return "angularTest/test06";		
	}
	
	
}


