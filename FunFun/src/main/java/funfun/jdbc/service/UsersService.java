package funfun.jdbc.service;

import java.util.Map;

import funfun.jdbc.dto.Users;

public interface UsersService {
	void update(Users user);
	String PassById(Users user);
    String IdById(Users user);
    String checkId(String id);
    String checkNickname(String id);
    String checkEmail(String id);
    
	 int IdConfirm(String id);
	int insert(Users user);
	void delete(String id);
	void updatePass(Users user);
	Map<String, Object> loginUsers(String id, String pass);
	public Users mylogin(String id,String pass);
}
