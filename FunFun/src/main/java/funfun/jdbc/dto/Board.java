package funfun.jdbc.dto;

public class Board {
	   private int no;
	   private String code;
	   private String userId;
	   
	   public int getNo() {
	      return no;
	   }
	   public void setNo(int no) {
	      this.no = no;
	   }
	   public String getCode() {
	      return code;
	   }
	   public void setCode(String code) {
	      this.code = code;
	   }
	   public String getUserId() {
	      return userId;
	   }
	   public void setUserId(String userId) {
	      this.userId = userId;
	   }
	   @Override
	   public String toString() {
	      return "Board [no=" + no + ", code=" + code + ", userId=" + userId + "]";
	   }
	
	}