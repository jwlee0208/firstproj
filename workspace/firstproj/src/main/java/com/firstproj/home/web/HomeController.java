package com.firstproj.home.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.board.service.BoardArticleRedisServiceImpl;
import com.firstproj.board.service.BoardArticleServiceImpl;
import com.firstproj.player.dto.PlayerInfoDto;
import com.firstproj.player.dto.SearchPlayerDto;
import com.firstproj.player.service.PlayerServiceImpl;


@Controller
@RequestMapping(value="/")
public class HomeController {
	
	private static final Log logger = LogFactory.getLog(HomeController.class);
	
	@Resource(name = "BoardArticleServiceImpl")
	private BoardArticleServiceImpl boardArticleService;	

	@Resource(name = "BoardArticleRedisServiceImpl")
	private BoardArticleRedisServiceImpl boardArticleRedisService;	

	@Resource(name = "PlayerServiceImpl")
	private PlayerServiceImpl playerService;    
	// spring-data-redis 사용.
//	@Autowired
//	private RedisTemplate<String, List<BoardArticleDto>> redisTemplate;
	// spring-data-redis 사용.
//	@Resource(name="redisTemplate")
//	private ValueOperations<String, List<BoardArticleDto>> valueOps;

	
	@RequestMapping(value="/home")
	public String goHome(Model model) throws Exception{
	    model = goHomeDefault(model);
	    return "home";
	}
	
	@RequestMapping(value="/home/{menuId}")
	public String goHome(Model model, @PathVariable int menuId) throws Exception{
		/*
		BoardArticleDto boardDto01 = new BoardArticleDto();
		boardDto01.setBoardId(1);
		
		List<BoardArticleDto> getBoardArticleFive01 = this.boardArticleService.selectBoardArticleFive(boardDto01);

		BoardArticleDto boardDto02 = new BoardArticleDto();
		boardDto02.setBoardId(2);
		
		List<BoardArticleDto> getBoardArticleFive02 = this.boardArticleService.selectBoardArticleFive(boardDto02);

		model.addAttribute("articleFive01", getBoardArticleFive01);
		model.addAttribute("articleFive02", getBoardArticleFive02);
		*/
	    model = goHomeDefault(model);
		return "home";
	}

	private Model goHomeDefault(Model model) throws Exception{
	    BoardArticleDto boardDto01 = new BoardArticleDto();
	    boardDto01.setBoardId(1);
	        
	    List<BoardArticleDto> getBoardArticleFive01 = this.boardArticleService.selectBoardArticleFive(boardDto01);

	    BoardArticleDto boardDto02 = new BoardArticleDto();
	    boardDto02.setBoardId(2);
	        
	    List<BoardArticleDto> getBoardArticleFive02 = this.boardArticleService.selectBoardArticleFive(boardDto02);

	    model.addAttribute("articleFive01", getBoardArticleFive01);
	    model.addAttribute("articleFive02", getBoardArticleFive02);

	    return model;
	}
	
	@RequestMapping(value="/home2/{menuId}")
	public String goHome(@PathVariable int menuId) throws Exception{		
		return "home2";
	}	
	
	@RequestMapping(value="/home3/{menuId}")
	public String goHome3(Model model, @PathVariable int menuId) throws Exception{
	    /*
		BoardArticleDto boardDto01 = new BoardArticleDto();
		boardDto01.setBoardId(1);
		
		List<BoardArticleDto> getBoardArticleFive01 = this.boardArticleService.selectBoardArticleFive(boardDto01);

		BoardArticleDto boardDto02 = new BoardArticleDto();
		boardDto02.setBoardId(2);
		
		List<BoardArticleDto> getBoardArticleFive02 = this.boardArticleService.selectBoardArticleFive(boardDto02);

		model.addAttribute("articleFive01", getBoardArticleFive01);
		model.addAttribute("articleFive02", getBoardArticleFive02);
		*/
	    
	    List<PlayerInfoDto>    recentPlayerList    = this.playerService.getPlayerListRecently();
	    
	    model.addAttribute("recentPlayerList", recentPlayerList);
	    
		return "home3";
	}	
	/*
	@RequestMapping(value="/home4")
	public String goHome4(Model model) throws Exception{
		
		String boardArticleFive01 = this.boardArticleRedisService.get("boardArticleFive01");
		
		BoardArticleDto boardDto01 = new BoardArticleDto();
		List<BoardArticleDto> getBoardArticleFive01 = null;

		if(null != boardArticleFive01){
//			System.out.println(boardArticleFive01);
			
			org.json.JSONArray jsonArr = new org.json.JSONArray(boardArticleFive01);
			
			model.addAttribute("articleFive01JsonArr", jsonArr);
			
		}else{
			boardDto01.setBoardId(1);
			getBoardArticleFive01 = this.boardArticleService.selectBoardArticleFive(boardDto01);
			
			JSONArray jsonArr = JSONArray.fromObject(getBoardArticleFive01);
			
			System.out.println(jsonArr);
			this.boardArticleRedisService.set("boardArticleFive01", jsonArr.toString());
		
			
		}
		
		BoardArticleDto boardDto02 = new BoardArticleDto();
		boardDto02.setBoardId(2);
		
		List<BoardArticleDto> getBoardArticleFive02 = this.boardArticleService.selectBoardArticleFive(boardDto02);

		
		
		model.addAttribute("articleFive01", getBoardArticleFive01);
		model.addAttribute("articleFive02", getBoardArticleFive02);
		
		
		return "home4";
	}
    */
	@RequestMapping(value="/home4/{menuId}")
	public String goHome4(Model model, @PathVariable int menuId) throws Exception{
		
		BoardArticleDto boardDto01 = new BoardArticleDto();
		List<BoardArticleDto> getBoardArticleFive01 = null;
		
//		ListOperationredisTemplate.opsForList();
//		try{
//			List<BoardArticleDto> boardArticleFive01 = valueOps.get("boardFive01List");
//			
//			if(null != boardArticleFive01){
//			    logger.info(boardArticleFive01);
//				
//				model.addAttribute("articleFive01", boardArticleFive01);
//				logger.info(">>> redis printed. dataTypeOf : " + boardArticleFive01.getClass());
//			}else{
//				boardDto01.setBoardId(1);
//				getBoardArticleFive01 = this.boardArticleService.selectBoardArticleFive(boardDto01);
				
//				valueOps.set("boardFive01List", getBoardArticleFive01);
//				model.addAttribute("articleFive01", getBoardArticleFive01);
//				logger.info(">>> redis setted");
//			}
//			
//		}catch(Exception e){
			boardDto01.setBoardId(1);
			getBoardArticleFive01 = this.boardArticleService.selectBoardArticleFive(boardDto01);
logger.info("is Null : " + (null == getBoardArticleFive01));			
//			valueOps.set("boardFive01List", getBoardArticleFive01);
			model.addAttribute("articleFive01", getBoardArticleFive01);
			System.out.println(">>> redis setted");
//			e.printStackTrace();
//		}finally{
//			
//		}
		
		BoardArticleDto boardDto02 = new BoardArticleDto();
		boardDto02.setBoardId(2);
		
		List<BoardArticleDto> getBoardArticleFive02 = this.boardArticleService.selectBoardArticleFive(boardDto02);

		
		
//		model.addAttribute("articleFive01", getBoardArticleFive01);
		model.addAttribute("articleFive02", getBoardArticleFive02);
		
		
		return "home4";
	}
	
	
	@RequestMapping(value="/aboutUs/{menuId}")
	public String goAboutUs(@PathVariable int menuId) throws Exception{
		return "/info/aboutUs";
	}
//	@RequestMapping(value="/getFiveArticle")
//	public String getBoardArticle(Model model) throws Exception{
//		
//		return "/board/articleFive";
//	}
}
