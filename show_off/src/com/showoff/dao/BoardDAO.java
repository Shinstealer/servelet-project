package com.showoff.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.showoff.dto.BoardDTO;
import com.showoff.dto.CriteriaDTO;
import com.showoff.mybatis.SqlMapConfig;

public class BoardDAO {
SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	
	SqlSession sqlSession;

	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public List<BoardDTO> boardListAll(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = new ArrayList<>();
		
		try {
			list = sqlSession.selectList("boardList" , criDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
		
	}
	
	public int totalCount(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			
			result = sqlSession.selectOne("countPaging" ,criDto);
			System.out.println("Result :" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
	
	public List<BoardDTO> boardSearch(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = null;
		
		try {
			
			list = sqlSession.selectList("BoardSearchList", criDto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return list;
		
	}
	
	public void viewCnt(HttpSession countsession , String bno) {
		sqlSession = sqlSessionFactory.openSession();
		System.out.println("viewCnt bno__>" + bno);
		try {
			long update_time = 0;
			int result = 0;
			
			if(countsession.getAttribute("read_time_" + bno) != null) {
				update_time = (long)countsession.getAttribute("read_time_" + bno);
			}
			
			long current_time = System.currentTimeMillis();
			
			if(current_time - update_time > 1000*60*60*24) {
				
				result = sqlSession.update("viewCnt", bno);
				sqlSession.commit();
				countsession.setAttribute("read_time_"+ bno, current_time);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}
	
	public BoardDTO detailView(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		BoardDTO dto = null;
		System.out.println("dao------->:"+ bno);
		try {
			
			dto = sqlSession.selectOne("boardDetailView" , bno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return dto;
		
	}
	
	public int boardRegist(BoardDTO dto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		System.out.println("DAO등록----:" + dto.toString());
		try {
			result = sqlSession.insert("boardInsert" , dto);
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
}
