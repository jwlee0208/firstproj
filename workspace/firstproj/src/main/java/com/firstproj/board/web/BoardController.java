package com.firstproj.board.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.sf.json.JSONObject;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;
import org.apache.lucene.util.Version;
import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstproj.board.dto.BoardDto;
import com.firstproj.board.service.BoardServiceImpl;
import com.firstproj.common.util.PagedList;
import com.firstproj.prohibiteword.dto.ProhibiteWordDto;
import com.firstproj.prohibiteword.service.ProhibiteServiceImpl;

@Controller
@RequestMapping(value = "/firstproj")
public class BoardController {

	public static final int DEFAULT_PAGE_NO = 1;
	public static final int DEFAULT_PAGE_SIZE = 10;

	@Resource(name = "BoardServiceImpl")
	private BoardServiceImpl boardService;
	
	@Resource(name="ProhibiteServiceImpl")
	private ProhibiteServiceImpl prohibiteService;

	@RequestMapping(value = "/list.page", method = {RequestMethod.POST, RequestMethod.GET})
	public String getBoardList(HttpServletRequest request, Model model, BoardDto boardDto) throws Exception {

		model = this.getBoardCommonList(request, model, boardDto);
		
		return "board/list";
	}

	private Model getBoardCommonList(HttpServletRequest request, Model model, BoardDto boardDto) throws Exception{
		// 검색 조건
		String searchCondition = request.getParameter("searchCondition");
		String searchText = request.getParameter("searchText");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		int boardCategory = boardDto.getBoardCategory();
		
		int pageNo = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : DEFAULT_PAGE_NO;

		int listRowCnt = (request.getParameter("listRowCnt") != null) ? Integer.parseInt(request.getParameter("listRowCnt")) : 10;

		Map<String, Object> paramMap = new HashMap<String, Object>();
		// searching condition setting
		paramMap.put("boardCategory", boardCategory);
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchText", searchText);
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);

		int totalListCnt = boardService.selectListCnt(paramMap);

		// paging condition setting
		paramMap.put("pageNo", pageNo);
		paramMap.put("listRowCnt", listRowCnt);
		paramMap.put("totalListCnt", totalListCnt);
		paramMap.put("pageSize", DEFAULT_PAGE_SIZE);

		PagedList result = boardService.getBoardPagedList(paramMap);

		model.addAttribute("pagedResult", result);
		model.addAttribute("boardCategory", boardCategory);
		return model;
	}
	
	@RequestMapping(value = "/view.page")
	public String getBoardContent(HttpServletRequest request, Model model, BoardDto boardDto, @Param int selectedBoardId) throws Exception{
		
		BoardDto contentInfo = null;
		BoardDto prevContentInfo = null;
		BoardDto nextContentInfo = null;
		
		if(selectedBoardId > 0){
			boardDto.setBoardId(selectedBoardId);
			// 글 조회
			contentInfo = this.boardService.selectBoardContent(boardDto);
			// 이전 글 조회
			prevContentInfo = this.boardService.selectPrevBoardContent(boardDto);
			// 다음 글 조회
			nextContentInfo = this.boardService.selectNextBoardContent(boardDto);
		}
		
		model.addAttribute("contentInfo", contentInfo);
		model.addAttribute("prevContentInfo", prevContentInfo);
		model.addAttribute("nextContentInfo", nextContentInfo);
		
		model.addAttribute("boardCategory", boardDto.getBoardCategory());
		
		return "board/view";
	}

	@RequestMapping(value = "/write.page")
	public String writeBoard(Model model, BoardDto boardDto) {
		
		model.addAttribute("boardCategory", boardDto.getBoardCategory());
		return "board/write";
	}

	@RequestMapping(value = "/insertBoard.json")
	@ResponseBody
	public JSONObject insertBoard(@Valid BoardDto boardDto, BindingResult bindingResult) throws Exception {

		JSONObject jsonObj = new JSONObject();
		int insertResult = 0;
		
		if(bindingResult.hasErrors()){
			jsonObj.put("validate", false);
		}else{
			
			// lucene searching to prohibited word
			
			StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_40);
			
			// 인덱스 생성
			Directory index = new RAMDirectory();
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_40, analyzer);
			
			IndexWriter w = new IndexWriter(index, config);
			
			List<ProhibiteWordDto> prohibitedWordList = prohibiteService.getProhibiteList();
			
			if(null != prohibitedWordList && prohibitedWordList.size() > 0){
				
				for(ProhibiteWordDto prohibiteWordDto : prohibitedWordList){
					addDoc(w, prohibiteWordDto.getProhibitedWordStr());
				}
			}
			w.close();
			
			// query
			String querystr = boardDto.toString();
			
			System.out.println("1st queryStr : " + querystr);
			
			querystr = querystr.replaceAll("[?]", "")
								.replaceAll("[$]", "")
								.replaceAll("\\(", "")
								.replaceAll("\\)", "")
								.replaceAll("\\{", "")
								.replaceAll("\\}", "")
								.replaceAll("[*]", "")
								.replaceAll("[+]", "")
								.replaceAll("\\^", "")
								.replaceAll("[|]", "")
								.replaceAll("[/]", "")
								.replaceAll("\\[", "")
								.replaceAll("\\]", "")
								.replaceAll("<", "")
								.replaceAll(">", "")
								.replaceAll(",", "");
//								.replaceAll("/", "");
//								.replaceAll("!", "")
//								.replaceAll("#", "")
//								.replaceAll("%", "")
//								.replaceAll("&", "")
//								.replaceAll("@", "")
//								.replaceAll("`", "")
//								.replaceAll(":", "")
//								.replaceAll(";", "")
//								.replaceAll("-", "")
//								.replaceAll(".", "")
//								.replaceAll(",", "")
//								.replaceAll("~", "")
//								.replaceAll("'", "");//
			
			System.out.println("2nd queryStr : " + querystr);
			
			Query q = new QueryParser(Version.LUCENE_40, "title", analyzer).parse(querystr);
			
			// search
			int hitsPerPage = 10;
			
			IndexReader reader = DirectoryReader.open(index);
			IndexSearcher searcher = new IndexSearcher(reader);
			TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);
			searcher.search(q, collector);
			ScoreDoc[] hits = collector.topDocs().scoreDocs;
			
			// display result
			System.out.println("hits.length : " + hits.length);
			
			for(int i = 0; i < hits.length ; i++){
				int docId = hits[i].doc;
				Document d = searcher.doc(docId);
				System.out.println(">>> " + d.get("title"));
						
			}
			
			reader.close();
			
			if(hits.length < 1){
				insertResult = this.boardService.insertBoard(boardDto);	
			}else{
				jsonObj.put("error", "prohibitedWord");
			}
		}
		
		jsonObj.put("result", (insertResult > 0) ? true : false);
		
		return jsonObj;
	}
	
	private static void addDoc(IndexWriter w, String title) throws IOException{
		
		System.out.println("title : " + title);
		
		Document doc = new Document();
		doc.add(new TextField("title", title, Field.Store.YES));
	
		w.addDocument(doc);
	}
}
