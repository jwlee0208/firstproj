package com.firstproj.home.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.board.dto.BoardArticleDto;
import com.firstproj.board.service.BoardArticleRedisServiceImpl;
import com.firstproj.board.service.BoardArticleServiceImpl;
import com.firstproj.player.dto.PlayerInfoDto;
import com.firstproj.player.service.PlayerServiceImpl;
import com.firstproj.profile.dto.ProfileDto;
import com.firstproj.profile.service.ProfileServiceImpl;


@Controller
@RequestMapping(value="/")
public class HomeController {
	
	private static final Log logger = LogFactory.getLog(HomeController.class);
	
	@Resource(name = "BoardArticleServiceImpl")
	private BoardArticleServiceImpl        boardArticleService;	

	@Resource(name = "BoardArticleRedisServiceImpl")
	private BoardArticleRedisServiceImpl   boardArticleRedisService;	

	@Resource(name = "PlayerServiceImpl")
	private PlayerServiceImpl   playerService;    

	@Resource(name = "profileService")
	private ProfileServiceImpl profileService;
	
	// spring-data-redis 사용.
//	@Autowired
//	private RedisTemplate<String, List<BoardArticleDto>> redisTemplate;
	// spring-data-redis 사용.
//	@Resource(name="redisTemplate")
//	private ValueOperations<String, List<BoardArticleDto>> valueOps;
	
	
	@RequestMapping(value="/home")
	public String goHome(Model model) throws Exception{
		// 2016.06.14 이후 내용
		ProfileDto profilePlayerDto = new ProfileDto();
		profilePlayerDto.setCatId1("01010100");
		profilePlayerDto.setProfileType("1");
		List<ProfileDto> profilePlayerList = this.profileService.getProfileInfos(profilePlayerDto);
		model.addAttribute("recentPlayerProfileList", profilePlayerList);

		ProfileDto profileTeamDto = new ProfileDto();
		profileTeamDto.setCatId1("01010300");
		profileTeamDto.setProfileType("3");
		List<ProfileDto> profileTeamList = this.profileService.getProfileInfos(profileTeamDto);
		model.addAttribute("recentTeamProfileList", profileTeamList);
		
		
		//-- 2016.06.14 이후 내용
		
		
		
		
		// 2016.06.14 이전 내용
	    PlayerInfoDto playerInfoDto = new PlayerInfoDto();
	    playerInfoDto.setCatId1("01010100");
	    List<PlayerInfoDto>    recentPlayerList  = this.playerService.getPlayerListRecently(playerInfoDto);
	    
	    PlayerInfoDto teamInfoDto = new PlayerInfoDto();
	    teamInfoDto.setCatId1("01010300");
	    List<PlayerInfoDto>    recentTeamList    = this.playerService.getPlayerListRecently(teamInfoDto);
	    
	    BoardArticleDto boardDto01 = new BoardArticleDto();
	    boardDto01.setBoardId(15);
	            
	    List<BoardArticleDto> recentTryoutList = this.boardArticleService.selectBoardArticleFive(boardDto01);

	    model.addAttribute("recentPlayerList"  , recentPlayerList);
	    model.addAttribute("recentTeamList"    , recentTeamList);
	    model.addAttribute("recentTryoutList"  , recentTryoutList);
	    // -- 2016.06.14 이전 내용
	    
	    return "home";
	}	
	
	@RequestMapping(value="/aboutUs")
	public String goAboutUs() throws Exception{
		return "/info/aboutUs";
	}
	
	@RequestMapping(value="/sitemap")
	public String goSitemap() throws Exception{
	    return "/info/sitemap";
	}
	    
}
