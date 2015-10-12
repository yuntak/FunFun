package funfun.jdbc.dto;

import java.util.Date;
import java.util.List;

public class FBoard {
	final public static String FREEBOARD_CODE="11";
	
	private int fno;
	private String title;
	private String fcontext;
	private Date fdate;
	private int fview;
	private int boardNo;
	private String boardCode;
	private String userId;
	private String nickName;

	private List<Reply> replys;

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFcontext() {
		return fcontext;
	}

	public void setFcontext(String fcontext) {
		this.fcontext = fcontext;
	}

	public Date getFdate() {
		return fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	public int getFview() {
		return fview;
	}

	public void setFview(int fview) {
		this.fview = fview;
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

	public List<Reply> getReplys() {
		return replys;
	}

	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "FBoard [fno=" + fno + ", title=" + title + ", fcontext=" + fcontext + ", fdate=" + fdate + ", fview="
				+ fview + ", boardNo=" + boardNo + ", boardCode=" + boardCode + ", userId=" + userId + ", replys="
				+ replys + "]";
	}

}