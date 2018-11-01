package com.showoff.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.showoff.dao.MemberDAO;

public class IdCheckTest {

	String userid = "coolldd";
	
	@Test
	public void testConfirmID() {
		MemberDAO dao = MemberDAO.getInstatnce();
		
		dao.confirmID(userid);
	
	}

}
