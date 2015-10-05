package funfun.jdbc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import funfun.jdbc.dto.CBoard;
import funfun.jdbc.dto.FBoard;

@Repository
public class CBoardDaoImpl implements CBoardDao {

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;
	@Override
	public int insertCBoard(CBoard cboard) {
		String sql = "insert into content_board(cno,title,content,cview,good,category,board_no,board_code,user_id) values(seq_content_board.nextval,?,?,?,?,?,seq_board.currval,?,?)";
		int result = jt.update(sql,cboard.getTitle(),cboard.getContent(),cboard.getCview(),cboard.getGood(),cboard.getCategory(),cboard.getBoard_code(),cboard.getUserId());
		return result;
	}
	@Override
	public int deleteCBoard(String user_id) {
		String sql = "delete from content_board where user_id=?";
		int result = jt.update(sql,user_id);
		return result;
	}
	@Override
	public int updateCBoard(CBoard cboard) {
		String sql = "update content_board set title=?,content=? where cno=?";
		int result =jt.update(sql,cboard.getTitle(),cboard.getContent(),cboard.getCno());
		return result;
	}
	@Override
	public CBoard selectCBoard(int cno) {
		String sql = "select * from content_board where cno=?";
		CBoard result = jt.queryForObject(sql,getCBoardRowMapper(),cno);
		return result;
	}
	
	private RowMapper<CBoard> getCBoardRowMapper(){
		return new RowMapper<CBoard>(){

			@Override
			public CBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
				CBoard cboard = new CBoard();
				cboard.setCno(rs.getInt("fno"));
				cboard.setTitle(rs.getString("title"));
				cboard.setContent(rs.getString("fcontext"));
				cboard.setCdate(rs.getDate("fdate"));
				cboard.setCview(rs.getInt("fview"));
				cboard.setGood(rs.getInt("good"));
				cboard.setCategory(rs.getString("category"));
				cboard.setBoard_no(rs.getInt("board_no"));
				cboard.setBoard_code(rs.getString("board_code"));
				cboard.setUserId(rs.getString("user_id"));
				return cboard;
			}};
	}
	
	
}
