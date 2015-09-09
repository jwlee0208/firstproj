package com.firstproj.common.web;

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
import com.firstproj.board.service.BoardArticleService;
import com.firstproj.board.service.BoardService;
import com.firstproj.common.dto.ShareDto;
import com.firstproj.share.service.ShareService;
import com.firstproj.user.dto.UserDto;

@Controller
@RequestMapping(value="/common")
public class CommonController {

    @Resource(name = "BoardArticleServiceImpl")
    private BoardArticleService boardArticleService;
    
    @Resource(name = "BoardServiceImpl")
    private BoardService    boardService;

    @Resource(name = "ShareServiceImpl")
    private ShareService shareService;

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
        BoardDto boardDto = new BoardDto();
        if(!StringUtils.isEmpty(userId)){
            boardDto.setCreateUserId(userId);    
        }
        model.addAttribute("sideBoardList", this.boardArticleService.selectSideBoardList(boardDto));
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
    

}
