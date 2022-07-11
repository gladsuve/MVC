package kr.ac.kopo.controller;

import java.util.HashMap;
import java.util.Map;

public class HandlerMapping {

	private Map<String, Controller> mappings = new HashMap<>();
	
	public HandlerMapping() {
		
		mappings.put("/board/list.do", new BoardListController());
		mappings.put("/board/writeForm.do", new BoardWriteFormController());
		mappings.put("/board/write.do", new BoardWriteController());
		mappings.put("/board/detail.do" , new BoardDetailController());
	}

	public Controller getController(String uri) {
		
		return mappings.get(uri);
		
	}
	
}
