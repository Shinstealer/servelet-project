package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.showoff.dao.MemberDAO;

public class pwCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("id");
		String userpw = request.getParameter("pw");
		System.out.println("id ====>"+ userid);
		System.out.println("pw ====>"+ userpw);
		
		
				MemberDAO dao = MemberDAO.getInstatnce();
				
				String msg = dao.confirmPW(userid, userpw);
				//System.out.println("==================action :" + msg);
				
				JSONObject jObj = new JSONObject();
				jObj.put("msg", msg);
				jObj.put("pw", userpw);
				if(jObj.isEmpty()) {
					System.out.println("값 없음");
				}else {
					System.out.println("값 있음!");
				}
				
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(jObj);
			
		
		
		return null;
	}

}
