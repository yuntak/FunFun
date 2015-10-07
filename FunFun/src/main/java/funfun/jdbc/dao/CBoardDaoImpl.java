package funfun.jdbc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import funfun.jdbc.dto.CBoard;
import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Reply;

@Repository
public class CBoardDaoImpl implements CBoardDao {

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;
	@Override
	public int insertCBoard(CBoard cboard) {
		String sql = "insert into content_board(cno,title,content,cview,good,category,board_no,board_code,user_id,imgdata) values(seq_content_board.nextval,?,?,?,?,?,seq_board.currval,?,?,?,?)";
		int result = jt.update(sql,cboard.getTitle(),cboard.getContent(),cboard.getCview(),cboard.getGood(),cboard.getCategory(),cboard.getBoard_code(),cboard.getUserId(),cboard.getImgData());
		return result;
	}
	@Override
	public int deleteCBoard(int cno) {
		String sql = "delete from content_board where cno=?";
		int result = jt.update(sql,cno);
		return result;
	}
	@Override
	public int updateCBoard(CBoard cboard) {
		String sql = "update content_board set title=?,content=?,imgdata=? where cno=?";
		int result =jt.update(sql,cboard.getTitle(),cboard.getContent(),cboard.getImgData(),cboard.getCno());
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
	@Override
	public List<CBoard> selectCBoardByPage(String code, int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from content_board order by cdate) sub) WHERE RNUM >= ? AND RNUM <= ? and board_code=?";
		List<CBoard> result = jt.query(sql, new BeanPropertyRowMapper<CBoard>(CBoard.class),
				(page_no - 1) * FBoardDao.BOARD_PER_PAGE + 1, page_no * FBoardDao.BOARD_PER_PAGE,code);
		return result;
	}
	@Override
	public int updateCBoardVeiw(int cno) {
		String sql2 = "select cview from content_board where cno=?";
		int selectresult = jt.queryForObject(sql2, Integer.class,cno);
		String sql = "update content_board set cview=? where cno=?";
		int updateresult = jt.update(sql,selectresult+1,cno);
		return updateresult;
	}
	@Override
	public int updateCBoardGood(int cno) {
		String sql2 = "select good from content_board where cno=?";
		int selectresult = jt.queryForObject(sql2, Integer.class,cno);
		String sql = "update content_board set good=? where cno=?";
		int updateresult = jt.update(sql,selectresult+1,cno);
		return updateresult;
	}
	@Override
	public List<CBoard> selectCBoardByCategoryPage(String category, String code, int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from content_board where category=? order by cdate) sub) WHERE RNUM >= ? AND RNUM <= ? and board_code=?";
		List<CBoard> result = jt.query(sql, new BeanPropertyRowMapper<CBoard>(CBoard.class),
				category,(page_no - 1) * FBoardDao.BOARD_PER_PAGE + 1, page_no * FBoardDao.BOARD_PER_PAGE,code);
		return result;
	}
	private RowMapper<Reply> getReplyRowMapper() {
		return new RowMapper<Reply>() {

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
			}
		};
	}

	@Override
	public CBoard selectFullCBoard(int cno) {
		String sql = "select c.*,r.* from content_board c,reply r where r.user_id=c.user_id and c.cno=?";
		CBoard cboard = jt.query(sql, new ResultSetExtractor<CBoard>() {

			@Override
			public CBoard extractData(ResultSet rs) throws SQLException, DataAccessException {
				CBoard cboard = null;
				List<Reply> replys = null;
				if (rs.next()) {
					cboard = getCBoardRowMapper().mapRow(rs, 0);
					replys = new ArrayList<>();
					cboard.setReplys(replys);
					do {
						Reply board = getReplyRowMapper().mapRow(rs, 0);
						replys.add(board);
					} while (rs.next());
				}
				return cboard;
			}
		}, cno);

		return cboard;
	}
	
	
}
