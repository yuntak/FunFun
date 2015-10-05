package funfun.jdbc.dto;

import java.util.Date;
import java.util.List;

public class CBoard {
	private int cno;
	private String title;
	private String content;
	private Date cdate;
	private int cview;
	private int good;
	private String category;
	private int board_no;
	private String board_code;
	private String userId;
	
	private List<Reply> replys;

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public int getCview() {
		return cview;
	}

	public void setCview(int cview) {
		this.cview = cview;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_code() {
		return board_code;
	}

	public void setBoard_code(String board_code) {
		this.board_code = board_code;
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

	@Override
	public String toString() {
		return "CBoard [cno=" + cno + ", title=" + title + ", content=" + content + ", cdate=" + cdate + ", cview="
				+ cview + ", good=" + good + ", category=" + category + ", board_no=" + board_no + ", board_code="
				+ board_code + ", userId=" + userId + ", replys=" + replys + "]";
	}
	
	
}
