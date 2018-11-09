package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.showoff.dao.BoardDAO;
import com.showoff.dto.BoardDTO;

public class BoardViewsAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bno = request.getParameter("bno");
		BoardDAO dao = BoardDAO.getInstance();
		
		String url = "boardDetail.bizpoll?bno=" + bno;
		
		HttpSession session = request.getSession();
		
		dao.viewCnt(session, bno);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
