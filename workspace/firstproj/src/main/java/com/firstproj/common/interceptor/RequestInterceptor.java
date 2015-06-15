package com.firstproj.common.interceptor;

import java.util.Arrays;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class RequestInterceptor {
	
	final Log logger = LogFactory.getLog(this.getClass());
	
//	@Autowired
//	private TilesUrlBasedViewResolver tilesUrlBasedViewResolver;		
	
	/**
	 * 모든 controller에서 확장자를 통한 Tiles2 환경설정 
	 */
//	@Pointcut("execution(* com.firstproj..*Controller*.*(..))")
//	public void afterConfiguresController() {}

	 /**
	 * @brief		Tiles2 Controller의 리턴형태 결정을 위한  
	 * @details	
	 * @param 	joinPoint
	 * @return		
	 */

//	@After("afterConfiguresController()")
//	public void _beforeTilesConfigures(JoinPoint joinPoint) throws Exception {
//		String uri = null;
//		
//		tilesUrlBasedViewResolver.clearCache();
//		tilesUrlBasedViewResolver.setTilesDefinitionName("default");
//		
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
//		uri = request.getRequestURI();
//				
//		if(uri.indexOf(".page") > 0){
//			tilesUrlBasedViewResolver.clearCache();
//			tilesUrlBasedViewResolver.setTilesDefinitionName("default");
//		} else if(uri.indexOf(".pop") > 0){
//			tilesUrlBasedViewResolver.clearCache();
//			tilesUrlBasedViewResolver.setTilesDefinitionName("popup");
//	    } else {
//			tilesUrlBasedViewResolver.clearCache();
//			tilesUrlBasedViewResolver.setTilesDefinitionName("popup");        	
//	    }		
//	}	
	
    /**
     * 모든 controller호출에 대한 return log 위한 pointcut 선언
     */
    @Pointcut("execution(* com..*Controller*.*(..))")
    public void call4ControllerLog() {
    }

    /**
     * @brief 모든 controller의 호출에 대한 return log
     * @details
     * @param joinPoint
     * @return
     */
    @AfterReturning("call4ControllerLog()")
    public void _afterLog(JoinPoint joinPoint) throws Exception {       
        if (logger.isDebugEnabled()) {
            
            Signature signature = joinPoint.getSignature(); 
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = signature.getName();
            String stuff = signature.toString();
            String arguments = Arrays.toString(joinPoint.getArgs());
            
            logger.debug("################################################");
            logger.debug("call class:"
                    + className
                    + ", call method: "
                    + methodName
                    + ", arguments: "
                    + arguments
                    + "\nand the full toString: " + stuff);
        }
    }	
}
