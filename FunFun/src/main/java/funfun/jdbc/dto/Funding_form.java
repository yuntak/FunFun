package funfun.jdbc.dto;

public class Funding_form {
	private int ffno;
	private String subject;
	private String category;
	private String ffContext;
	private String tel;
	private String money;
	private String userId;
	private String receive;
	private int funding_fno;
	
	public int getFunding_fno() {
		return funding_fno;
	}
	public void setFunding_fno(int funding_fno) {
		this.funding_fno = funding_fno;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	public int getFfno() {
		return ffno;
	}
	public void setFfno(int ffno) {
		this.ffno = ffno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFfContext() {
		return ffContext;
	}
	public void setFfContext(String ffContext) {
		this.ffContext = ffContext;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Funding_form [ffno=" + ffno + ", subject=" + subject + ", category=" + category + ", ffContext="
				+ ffContext + ", tel=" + tel + ", money=" + money + ", userId=" + userId + ", receive=" + receive
				+ ", funding_fno=" + funding_fno + "]";
	}
	
	
}
