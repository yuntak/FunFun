package funfun.jdbc.dto;

import java.util.Date;
import java.util.List;

public class CBoard {
	final public static String CONTENTBOARD_CODE="22";
	
	private int cno;
	private String title;
	private String content;
	private Date cdate;
	private Date subdate;
	private int cview;
	private int good;
	private String category;
	private int board_no;
	private String board_code;
	private String userId;
	private String imgData;
	
	private List<CBoard_sub> cboard_sub;
	
	public List<CBoard_sub> getCboard_sub() {
		return cboard_sub;
	}

	public void setCboard_sub(List<CBoard_sub> cboard_sub) {
		this.cboard_sub = cboard_sub;
	}

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

	public Date getSubdate() {
		return subdate;
	}

	public void setSubdate(Date subdate) {
		this.subdate = subdate;
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

	public String getImgData() {
		return imgData;
	}

	public void setImgData(String imgData) {
		this.imgData = imgData;
	}

	public List<Reply> getReplys() {
		return replys;
	}

	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}

	@Override
	public String toString() {
		return "CBoard [cno=" + cno + ", title=" + title + ", content=" + content + ", cdate=" + cdate + ", subdate="
				+ subdate + ", cview=" + cview + ", good=" + good + ", category=" + category + ", board_no=" + board_no
				+ ", board_code=" + board_code + ", userId=" + userId + ", imgData=" + imgData + ", cboard_sub="
				+ cboard_sub + ", replys=" + replys + "]";
	}

}
