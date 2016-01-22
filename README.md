firstproj
=========

1. Master


2. Developer


3. Feature

3.1. editorFileUpload

3.2. jQuery_validate

3.3. login

3.4. lucene

3.5. map

3.6. redis_N_jedis_jwlee0208
----------------------------
3.6.1. 1st commit
----------------------------
3.6.1.1. Contents 
----------------------------
3.6.1.1.1. Installation redis
----------------------------
3.6.1.1.1.1. Go to http://redis.io/download , download and execute to install redis

3.6.1.1.1.2. Set about redis into pom.xml(maven dependency) and update maven dependency following this : 

3.6.1.1.1.2.1. Set about redis into pom.xml

		<!-- redis -->
		<dependency>
			<groupId>redis.clients</groupId>
			<artifactId>jedis</artifactId>
			<version>2.5.2</version>
		</dependency>
		<!-- spring-data-redis -->
		<dependency>
			<groupId>org.springframework.data</groupId>
			<artifactId>spring-data-redis</artifactId>
			<version>1.4.0.RELEASE</version>
		</dependency>


3.6.1.1.2. Update maven dependency
--------------------------------
if you use to eclipse, 
- Select to project
- Click to right mouse
- Select 'Maven > Update Project'

3.6.1.1.3. Create to redis_config.xml into "src/main/resources/spring" directory following this : 
------------------------------------------------------------------------------------------------
<code>
<beans xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xmlns:p="http://www.springframework.org/schema/p"
		xmlns:context="http://www.springframework.org/schema/context"
		xsi:schemaLocation="
			http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
			http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
			http://www.springframework.org/schema/cache http://www.springframework.org/schema/cache/spring-cache.xsd">
		 
		 <bean id="redisPoolConfig" class="redis.clients.jedis.JedisPoolConfig">
		 	<property name="minIdle" value="1"></property>
		 	<property name="maxIdle" value="30"></property>
		 	<property name="maxTotal" value="30"></property>
		 	<property name="maxWaitMillis" value="10000"></property>
		 	<property name="testOnBorrow" value="true"></property>
		 </bean>
		  
		 <bean id="connectionFactory" class="org.springframework.data.redis.connection.jedis.JedisConnectionFactory">
		 	<property name="hostName" value="127.0.0.1"></property>
		 	<property name="port" value="6379"></property>
		 	<property name="password" value="123456"></property>
		 	<property name="usePool" value="yes"></property> 
		 	<property name="poolConfig" ref="redisPoolConfig"></property>		 	
		 	 <property name="database" value="0"></property><!-- default 0 디비  dao영역에서 index 값 파라메터로 던져서 실시간으로 변경 감지 가능함.-->
		 </bean>
		 <!-- 
		<bean id="redisTemplate" class="org.springframework.data.redis.core.StringRedisTemplate"  p:connection-factory-ref="connectionFactory"/>	
		 -->
		 
<!-- 		<bean id="redisTemplate" class="org.springframework.data.redis.core.StringRedisTemplate"> -->
<!-- 			<property name="connectionFactory" ref="connectionFactory"></property> -->
<!-- 		</bean> -->
		
			 
		<!-- redisTemplate 사용할 경우 아래 주석풀고 사용 -->
		
		<bean id="redisTemplate" class="org.springframework.data.redis.core.RedisTemplate">
		    <property name="connectionFactory" ref="connectionFactory" />
		</bean>
		 
</beans>			
</code>

3.6.1.1.4. Import redis-config.xml into application-config.xml following this : 
------------------------------------------------------------------------------------------------

	<import resource = "classpath:spring/redis-config.xml" />


3.6.1.1.5. Create to java source
--------------------------------
3.6.1.1.5.1. Into BoardArticleController.java

	// spring-data-redis 사용.
	@Autowired
	private RedisTemplate<String, List<BoardArticleDto>> redisTemplate;
	// spring-data-redis 사용.
	@Resource(name="redisTemplate")
	private ValueOperations<String, List<BoardArticleDto>> valueOps;

	/**
	 * 게시글 목록 조회
	 * @param request
	 * @param model
	 * @param boardArticleDto
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list.page", method = {RequestMethod.POST, RequestMethod.GET})
	public String getBoardList(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception {
		model = this.getBoardCommonListForJson(request, model, boardArticleDto);
		
		String page = "board/article/list";
		
		if(boardArticleDto.getBoardId() == 1){
			page = "board/article/imageList";
		}else if(boardArticleDto.getBoardId() == 2){
			page = "board/article/imageList2";
		}
		
		return page;
	}

	private Model getBoardCommonListForJson(HttpServletRequest request, Model model, BoardArticleDto boardArticleDto) throws Exception{
		// 검색 조건
		String searchCondition = request.getParameter("searchCondition");
		String searchText = request.getParameter("searchText");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		int boardId = boardArticleDto.getBoardId();
		
		int pageNo = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;

		int listRowCnt = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		// searching condition setting
		paramMap.put("boardId", boardId);
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchText", searchText);
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);

		List<BoardArticleDto> boardArticleList;	
		int totalListCnt = 0;

		try{
			
			boardArticleList = valueOps.get("selectBoardArticle"+boardId+"ListAll");
			totalListCnt = boardArticleList.size();
			
			System.out.println(">>> redis pagedList print");
			
		}catch(Exception e){
			BoardArticleDto boardArticleObj = new BoardArticleDto();
			boardArticleObj.setBoardId(boardId);
			
			boardArticleList = boardArticleService.getBoardArticleList(boardArticleObj);
			totalListCnt = boardArticleList.size();	
			
			valueOps.set("selectBoardArticle"+boardId+"ListAll", boardArticleList);
			
			System.out.println(">>> redis pagedList setted");
			
			model = this.getBoardCommonList(request, model, boardArticleDto);
			
			return model;
			
		}finally{
			
		}
		
		int startRow = (pageNo - 1) * listRowCnt;
		int endRow 	 = pageNo * listRowCnt;
		
		List<BoardArticleDto> pagedArticleList = new ArrayList<BoardArticleDto>();
		
		if(null != boardArticleList){
			BoardArticleDto boardArticleObj;
			for(int i = 0; i < boardArticleList.size() ; i++){
				
				if((startRow - 1) <= i && i <= (endRow - 1)){					
					boardArticleObj = boardArticleList.get(i);
					pagedArticleList.add(boardArticleObj);
				}
			}
		}
		
		PagedList pagedList = new PagedList(pagedArticleList, pageNo, 10, totalListCnt, startRow, endRow, listRowCnt);
		
		System.out.println("pagedList Data : " + pagedList.toString());		
		
		model.addAttribute("pagedResult", pagedList);
		model.addAttribute("boardId", boardId);
		
		return model;
	}



* This code is just for checking out to spring-data-redis. 
* I think it'll be better to create mvc pattern and to create source each class.  

3.6.1.1.6. Build to project
--------------------------------

3.6.1.1.7. Set to redis sentinel & Start to redis
----------------------------------------------------------------
* I tested using redis sentinel for master/slave monitoring and syncronize to data into 1 server(local : 127.0.0.1)

3.6.1.1.7.1. Set to redis sentinel
Ref.] http://megnetsun.tistory.com/entry/Redis-Master-Slave-server-%EC%84%A4%EC%A0%95%EC%9E%A1%EA%B8%B0-Sentinel-tool%EB%A1%9C-%EB%AA%A8%EB%8B%88%ED%84%B0%EB%A7%81-%ED%95%98%EA%B8%B0

3.6.1.1.7.1.1. Create to redis-master.conf

slave-server-stale-data yes
requirepass 123456


3.6.1.1.7.1.2. Create to redis-slave.conf

slaveof 127.0.0.1 6379
masterauth 123456
repl-ping-slave-period 10
repl-timeout 60 


3.6.1.1.7.1.3. Modify to sentinel.conf

sentinel monitor mymaster 127.0.0.1 6379 1    
sentinel auth-pass mymaster 123456            
sentinel can-failover mymaster yes            
sentinel parallel-syncs mymaster 1            


3.6.1.1.7.1.4. Startup redis 
3.6.1.1.7.1.4.1. Startup master redis

./src/redis-server redis-master.conf &


3.6.1.1.7.1.4.2. Startup slave redis

./src/redis-server redis-slave.conf &


3.6.1.1.7.1.4.3. Startup Sentinel

$ ./redis-server ../sentinel.conf --sentinel


3.6.1.1.8. Startup Tomcat Server
--------------------------------


3.7. thumbnailUpload


