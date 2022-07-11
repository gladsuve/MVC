package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

public class BoardListController implements Controller {
	
	public String handleRequest(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
	
		
		BoardService service = new BoardService();
		List<BoardVO> boardList = service.selectAllBoard();
		
		request.setAttribute("list", boardList);
		
		
//		List<BoardVO> list = new ArrayList<>();
//		list.add(new BoardVO("aaa", "bbb"));
//		list.add(new BoardVO("ccc", "ddd"));
//		list.add(new BoardVO("eee", "fff"));
//		
//		request.setAttribute("list", list);
		
		return "/jsp/board/list.jsp";
	}

}
