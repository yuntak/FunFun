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
import funfun.jdbc.dto.Funding;

@Repository
public class FundingDaoImpl implements FundingDao {

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;

	@Override
	public int insertFunding(Funding funding) {
		String sql = "insert into funding values(seq_funding.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
		int insertresult = jt.update(sql, funding.getTitle(), funding.getGoal(), funding.getFContent(),
				funding.getFContext(), funding.getMoney(), funding.getContext(), funding.getStartDate(),
				funding.getEndDate(), funding.getUserId(),funding.getOk(),funding.getNickName(),funding.getReceive());
		return insertresult;
	}

	@Override
	public int deleteFunding(int fno) {
		String sql = "delete from funding where fno=?";
		int deleteresult = jt.update(sql, fno);
		return deleteresult;
	}

	@Override
	public int updateFunding(Funding funding) {
		String sql = "update funding set title=?,f_content=?,f_context=?,goal=?,money=?,context=?,receive=? where fno=?";
		int updateresult = jt.update(sql, funding.getTitle(), funding.getFContent(), funding.getFContext(),
				funding.getGoal(), funding.getMoney(), funding.getContext(),funding.getReceive(), funding.getFno());
		return updateresult;
	}

	@Override
	public int updateFundingMoney(Funding funding) {
		String sql1 = "select money from funding where fno=? where ok=11";
		int selectresult = 0;
		try {
			selectresult = jt.queryForObject(sql1, Integer.class, funding.getFno());
		} catch (EmptyResultDataAccessException e) {
			selectresult = 0;
		}
		String sql = "update funding set money=? where fno=?";
		int updateresult = jt.update(sql, funding.getMoney() + selectresult, funding.getFno());
		return updateresult;
	}

	@Override
	public int updateFundingDate(Funding funding) {
		String sql = "update funding set startdate=?,enddate=? where fno=?";
		int updateresult = jt.update(sql,funding.getStartDate(),funding.getEndDate(),funding.getFno());
		return updateresult;
	}

	@Override
	public int selectCountAllPage() {
		String sql = "select count(*) from funding where ok=11";
		int countresult = jt.queryForObject(sql, Integer.class);
		int result = (int)Math.ceil(countresult/(double)9);
		return result;
	}

	@Override
	public List<Funding> selectFundingByPage(int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from funding where ok=11 order by fno desc) sub) WHERE RNUM >= ? AND RNUM <= ?";
		List<Funding> result = jt.query(sql, new BeanPropertyRowMapper<Funding>(Funding.class),
				(page_no - 1) * FundingDao.BOARD_PER_PAGE + 1, page_no * FundingDao.BOARD_PER_PAGE);
		return result;
	}

	@Override
	public List<Funding> selectFundingTitleByPage(String title, int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from funding where title like '%'||?||'%' and ok=11 order by fno desc) sub) WHERE RNUM >= ? AND RNUM <= ?";
		List<Funding> result = jt.query(sql, new BeanPropertyRowMapper<Funding>(Funding.class), title,
				(page_no - 1) * FundingDao.BOARD_PER_PAGE + 1, page_no * FundingDao.BOARD_PER_PAGE);
		return result;
	}

	@Override
	public Funding selectFunding(int fno) {
		String sql = "select * from funding where fno=? and ok=11";
		Funding result = jt.queryForObject(sql,getFundingRowMapper(), fno);
		return result;
	}
	
	private RowMapper<Funding> getFundingRowMapper() {
		return new RowMapper<Funding>() {

			@Override
			public Funding mapRow(ResultSet rs, int rowNum) throws SQLException {
				Funding funding = new Funding();
				funding.setFno(rs.getInt("fno"));
				funding.setTitle(rs.getString("title"));
				funding.setGoal(rs.getDouble("goal"));
				funding.setFContent(rs.getString("f_content"));
				funding.setFContext(rs.getString("f_context"));
				funding.setMoney(rs.getDouble("money"));
				funding.setContext(rs.getString("context"));
				funding.setStartDate(rs.getDate("startdate"));
				funding.setEndDate(rs.getDate("enddate"));
				funding.setUserId(rs.getString("user_id"));
				funding.setOk(rs.getInt("ok"));
				funding.setReceive(rs.getString("receive"));
				return funding;
			}
		};
	}

}
