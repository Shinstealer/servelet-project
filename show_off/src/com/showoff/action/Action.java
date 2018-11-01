package com.showoff.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	
	//abstract method -> Action을 강제성을 주고 Overriding을 줌
	//forward , sendRedirect 결정 => ActionFoward
	public ActionForward excute(HttpServletRequest request ,
							HttpServletResponse response) throws ServletException , IOException;
	
	
	
	
}
