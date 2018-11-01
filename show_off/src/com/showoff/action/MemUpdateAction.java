package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.showoff.dao.MemberDAO;
import com.showoff.dto.MemberDTO;

public class MemUpdateAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "member_update.jsp";
		
		//회원정보수정을 하려면 반드시 선행조건
		//1.로그인이 되있어야한다.(session이 null이 아니면 = 로그인)
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") == null) {//로그인 안된경우
			url = "index.bizpoll";
		}else {//로그인OK
			url ="member_update.jsp";
			
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
