package funfun.jdbc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import funfun.jdbc.dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;

	@Override
	public List<Map<String, Object>> SelectBoardByCode(String code) {
		String sql = "select * from Board where code=?";
		List<Map<String, Object>> results = jt.queryForList(sql, code);
		return results;
	}

	@Override
	public Board selectBoard(int no) {
		String sql = "select * from Board where no=?";
		Board result = jt.queryForObject(sql, getBoardRowMapper(), no);
		return result;
	}

	private RowMapper<Board> getBoardRowMapper() {
		return new RowMapper<Board>() {

			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board = new Board();
				board.setCode(rs.getString("code"));
				board.setNo(rs.getInt("no"));
				return board;
			}
		};
	}

	@Override
	public int insertBoard(Board board) {
		int result;
		String sql = "insert into Board values(seq_board.nextval,?,?)";
		result = jt.update(sql, board.getCode(), board.getUserId());
		return result;
	}

	@Override
	public int deleteBoard(int no) {
		int result = -1;
		String sql = "delete from board where no=?";
		result = jt.update(sql, no);
		return result;

	}

}
