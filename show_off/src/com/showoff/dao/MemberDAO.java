package com.showoff.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.showoff.dto.MemberDTO;
import com.showoff.mybatis.SqlMapConfig;

public class MemberDAO {
	
SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	
	SqlSession sqlSession;
	
	
	private MemberDAO() {}
	
	//싱클톤 패턴-객체생성 1회 실시 후 공유해서 사용
	//객체생성 1회 실시
	private static MemberDAO instatnce = new MemberDAO();

	//외부에서 getInstance()를 활용하여 1회 실시한 객체를 공유
	public static MemberDAO getInstatnce() {
		return instatnce;
	}

	
	//회원가입
	public int memberList(MemberDTO dto) {
		int result = 0;
		
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.insert("insertMember" , dto);
			sqlSession.commit();//insert, update, delete는 반드시 commit
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
	
	public String confirmID(String userid) {
		String result = null;
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			result = sqlSession.selectOne("confirmID" , userid);
			
			if(result != null) {
				result = "-1";
			}else {
				result = "1";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
	
	public String confirmPW(String userid, String userpw) {
		String result = null;
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO dto = new MemberDTO();
		dto.setId(userid);
		dto.setPw(userpw);
		
		try {
			result = sqlSession.selectOne("confirmPW" , dto);
			
			if(result != null) {
				result = "1";
			}else {
				result = "-1";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
		
	}
	
	public MemberDTO loginCheck(String uid, String upw) {
		
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO dto = new MemberDTO();
		dto.setId(uid);
		dto.setPw(upw);
		
		try {
			
			dto = sqlSession.selectOne("loginCheck" , dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return dto;
		
		
	}
	
	public int memUpdate(MemberDTO dto) {
		int result = 0;
		
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			result = sqlSession.update("memUpdate" , dto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
		
	}
	
	public int updatePW(String id, String pw) {
		int result = 0;
		
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO dto = new MemberDTO(id, pw);
		dto.setId(id);
		dto.setPw(pw);
		try {
			result = sqlSession.update("updatePW" , dto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
		
	}
	
	//회원삭제
	
	public int deleteMember(String userid) {
		int flag = 0;
		
		sqlSession = sqlSessionFactory.openSession();
		try {
			flag = sqlSession.delete("deleteMember", userid);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return flag;
		
	}
	
	
	
	
	
	/*Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MemberDTO> list = new ArrayList<>();
	int result;
	MemberDTO dto;
	public int memberList(MemberDTO dto){
		try {
			conn = DBManager.getConnection();
			String sql = "INSERT INTO showoff_member "
					+ "VALUES(? , ? , ? , ? , ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getGname());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	public int memUpdate(MemberDTO dto){
		try {
			conn = DBManager.getConnection();
			String sql = "UPDATE showoff_member "
					+ "SET pw =? , gname =? , phone =? , email =? "
					+ "WHERE id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getGname());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		
		return result;
		
	}
	
	public MemberDTO loginCheck(String uid, String upw){
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM showoff_member "
					+ "WHERE id=? AND pw =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String gname = rs.getString("gname");
				String phone = rs.getString("phone");
				String email = rs.getString("email");

				dto = new MemberDTO(id, pw, gname, phone, email);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt ,rs);
		}
		
		return dto;
		
	}
	
	public int confirmID(String userid) {
		int msg =0;
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM showoff_member "
					+ "WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				msg = -1;
			}else {
				msg = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return msg;
	}
	
	public int confirmPW(String userid, String userpw) {
		int msg =0;
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT id FROM showoff_member "
					+ "WHERE pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userpw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				msg = 1;
			}else {
				msg = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return msg;
	}
	
	public int updatePW(String userid, String userpw) {
		try {
			conn = DBManager.getConnection();
			
			String sql = "UPDATE showoff_member SET "
					+ "pw = ? "
					+ "WHERE id= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userpw);
			pstmt.setString(2, userid);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		
		return result;
	}*/
}
