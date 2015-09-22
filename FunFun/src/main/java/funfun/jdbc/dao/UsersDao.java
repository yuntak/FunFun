package funfun.jdbc.dao;

import java.util.List;
import java.util.Map;

import funfun.jdbc.dto.Users;

public interface UsersDao {
	public int getAllUsersCount();
	public String getUserPasswordById(String id);
	public String checkId(String id);
	public String checkNickname(String id);
	public String checkEmail(String id);
	public String getUserIdById(String id);
	public Map<String,Object> getUserMapById(String id);
	public List<Map<String,Object>> getAllUsersMap();
	public Users selectUser(String id);
	public List<Users> getAllUsersList();
	public Map<String, Object> loginUsers(String id, String pass);
	//public Users selectFullUser(String id);
	public int insertUser(Users user);
	public int updateUser(Users user);
	public int updatePass(Users user);
	public int getUsersIdCount(String id);
	public int deleteUser(String id);
	public int deleteAllUsers();
	public int updateRoll(Users user);
	
}
