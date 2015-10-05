package funfun.jdbc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
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
		Reply result = jt.queryForObject(sql,getReplyRowMapper(), rno);
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
				return reply;
			}};
	}

	@Override
	public int insertReply(Reply reply) {
		String sql = "insert into reply(rno,context,board_no,board_code,user_id) values(?,?,?,?,?)";
		int result = jt.update(sql, reply.getRno(),reply.getContext(),reply.getBoardNo(),reply.getBoardCode(),reply.getUserId());
		return result;
	}

	@Override
	public Reply selectBoardReply(int board_no, String board_code) {
		String sql = "select * from reply where board_no=? and board_code=?";
		Reply result = jt.queryForObject(sql, getReplyRowMapper(),board_no,board_code);
		return result;
	}

}
