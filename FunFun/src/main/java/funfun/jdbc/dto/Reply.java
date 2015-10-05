package funfun.jdbc.dto;

import java.util.Date;

public class Reply {

	private int rno;
	private String context;
	private Date rdate;
	private int boardNo;
	private String boardCode;
	private String userId;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Reply [rno=" + rno + ", context=" + context + ", rdate=" + rdate + ", boardNo=" + boardNo
				+ ", boardCode=" + boardCode + ", userId=" + userId + "]";
	}
}
