package funfun.jdbc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import funfun.jdbc.dto.Users;

@Repository
public class UsersDaoImpl implements UsersDao {
	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;
	@Override
	public int getAllUsersCount() {
		String sql = "select count(*) from users";
		int result = jt.queryForObject(sql, Integer.class);
		return result;
	}
	@Override
	public String getUserPasswordById(String id) {
		String sql = "select pass from users where id=?";
		String pass = jt.queryForObject(sql, String.class,id);
		return pass;
	}
	@Override
	public Map<String, Object> getUserMapById(String id) {
		String sql = "select nickname,pass from users where id=?";
		Map<String, Object> result=jt.queryForMap(sql,id);
		return result;
	}
	@Override
	public List<Map<String, Object>> getAllUsersMap() {
		String sql = "select * from users";
		List<Map<String, Object>> result=jt.queryForList(sql);
		return result;
	}
	@Override
	public Users selectUser(String id) {
		String sql = "select * from users where id=?";
		Users users = jt.queryForObject(sql,getUsersRowMapper(),id);
		return users;
	}
	@Override
	public List<Users> getAllUsersList() {
		String sql = "select * from users";
		List<Users> users = jt.query(sql,new BeanPropertyRowMapper<Users>(Users.class));
		return users;
	}
	
	private RowMapper<Users> getUsersRowMapper(){
		return new RowMapper<Users>(){

			@Override
			public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
				Users user = new Users();
				user.setNickname(rs.getString("nickname"));
				user.setPass(rs.getString("pass"));
				return user;
			}};
	}
	/*private RowMapper<Board> getBoardRowMapper(){
		return new RowMapper<Board>(){

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setCommentContent(rs.getString("comment_content"));
				board.setCommentNo(rs.getInt("comment_no"));
				board.setRegDate(rs.getDate("reg_date"));
				board.setUserId(rs.getString("user_id"));
				return board;
			}};
	}
	@Override
	public Users selectFullUser(String id) {
		String sql = "select u.*,b.* from users u,board b where u.id=b.id and u.id=?";
		Users user = jt.query(sql, new ResultSetExtractor<Users>(){

			@Override
			public Users extractData(ResultSet rs) throws SQLException, DataAccessException {
				Users user = null;
				List<Board> boards=null;
				if(rs.next()){
					user = getUsersRowMapper().mapRow(rs, 0);
					boards = new ArrayList<>();
					user.setBoards(boards);
					do{
						Board board = getBoardRowMapper().mapRow(rs, 0);
						boards.add(board);
					}while(rs.next());
				}
				return user;
			}},id);
		
		return user;
	}*/
	@Override
	public int insertUser(Users user) {
		int result=-1;
		String sql = "insert into users values(?,?,?,?,?,?,?,?)";
		result = jt.update(sql,user.getId(),user.getNickname(),user.getPass(),user.getEmail(),user.getCellphone(),user.getAddress(),user.getMail_no(),user.getRoll());
		return result;
	}
	
	@Override
	public int updateUser(Users user) {
		int result=-1;
		String sql = "update users set nickname=?, cellphone=?, address=?, email=? where id=?";
		result = jt.update(sql,user.getNickname(),user.getCellphone(), user.getAddress(),user.getEmail(),user.getId());
		return result;
	}
	
	@Override
	public int updatePass(Users user) {
		int result=-1;
		String sql = "update users set pass=? where id=?";
		result = jt.update(sql,user.getPass(),user.getId());
		return result;
	}
	
	@Override
	public int deleteUser(String id) {
		int result=-1;
		String sql = "delete from users where id=?";
		result = jt.update(sql,id);
		return result;
	}
	@Override
	public int deleteAllUsers() {
		String sql="delete from users";
		int result = jt.update(sql);
		return result;
	}
	@Override
	public String getUserIdById(String id) {
		String sql = "select id from users where id=?";
		String nId = jt.queryForObject(sql, String.class,id);
		return nId;
		
	}
	@Override
	public int getUsersIdCount(String id) {
		String sql ="select count(*) from users where id=?";
		int result = jt.queryForObject(sql, Integer.class,id);
		return result;
	}
	@Override
	public String checkId(String id) {
		String sql = "select id from users where id=?";
		String cId = jt.queryForObject(sql, String.class,id);
		return cId;
	}
	@Override
	public String checkNickname(String id) {
		String sql = "select id from users where nickname=?";
		String cNickName = jt.queryForObject(sql, String.class,id);
		return cNickName;
	}
	@Override
	public String checkEmail(String id) {
		String sql = "select id from users where email=?";
		String cEmail = jt.queryForObject(sql, String.class,id);
		return cEmail;
	}
	@Override
	public Map<String, Object> loginUsers(String id, String pass) {
		String sql = "select * from users where id=? and pass=?";
		Map<String, Object> value = jt.queryForMap(sql,id,pass);
		return value;
	}
	@Override
	public int updateRoll(Users user) {
		int result=-1;
		String sql = "update users set roll=? where id=?";
		result = jt.update(sql,user.getRoll(),user.getId());
		return result;
	}
	
		
}
