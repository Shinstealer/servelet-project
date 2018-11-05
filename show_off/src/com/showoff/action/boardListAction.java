package com.showoff.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.showoff.dao.BoardDAO;
import com.showoff.dto.BoardDTO;

public class boardListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "board/board_list.jsp";
		
		BoardDAO dao = BoardDAO.getInstance();
		//게시물 목록
		List<BoardDTO> boardList = dao.boardListAll();
		
		request.setAttribute("boardList", boardList);
		
		//현재날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
