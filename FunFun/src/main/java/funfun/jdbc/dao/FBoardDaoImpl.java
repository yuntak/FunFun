package funfun.jdbc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Reply;

@Repository
public class FBoardDaoImpl implements FBoardDao {
	private static Logger logger = LoggerFactory.getLogger(FBoardDaoImpl.class);
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
		String sql = "insert into free_board(fno,title,fcontext,fview,board_no,board_code,user_id,nickname) values(seq_free_board.nextval,?,?,?,seq_board.currval,11,?,?)";
		int result = jt.update(sql, fboard.getTitle(), fboard.getFcontext(), fboard.getFview(), fboard.getUserId(),fboard.getNickName());
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
				fboard.setFcontext(rs.getString("fcontext"));
				fboard.setFdate(rs.getDate("fdate"));
				fboard.setFview(rs.getInt("fview"));
				fboard.setBoardNo(rs.getInt("board_no"));
				fboard.setBoardCode(rs.getString("board_code"));
				fboard.setUserId(rs.getString("user_id"));
				fboard.setNickName(rs.getString("nickname"));
				return fboard;
			}
		};
	}

	
	@Override
	public int updateFBoard(FBoard fboard) {
		int result=-1;
		String sql = "update free_board set title=?, fcontext=? where fno=?";
		result = jt.update(sql,fboard.getTitle(),fboard.getFcontext(),fboard.getFno());
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

	@Override
	public List<FBoard> selectFBoardByTitle(String title) { 
		String sql = "select * from free_board where title like '%'||?||'%'";
		List<FBoard> result = jt.query(sql, new BeanPropertyRowMapper<FBoard>(FBoard.class),title);
		return result;
	}

	@Override
	public int getBoardPageCount() {
		String sql = "select count(*) from free_board";
		int result = jt.queryForObject(sql, Integer.class);
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
	public FBoard selectFullFBoard(int no) {
		String sql = "select * from free_board where fno=?";
		FBoard fboard = jt.queryForObject(sql, getFBoardRowMapper(), no); 
		logger.trace("Dao : {}",fboard);
		return fboard;
	}

	@Override
	public List<FBoard> selectFBoardByPage(String code, int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from free_board order by fno desc) sub) WHERE RNUM >= ? AND RNUM <= ? and board_code=?";
		List<FBoard> result = jt.query(sql, new BeanPropertyRowMapper<FBoard>(FBoard.class),
				(page_no - 1) * FBoardDao.BOARD_PER_PAGE + 1, page_no * FBoardDao.BOARD_PER_PAGE,code);
		return result;
	}
	

	@Override
	public List<FBoard> selectFBoardBySelectNicknamePage(String nickname, String code, int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from free_board where nickname like '%'||?||'%' and board_code=? order by fno desc) sub) WHERE RNUM >= ? AND RNUM <= ?";
		List<FBoard> result = jt.query(sql, new BeanPropertyRowMapper<FBoard>(FBoard.class), nickname, code,
				(page_no - 1) * FBoardDao.BOARD_PER_PAGE + 1, page_no * FBoardDao.BOARD_PER_PAGE);
		return result;
	}

	@Override
	public List<FBoard> selectFBoardBySelectTitlePage(String title, String code, int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from free_board where title like '%'||?||'%' and board_code=? order by fno desc) sub) WHERE RNUM >= ? AND RNUM <= ?";
		List<FBoard> result = jt.query(sql, new BeanPropertyRowMapper<FBoard>(FBoard.class), title, code,
				(page_no - 1) * FBoardDao.BOARD_PER_PAGE + 1, page_no * FBoardDao.BOARD_PER_PAGE);
		return result;
	}
	
	@Override
	public List<FBoard> selectFBoardBySelectContextPage(String context, String code, int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from free_board where fcontext like '%'||?||'%' and board_code=? order by fno desc) sub) WHERE RNUM >= ? AND RNUM <= ?";
		List<FBoard> result = jt.query(sql, new BeanPropertyRowMapper<FBoard>(FBoard.class), context, code,
				(page_no - 1) * FBoardDao.BOARD_PER_PAGE + 1, page_no * FBoardDao.BOARD_PER_PAGE);
		return result;
	}
	@Override
	public int selectFBoardByTitleAllPage(String title,String code) {
		String sql = "select count(*) from free_board where title like '%'||?||'%' and board_code=? order by fno desc";
		int countresult = jt.queryForObject(sql, Integer.class,title,code);
		int result = (int)Math.ceil(countresult/(double)FBoardDao.BOARD_PER_PAGE);
		return result;
	}
	
	@Override
	public int selectFBoardByNicknameAllPage(String nickname,String code) {
		String sql = "select count(*) from free_board where nickname like '%'||?||'%' and board_code=? order by fno desc";
		int countresult = jt.queryForObject(sql, Integer.class,nickname,code);
		int result = (int)Math.ceil(countresult/(double)FBoardDao.BOARD_PER_PAGE);
		return result;
	}
	
	@Override
	public int selectFBoardByContextAllPage(String context, String code) {
		String sql = "select count(*) from free_board where fcontext like '%'||?||'%' and board_code=? order by fno desc";
		int countresult = jt.queryForObject(sql, Integer.class,context,code);
		int result = (int)Math.ceil(countresult/(double)FBoardDao.BOARD_PER_PAGE);
		return result;
	}
	
	@Override
	public int selectCount(int to, int from) {
		String sql = "SELECT count(*) FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from free_board order by fno desc) sub) WHERE RNUM >= ? AND RNUM <= ?";
		int result = jt.queryForObject(sql, Integer.class, to, from);
		return result;
	}

	@Override
	public int selectCountAllPage() {
		String sql = "select count(*) from free_board";
		int countresult = jt.queryForObject(sql, Integer.class);
		int result = (int)Math.ceil(countresult/(double)FBoardDao.BOARD_PER_PAGE);
		return result;
	}

	@Override
	public String selectNickname(int no) {
		String sql = "select nickname from free_board where fno=?";
		String result = jt.queryForObject(sql, String.class,no);
		return result;
	}

	@Override
	public int updateFBoardVeiw(int no) {
		String sql2 = "select fview from free_board where fno=?";
		int selectresult = jt.queryForObject(sql2, Integer.class,no);
		String sql = "update free_board set fview=? where fno=?";
		int updateresult = jt.update(sql,selectresult+1,no);
		return updateresult;
	}

	
	
}
