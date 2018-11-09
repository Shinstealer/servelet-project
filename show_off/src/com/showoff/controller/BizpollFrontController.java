package com.showoff.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.showoff.action.Action;
import com.showoff.action.ActionForward;
import com.showoff.action.BoardDetailAction;
import com.showoff.action.BoardPlayRegistAction;
import com.showoff.action.BoardRegistACtion;
import com.showoff.action.BoardSearchAction;
import com.showoff.action.BoardViewsAction;
import com.showoff.action.Contractbizpoll;
import com.showoff.action.IdCheckAction;
import com.showoff.action.IndexAction;
import com.showoff.action.Joinbizpoll;
import com.showoff.action.LoginOutPlayACtion;
import com.showoff.action.LoginPlayACtion;
import com.showoff.action.MemUpdateAction;
import com.showoff.action.MemUpdatePlayAction;
import com.showoff.action.MemberDeletePlayAction;
import com.showoff.action.MemberPlayAction;
import com.showoff.action.PWUpdatePlayAction;
import com.showoff.action.boardListAction;
import com.showoff.action.pwCheckAction;

/**
 * Servlet implementation class BizpollFrontController
 */
@WebServlet("/BizpollFrontController")
public class BizpollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BizpollFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//GET , POST 둘다 받음
		
		request.setCharacterEncoding("UTF-8");
		
		Action action = null;			//실제 동작하는 부분(Action 단!)
		ActionForward forward = null;	//페이지 이동 ,forward 또는 sendRedirect
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		
		System.out.println("URI:" + uri);
		System.out.println("ctx:" + ctx);
		System.out.println("페이지 이동 ====>" + command);
		
		//action단 이동
		if(command.equals("/index.bizpoll")) {
			action = new IndexAction();
			forward = action.excute(request, response);
		}else if(command.equals("/contract.bizpoll")){
			action = new Contractbizpoll();
			forward = action.excute(request, response);
		}else if(command.equals("/join.bizpoll")) {
			action = new Joinbizpoll();
			forward = action.excute(request, response);
		}else if(command.equals("/memberplay.bizpoll")) {
			action = new MemberPlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberUpdate.bizpoll")) {
			action = new MemUpdateAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberPlayUpdate.bizpoll")) {
			action = new MemUpdatePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/loginplay.bizpoll")) {
			action = new LoginPlayACtion();
			forward = action.excute(request, response);
		}else if(command.equals("/logOut.bizpoll")) {
			action = new LoginOutPlayACtion();
			forward = action.excute(request, response);
		}else if(command.equals("/idCheck.bizpoll")) {
			action = new IdCheckAction();
			forward = action.excute(request, response);
		}else if(command.equals("/pwCheck.bizpoll")) {
			action = new pwCheckAction();
			forward = action.excute(request, response);
		}else if(command.equals("/pwUpdate.bizpoll")) {
			action = new PWUpdatePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/pwplayupdate.bizpoll")) {
			action = new PWUpdatePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/memberdeleteplay.bizpoll")) {
			action = new MemberDeletePlayAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardList.bizpoll")) {
			action = new boardListAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardSearch.bizpoll")) {
			action = new BoardSearchAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardDetail.bizpoll")) {
			action = new BoardDetailAction();
			forward = action.excute(request, response);
		}else if(command.equals("/boardviewcnt.bizpoll")) {
			action = new BoardViewsAction();
			forward = action.excute(request, response);
		}else if(command.equals("/board_regist.bizpoll")) {
			action = new BoardRegistACtion();
			forward = action.excute(request, response);
		}else if(command.equals("/regist_contents.bizpoll")) {
			action = new BoardPlayRegistAction();
			forward = action.excute(request, response);
		}
		
		//공통 분기작업(페이지 이동)
		if(forward != null) {
			if(forward.isRedirect()) {//true:sendRerdirect
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
			
		}
		
	}

}
