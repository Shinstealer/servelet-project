package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.showoff.dao.MemberDAO;

public class MemberDeletePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="";
		
		System.out.println("post!!!!!!!!!!!!!!!!!!!!!!!!!!");
		HttpSession session = request.getSession();
		String userid = request.getParameter("id");
		String userpw = request.getParameter("pw");
		System.out.println(userid + "," + userpw);
		
		MemberDAO dao = MemberDAO.getInstatnce();
		String msg = dao.confirmPW(userid, userpw);
		
		if(msg.equals("1")) {
			System.out.println("회원삭제");
			int flag = dao.deleteMember(userid);
			if(flag > 0) {//삭제성공
				if(session != null) {
					//session을 초기화 => 로그인 정보 삭제
					session.invalidate();
				}
			}else {//회원삭제 실패
				
				
			}
			
		}
		JSONObject jObj = new JSONObject();
		jObj.put("msg", msg);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		return null;
	}

}
