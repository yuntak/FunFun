package funfun.jdbc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import funfun.jdbc.dto.FBoard;

@Repository
public class FBoardDaoImpl implements FBoardDao {

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;

	@Override
	public int getBoardCount() {
		String sql = "select count(*) from free_board";
		int result = jt.queryForObject(sql, Integer.class);
		return result;
	}

	@Override
	public int insertFBoard(FBoard fboard) {
		String sql = "insert into free_board(fno,title,fcontext,fview,board_no,board_code,user_id) values(seq_free_board.nextval,?,?,?,seq_board.currval,?,?)";
		int result = jt.update(sql, fboard.getTitle(), fboard.getFContext(), fboard.getFview(),fboard.getBoardCode(), fboard.getUserId());
		return result;
	}

	@Override
	public int deleteFBoard(String userId) {
		String sql = "delete from free_board where user_id=?";
		int result = jt.update(sql, userId);
		return result;
	}
	@Override
	public int deleteFBoardByFno(int fno) {
		String sql = "delete from free_board where fno=?";
		int result = jt.update(sql, fno);
		return result;
	}

	@Override
	public FBoard selectFBoard(int no) {
		String sql = "select * from free_board where fno=?";
		FBoard result = jt.queryForObject(sql, getFBoardRowMapper(), no);
		return result;
	}

	private RowMapper<FBoard> getFBoardRowMapper() {
		return new RowMapper<FBoard>() {

			@Override
			public FBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
				FBoard fboard = new FBoard();
				fboard.setFno(rs.getInt("fno"));
				fboard.setTitle(rs.getString("title"));
				fboard.setFContext(rs.getString("fcontext"));
				fboard.setFdate(rs.getDate("fdate"));
				fboard.setFview(rs.getInt("fview"));
				fboard.setBoardNo(rs.getInt("board_no"));
				fboard.setBoardCode(rs.getString("board_code"));
				fboard.setUserId(rs.getString("user_id"));
				return fboard;
			}
		};
	}

	
	@Override
	public int updateFBoard(FBoard fboard) {
		int result=-1;
		String sql = "update free_board set title=?, fcontext=? where fno=?";
		result = jt.update(sql,fboard.getTitle(),fboard.getFContext(),fboard.getFno());
		return result;
	}

	@Override
	   public List<FBoard> selectFBoardByCode(int board_no,String board_code) {
	      String sql = "select * from free_board where board_no=? and board_code=?";
	      List<FBoard> result = jt.query(sql,new BeanPropertyRowMapper<FBoard>(FBoard.class), board_no,board_code);
	      return result;
	   }
	
	@Override
	   public List<FBoard> selectFBoardById(String userId) {
	      String sql = "select * from free_board where user_id=?";
	      List<FBoard> result = jt.query(sql,new BeanPropertyRowMapper<FBoard>(FBoard.class),userId);
	      return result;
	   }
}
