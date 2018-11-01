package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.showoff.dao.MemberDAO;
import com.showoff.dto.MemberDTO;

public class PWUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="";
		String id = request.getParameter("updateId");
		String pw = request.getParameter("input_pw1");
		System.out.println("user id:" + id);
		System.out.println("user new pw:" + pw);
		
		MemberDAO dao = MemberDAO.getInstatnce();
		int result = dao.updatePW(id , pw);
		
		if(result > 0 ) {
			url="index.bizpoll";
		}else {
			url="update_pw.jsp";
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
