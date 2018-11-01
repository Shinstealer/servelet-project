package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.showoff.dao.MemberDAO;
import com.showoff.dto.MemberDTO;

public class MemUpdatePlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		String id = request.getParameter("input_id");
		String pw = request.getParameter("input_pw");
		String gname = request.getParameter("input_name");
		String phone = request.getParameter("input_ph");
		String email_id = request.getParameter("input_email_id");
		String email_url = request.getParameter("input_email_url");
		String email = email_id + email_url;
		
		System.out.println(id + pw + gname + phone + email);
		
		MemberDTO dto = new MemberDTO(id, pw, gname, phone, email);
		MemberDAO dao = MemberDAO.getInstatnce();
		int result  = dao.memUpdate(dto);
		
		if(result > 0) {
			System.out.println("멤버 수정 성공");
			url ="index.bizpoll";
		}else {
			System.out.println("멤버 수정 실패");
			url ="member_update.jsp";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
