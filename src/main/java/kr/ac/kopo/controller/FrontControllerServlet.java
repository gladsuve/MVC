package kr.ac.kopo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontControllerServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String context = request.getContextPath();
		String uri = request.getRequestURI();
		uri = uri.substring(context.length());
		System.out.println("uri : " + uri);
//		System.out.println("context : " + context);
		
		
		try {
			HandlerMapping mappings = new HandlerMapping();
			Controller control = mappings.getController(uri);
//			String callPage = null;
//			Controller control = null;
			
//			switch(uri) {
//			case "/board/list.do" :
//				control = new BoardListController();
////				BoardListController list = new BoardListController();
////				callPage = list.handleRequest(request, response);
////				System.out.println("전체게시글 조회서비스");
//				break;
//			case "/board/writeForm.do" :
//				control = new BoardWriteFormController();
////				BoardWriteFormController write = new BoardWriteFormController();
////				callPage = write.handleRequest(request, response);
//				break;
//			case "/board/write.do" :
//				control = new BoardWriteController();
//				break;
//			}
			if(control != null) {
				String callPage = control.handleRequest(request, response);
				if(callPage.startsWith("redirect:")) {
					callPage = callPage.substring("redirect:".length());
					response.sendRedirect(request.getContextPath() + callPage);
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
					dispatcher.forward(request, response);
					
				}
				
			}
		} catch(Exception e) {
			throw new ServletException(e);
		}
	}
}
