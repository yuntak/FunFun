package funfun.jdbc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Reply;
@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;
	
	@Override
	public Reply selectReply(int rno) {
		String sql = "select * from reply where rno=?";
		Reply result=null;
		try{
		result = jt.queryForObject(sql,getReplyRowMapper(), rno);
		}catch(EmptyResultDataAccessException e){
			result=null;
		}
		return result;
	}
	
	private RowMapper<Reply> getReplyRowMapper(){
		return new RowMapper<Reply>(){

			@Override
			public Reply mapRow(ResultSet rs, int rowNum) throws SQLException {
				Reply reply = new Reply();
				reply.setRno(rs.getInt("rno"));
				reply.setContext(rs.getString("context"));
				reply.setRdate(rs.getDate("rdate"));
				reply.setBoardNo(rs.getInt("board_no"));
				reply.setBoardCode(rs.getString("board_code"));
				reply.setUserId(rs.getString("user_id"));
				reply.setNickname(rs.getString("nickname"));
				return reply;
			}};
	}

	@Override
	public int insertReply(Reply reply) {
		String sql = "insert into reply(rno,context,board_no,board_code,user_id,nickname) values(seq_reply.nextval,?,?,?,?,?)";
		int result = jt.update(sql,reply.getContext(),reply.getBoardNo(),reply.getBoardCode(),reply.getUserId(),reply.getNickname());
		return result;
	}

	@Override
	public List<Reply> selectBoardReply(int board_no, String board_code) {
		String sql = "select * from reply where board_no=? and board_code=?";
		List<Reply> result = jt.query(sql, new BeanPropertyRowMapper<Reply>(Reply.class),board_no,board_code);
		return result;
	}

}
