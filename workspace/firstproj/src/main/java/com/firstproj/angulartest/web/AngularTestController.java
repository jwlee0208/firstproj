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
	
	/**
	 * <pre>
	 * 1. MethodName	: test7
	 * 2. ClassName		: AngularTestController
	 * 3. Comment		: Creating our panel controller
	 * 4. 작성자			: leejinwon
	 * 5. 작성일			: 2014. 6. 25. 오후 12:44:51
	 * </pre>
	 *   @return
	 *   @return String
	 */
	@RequestMapping(value="/test07.page")
	public String test7(){
		return "angularTest/test07";
	}
	
	/**
	 * <pre>
	 * 1. MethodName	: test8
	 * 2. ClassName		: AngularTestController
	 * 3. Comment		: Writing out our Review Form
	 * 4. 작성자			: leejinwon
	 * 5. 작성일			: 2014. 6. 25. 오후 4:59:33
	 * </pre>
	 *   @return
	 *   @return String
	 */
	@RequestMapping(value="/test08.page")
	public String test8(){
		return "angularTest/test08";
	}
	/**
	 * <pre>
	 * 1. MethodName	: test9
	 * 2. ClassName		: AngularTestController
	 * 3. Comment		: Creating the Review Controller
	 * 4. 작성자			: leejinwon
	 * 5. 작성일			: 2014. 6. 25. 오후 5:00:16
	 * </pre>
	 *   @return
	 *   @return String
	 */
	@RequestMapping(value="/test09.page")
	public String test9(){
		return "angularTest/test09";
	}
	/**
	 * <pre>
	 * 1. MethodName	: test10
	 * 2. ClassName		: AngularTestController
	 * 3. Comment		: Now with validation
	 * 4. 작성자			: leejinwon
	 * 5. 작성일			: 2014. 6. 25. 오후 5:00:16
	 * </pre>
	 *   @return
	 *   @return String
	 */
	@RequestMapping(value="/test10.page")
	public String test10(){
		return "angularTest/test10";
	}

	/**
	 * 
	 * <pre>
	 * 1. MethodName	: test11
	 * 2. ClassName		: AngularTestController
	 * 3. Comment		: Decluttering our Code
	 * 4. 작성자			: leejinwon
	 * 5. 작성일			: 2014. 7. 4. 오후 4:05:03
	 * </pre>
	 *   @return
	 *   @return String
	 */
	@RequestMapping(value="/test11.page")
	public String test11(){
		return "angularTest/test11";
	}

	@RequestMapping(value="/product-title.page")
	public String productTitle(){
		return "angularTest/common/product-title";
	}

	@RequestMapping(value="/product-images.page")
	public String productImages(){
		return "angularTest/common/product-images";
	}

	@RequestMapping(value="/product-description.page")
	public String productDescription(){
		return "angularTest/common/product-description";
	}

	@RequestMapping(value="/product-specification.page")
	public String productSpecification(){
		return "angularTest/common/product-specification";
	}

	@RequestMapping(value="/product-review.page")
	public String productReview(){
		return "angularTest/common/product-review";
	}
	
	@RequestMapping(value="/product-panels.page")
	public String productPanels(){
		return "angularTest/common/product-panels";
	}
}


