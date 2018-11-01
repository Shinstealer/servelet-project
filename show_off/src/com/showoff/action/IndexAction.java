package com.showoff.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.showoff.dao.ProductDAO;
import com.showoff.dto.ProductDTO;

public class IndexAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "index.jsp";
		
		//싱글톤 방식
		ProductDAO dao = ProductDAO.getInstatnce();
		List<ProductDTO> bestList = dao.bestView();
		List<ProductDTO> newArrList = dao.newArrView();
		List<ProductDTO> highPriceList = dao.HighPriceView();
		
		request.setAttribute("bestlist", bestList);
		request.setAttribute("newArrList", newArrList);
		request.setAttribute("highPriceList", highPriceList);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);		//index.jsp로 이동
		forward.setRedirect(false);	//forward 방식을 사용
		
		return forward;
	}

}
