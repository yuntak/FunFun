package funfun.jdbc.dto;

import java.util.List;

public class Users {
	private String id;
	private String nickname;
	private String pass;
	private String email;
	private String cellphone;
	private String address;
	private String mail_no;
	private String roll;
	
	private List<FBoard> fboards;

	
	
	
	
	public Users() {
		super();
	}

	public Users(String id, String nickname, String pass, String email, String cellphone, String address,
			String mail_no, String roll, List<Board> boards) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.pass = pass;
		this.email = email;
		this.cellphone = cellphone;
		this.address = address;
		this.mail_no = mail_no;
		this.roll = roll;
		this.fboards = fboards;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMail_no() {
		return mail_no;
	}

	public void setMail_no(String mail_no) {
		this.mail_no = mail_no;
	}

	public String getRoll() {
		return roll;
	}

	public void setRoll(String roll) {
		this.roll = roll;
	}

	public List<FBoard> getFBoards() {
		return fboards;
	}

	public void setFBoards(List<FBoard> fboards) {
		this.fboards = fboards;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", nickname=" + nickname + ", pass=" + pass + ", email=" + email + ", cellphone="
				+ cellphone + ", address=" + address + ", mail_no=" + mail_no + ", roll=" + roll + ", fboards=" + fboards
				+ "]";
	}

	
}
