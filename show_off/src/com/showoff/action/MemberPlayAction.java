package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.showoff.dao.MemberDAO;
import com.showoff.dto.MemberDTO;

public class MemberPlayAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		
		String url = "welcome_join.jsp";
		System.out.println("post!!!!!!!!!!!!!!!!!!!!!!");
		
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
		int result  = dao.memberList(dto);
		
		if(result > 0) {
			System.out.println("멤버 등록 성공");
		}else {
			System.out.println("멤버 등록 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
}
