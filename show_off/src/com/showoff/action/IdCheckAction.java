package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.showoff.dao.MemberDAO;

public class IdCheckAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("id");
		System.out.println("id ====>"+ userid);
		
		if(userid != null) {
			if(!userid.trim().equals("")) {
				MemberDAO dao = MemberDAO.getInstatnce();
				String msg = dao.confirmID(userid);
				System.out.println("==================action :" + msg);
				
				JSONObject jObj = new JSONObject();
				jObj.put("message", msg);
				jObj.put("id", userid);
				
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(jObj);
			}
			
			
		}
		
		return null;
	}

}
