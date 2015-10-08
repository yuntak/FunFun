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

import funfun.jdbc.dto.CBoard_sub;
@Repository
public class CBoard_subDaoImpl implements CBoard_subDao {

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;
	
	@Override
	public int insertCBoardSub(CBoard_sub sub) {
		String sql = "insert into content_board_sub(no,content_board_cno,subtitle,context) values(?,?,?,?)";
		int result = jt.update(sql,sub.getNo(),sub.getContentBoardCno(),sub.getSubtitle(),sub.getContext());
		return result;
	}

	@Override
	public int deleteCBoardSub(int no, int contentBoardCno) {
		String sql = "delete from content_board_sub where no=? and content_board_cno=?";
		int result = jt.update(sql,no,contentBoardCno);
		return result;
	}

	@Override
	public int updateCBoardSub(CBoard_sub sub) {
		String sql = "update content_board_sub set subtitle=?,context=? where no=? and content_board_cno=?";
		int result = jt.update(sql,sub.getSubtitle(),sub.getContext(),sub.getNo(),sub.getContentBoardCno());
		return result;
	}

	@Override
	public int selectCountCno(int cno) {
		String sql = "select count(*) from (select c.*,cs.* from content_board c,content_board_sub cs where c.cno=cs.content_board_cno and content_board_cno=?)";
		int result = jt.queryForObject(sql,Integer.class,cno);
		return result;
	}

	@Override
	public List<CBoard_sub> selectCBoardSubByPage(int cno, int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from content_board_sub where content_board_cno=? order by no) sub) WHERE RNUM >= ? AND RNUM <= ?";
		List<CBoard_sub> result = jt.query(sql, new BeanPropertyRowMapper<CBoard_sub>(CBoard_sub.class),
				cno,(page_no - 1) * CBoard_subDao.BOARD_PER_PAGE + 1, page_no * CBoard_subDao.BOARD_PER_PAGE);
		return result;
	}

	@Override
	public CBoard_sub selectCBoardBycno(int no,int cno) {
		String sql = "select * from content_board_sub where no=? and content_board_cno=?";
		CBoard_sub result = jt.queryForObject(sql, getCBoardSubRowMapper(),no,cno);
		return result;
	}
	
	private RowMapper<CBoard_sub> getCBoardSubRowMapper(){
		return new RowMapper<CBoard_sub>(){

			@Override
			public CBoard_sub mapRow(ResultSet rs, int rowNum) throws SQLException {
				CBoard_sub sub = new CBoard_sub();
				sub.setNo(rs.getInt("no"));
				sub.setContentBoardCno(rs.getInt("content_board_cno"));
				sub.setCsDate(rs.getDate("cs_date"));
				sub.setSubtitle(rs.getString("subtitle"));
				sub.setContext(rs.getString("context"));
				return sub;
			}};
	}

}
