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
import com.firstproj.player.service.PlayerServiceImpl;


@Controller
@RequestMapping(value="/")
public class HomeController {
	
	private static final Log logger = LogFactory.getLog(HomeController.class);
	
	@Resource(name = "BoardArticleServiceImpl")
	private BoardArticleServiceImpl        boardArticleService;	

	@Resource(name = "BoardArticleRedisServiceImpl")
	private BoardArticleRedisServiceImpl   boardArticleRedisService;	

	@Resource(name = "PlayerServiceImpl")
	private PlayerServiceImpl              playerService;    

	// spring-data-redis 사용.
//	@Autowired
//	private RedisTemplate<String, List<BoardArticleDto>> redisTemplate;
	// spring-data-redis 사용.
//	@Resource(name="redisTemplate")
//	private ValueOperations<String, List<BoardArticleDto>> valueOps;

	
	@RequestMapping(value="/home")
	public String goHome(Model model) throws Exception{
	    /*
	    model = goHomeDefault(model);
	    return "home";
	    */
	    return this.goHome3(model, 0);
	}
	
	/*
	@RequestMapping(value="/home/{menuId}")
	public String goHome(Model model, @PathVariable int menuId) throws Exception{
	    model = goHomeDefault(model);
		return "home";
	}
    */
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
	
	@RequestMapping(value="/home/{menuId}")
	public String goHome3(Model model, @PathVariable int menuId) throws Exception{
	    
	    PlayerInfoDto playerInfoDto = new PlayerInfoDto();
	    playerInfoDto.setCatId1(1);
	    List<PlayerInfoDto>    recentPlayerList  = this.playerService.getPlayerListRecently(playerInfoDto);

	    PlayerInfoDto teamInfoDto = new PlayerInfoDto();
	    teamInfoDto.setCatId1(5);

	    List<PlayerInfoDto>    recentTeamList    = this.playerService.getPlayerListRecently(teamInfoDto);
	    
	    model.addAttribute("recentPlayerList"  , recentPlayerList);
	    model.addAttribute("recentTeamList"    , recentTeamList);
	    
		return "home";
	}	
	
	@RequestMapping(value="/aboutUs/{menuId}")
	public String goAboutUs() throws Exception{
		return "/info/aboutUs";
	}
	    
}
