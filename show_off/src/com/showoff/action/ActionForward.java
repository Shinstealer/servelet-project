package com.showoff.action;

public class ActionForward {

	//view Page(결과값을 어디로 전송할지)
	private String path;
	
	//페이지 이동하는 방법(sendRedirect , Forward)
	//true -> sendRedrirect, false -> forward
	private boolean isRedirect;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
}
