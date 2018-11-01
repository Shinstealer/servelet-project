package com.showoff.action;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.showoff.dao.MemberDAO;
import com.showoff.dto.MemberDTO;

public class LoginPlayACtion implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("POST!!!!!!");
		//스프링에서 mybatis sqlsession역할
		//session에 로그인 정보를 담아 모든 페이지에 적용
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id + "," + pw);
		
		MemberDAO dao = MemberDAO.getInstatnce();
		MemberDTO dto = dao.loginCheck(id, pw);
		
		String msg = null;
		
		if(dto != null){//로그인 성공
			//session값에 login된 회원정보를 담아야함
			System.out.println("로그인 성공");
			session.removeAttribute("id");//기존에 남아 있는 값을 제거
			session.setAttribute("loginUser", dto);
			msg = "1";
			}else {
			System.out.println("로그인 실패");	
			msg = "-1";
			}
			
		JSONObject jObj = new JSONObject();
		jObj.put("msg", msg);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
		
	}
	

}
