package funfun.jdbc.dto;

import java.util.Date;

public class CBoard_sub {
	private int no;
	private int contentBoardCno;
	private Date csDate;
	private String subtitle;
	private String context;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getContentBoardCno() {
		return contentBoardCno;
	}
	public void setContentBoardCno(int contentBoardCno) {
		this.contentBoardCno = contentBoardCno;
	}
	public Date getCsDate() {
		return csDate;
	}
	public void setCsDate(Date csDate) {
		this.csDate = csDate;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	@Override
	public String toString() {
		return "CBoard_sub [no=" + no + ", contentBoardCno=" + contentBoardCno + ", csDate=" + csDate + ", subtitle="
				+ subtitle + ", context=" + context + "]";
	}
	
	
}
