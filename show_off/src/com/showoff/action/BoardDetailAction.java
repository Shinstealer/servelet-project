package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.showoff.dao.BoardDAO;
import com.showoff.dto.BoardDTO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/board_read.jsp";
		
		String bno = request.getParameter("bno");
		
		System.out.println("bno:" + bno);
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.detailView(bno);
		System.out.println("dto "+dto.toString());
		request.setAttribute("boardDetailView", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
