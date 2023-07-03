package org.momento.controller;

import org.momento.domain.BoardVO;
import org.momento.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;

	@GetMapping("/list")
	public void list() {}
	
	@PostMapping("/textEdit")
	public String testEdit(BoardVO vo) {
		System.out.println(vo.getContent());
		service.insert(vo);
		
		return "redirect:/board/list";
		
	}
	

	
}
