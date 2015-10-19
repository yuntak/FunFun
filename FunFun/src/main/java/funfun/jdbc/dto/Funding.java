package funfun.jdbc.dto;

import java.util.Date;
import java.util.List;

public class Funding {
	private int fno;
	private String title;
	private double goal;
	//목표금액
	private String FContent;
	//펀딩 리스트 이미지
	private String FContext;
	//펀딩 리스트 내용
	private double money;
	private String context;
	//펀딩 내용
	private String userId;
	private Date startDate;
	private Date endDate;
	private int ok;
	private String nickName;
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getOk() {
		return ok;
	}

	public void setOk(int ok) {
		this.ok = ok;
	}

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

	public double getGoal() {
		return goal;
	}

	public void setGoal(double goal) {
		this.goal = goal;
	}

	public String getFContent() {
		return FContent;
	}

	public void setFContent(String fContent) {
		FContent = fContent;
	}

	public String getFContext() {
		return FContext;
	}

	public void setFContext(String fContext) {
		FContext = fContext;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public List<Reply> getReplys() {
		return replys;
	}

	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}

	@Override
	public String toString() {
		return "Funding [fno=" + fno + ", title=" + title + ", goal=" + goal + ", FContent=" + FContent + ", FContext="
				+ FContext + ", money=" + money + ", context=" + context + ", userId=" + userId + ", startDate="
				+ startDate + ", endDate=" + endDate + ", ok=" + ok + ", nickName=" + nickName + ", replys=" + replys
				+ "]";
	}

	
}
