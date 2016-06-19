package com.firstproj.common.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.firstproj.board.dto.BoardCategoryPortalDto;
import com.firstproj.board.dto.BoardDto;
import com.firstproj.board.dto.SideBoardCategoryPortalDto;
import com.firstproj.board.service.BoardArticleService;
import com.firstproj.board.service.BoardService;
import com.firstproj.common.dto.ShareDto;
import com.firstproj.player.dto.CategoryDto;
import com.firstproj.player.service.PlayerServiceImpl;
import com.firstproj.share.service.ShareService;
import com.firstproj.user.dto.UserDto;
import com.firstproj.user.service.UserService;

@Controller
@RequestMapping(value="/common")
public class CommonController {

    @Resource(name = "BoardArticleServiceImpl")
    private BoardArticleService boardArticleService;
    
    @Resource(name = "BoardServiceImpl")
    private BoardService    boardService;

    @Resource(name = "ShareServiceImpl")
    private ShareService shareService;

    @Resource(name = "UserServiceImpl")
    private UserService  userService;
    
    @Resource(name="PlayerServiceImpl")
    private PlayerServiceImpl   playerService;
    
    @RequestMapping(value = "/sideBoardList")
    public String getSideBoardList(Model model) throws Exception{
        /*
        model.addAttribute("sideBoardList", this.boardArticleService.selectSideBoardList());
        return "common/ajaxSideBoardList";
        */
        return this.getSideBoardList(model, null);
    }

    @RequestMapping(value = "/sideBoardList/{userId}")
    public String getSideBoardList(Model model, @PathVariable String userId) throws Exception{
        BoardDto                         boardDto                    = new BoardDto();
        ShareDto                         shareDto                    = new ShareDto();
        List<SideBoardCategoryPortalDto> sideBoardCategoryPortalList = null;
        ShareDto                         sideShareInfo               = null;
        if(!StringUtils.isEmpty(userId)){
            // 게시판 목록 정보 조회
            boardDto.setCreateUserId(userId);
            sideBoardCategoryPortalList = this.boardArticleService.selectSideBoardList(boardDto);
            // share 정보 조회
            shareDto.setUserId(userId);
            sideShareInfo = this.shareService.getShareInfo(shareDto);
        }
        
        model.addAttribute("sideBoardList", sideBoardCategoryPortalList);
        model.addAttribute("sideShareInfo", sideShareInfo);
        return "common/ajaxSideBoardList";
    }

    @RequestMapping(value = "/menu/{menuType}")
    public String getMenu(HttpServletRequest request, Model model, @PathVariable String menuType) throws Exception{
        return this.getMenu(request, model, menuType, null);
    }
    
    
    @RequestMapping(value = "/menu/{menuType}/{userId}")
    public String getMenu(HttpServletRequest request, Model model, @PathVariable String menuType, @PathVariable String userId) throws Exception{
        /*
        model.addAttribute("boardCategoryList", this.boardService.getBoardCategoryList());
        model.addAttribute("boardList", this.boardService.getBoardList());
        */
        
        BoardCategoryPortalDto boardCategoryPortalDto = new BoardCategoryPortalDto();
        
        
        if(!StringUtils.isEmpty(userId)){
            boardCategoryPortalDto.setCreateUserId(userId);
        }
        model.addAttribute("userId", userId);
/*        
        System.out.println("ccon uri : " + request.getRequestURI());
        System.out.println("ccon url : " + request.getRequestURL());
*/        
        StringBuffer sb = new StringBuffer();
        sb.append("common/");
        if(menuType.equals("blog")){
            ShareDto shareDto = new ShareDto();
            
            if(StringUtils.isEmpty(userId)){
                shareDto.setUserId("all");
            }else{
                shareDto.setUserId(userId);
                shareDto = this.shareService.getShareInfo(shareDto);
            }
            
            model.addAttribute("boardCategoryList"  , this.boardService.getBoardCategoryAndBoardList(boardCategoryPortalDto));
            model.addAttribute("shareInfo"          , shareDto);
            sb.append("ajaxBlogMenu");
        }else if(menuType.equals("config")){
            BoardDto boardDto = new BoardDto();
            model.addAttribute("boardList", this.boardService.getBoardList(boardDto));
            sb.append("ajaxConfigMenu");
        }else{    
            model.addAttribute("categoryList", this.playerService.getCategoryTwoDepthList());
            sb.append("ajaxMenu");
        }
        return sb.toString();
    }

    @RequestMapping(value = "/privateRule")
    public String getPrivateRule() throws Exception{
        return "common/privateRule";
    }
    
    @RequestMapping(value = "/useRule")
    public String getUseRule() throws Exception{
        return "common/useRule";
    }
    
    @RequestMapping(value = "/paging")
    public String getPaging(HttpServletRequest request, Model model) throws Exception{
        return "common/ajaxPaging";
    }
    
    @RequestMapping(value = "/sideConfigList")
    public String getSideConfigList(Model model, HttpSession session) throws Exception{
        
        UserDto sessionInfo = (UserDto)session.getAttribute("userInfo");
        
        model.addAttribute("userInfo", sessionInfo);
        return "common/ajaxSideConfigList";
    }
    
    @RequestMapping(value = "/footer/{userId}")
    public String getFooterInfo(Model model, @PathVariable String userId) throws Exception{
        UserDto userInfo = null;
        
        if(!StringUtils.isEmpty(userId)){
            UserDto searchUserInfo = new UserDto();
            searchUserInfo.setUserId(userId);
            userInfo = this.userService.selectUserInfo(searchUserInfo);
        }
        
        model.addAttribute("userInfo", userInfo);
        return "common/ajaxFooter";
    }
    @RequestMapping(value = "/footer")
    public String getFooterInfo(Model model) throws Exception{
        return this.getFooterInfo(model, null);
    }
    
    @RequestMapping(value = "/modalPopup")
    public String getModalPopup(){
    	return "common/ajaxModalPopup";
    }
}
