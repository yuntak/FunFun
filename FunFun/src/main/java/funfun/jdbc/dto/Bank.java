package funfun.jdbc.dto;

public class Bank {
	private int bno;
	private int fno;
	private String userId;
	private double money;
	public int getFno() {
		return fno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "Bank [bno=" + bno + ", fno=" + fno + ", userId=" + userId + ", money=" + money + "]";
	}

}
