package com.showoff.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.showoff.common.Constants;
import com.showoff.dao.BoardDAO;
import com.showoff.dto.BoardDTO;

public class BoardPlayRegistAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "boardList.bizpoll";
		//파일 업로드처리
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(uploadDir.exists()) {
			uploadDir.mkdir();
		}
		//request를 확장시킨 multipartRequest생성
		MultipartRequest multi = new MultipartRequest(request,
										Constants.UPLOAD_PATH,
										Constants.MAX_UPLOAD,
										"UTF-8" , new DefaultFileRenamePolicy());
		
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content1");
		String writer = multi.getParameter("writer");
		String filename = " ";
		int filesize = 0;
		
		//multipart를 사용하기 위해서는 cos.jar라는 라이브러리가 필요함
		try {
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String file1 = (String)files.nextElement();
				filename = multi.getFilesystemName(file1);
				File f1 = multi.getFile(file1);
				if(f1 != null) {
					filesize = (int)f1.length();
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(filename == null || filename.trim().equals("")) {
			filename ="_";
		}
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = new BoardDTO(title, content, writer, filename, filesize);
		
		int result = dao.boardRegist(dto);
		
		if(result > 0) {
			System.out.println("등록성공");
		}else {
			System.out.println("등록실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
