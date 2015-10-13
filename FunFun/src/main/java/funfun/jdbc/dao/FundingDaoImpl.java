package funfun.jdbc.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import funfun.jdbc.dto.Funding;

@Repository
public class FundingDaoImpl implements FundingDao {

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;

	@Override
	public int insertFunding(Funding funding) {
		String sql = "insert into funding values(seq_funding.nextval,?,?,?,?,?,?,?,?,?)";
		int insertresult = jt.update(sql, funding.getTitle(), funding.getGoal(), funding.getFContent(),
				funding.getFContext(), funding.getMoney(), funding.getContext(), funding.getStartDate(),
				funding.getEndDate(), funding.getUserId());
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
		String sql = "update funding set title=?,f_content=?,f_context=?,goal=?,money=?,context=? where fno=?";
		int updateresult = jt.update(sql, funding.getTitle(), funding.getFContent(), funding.getFContext(),
				funding.getGoal(), funding.getMoney(), funding.getContext(), funding.getFno());
		return updateresult;
	}

	@Override
	public int updateFundingMoney(Funding funding) {
		String sql1 = "select money from funding where fno=?";
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
		String sql = "select count(*) from funding";
		int countresult = jt.queryForObject(sql, Integer.class);
		int result = (int)Math.ceil(countresult/(double)10);
		return result;
	}

	@Override
	public List<Funding> selectFundingByPage(int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from funding order by fno) sub) WHERE RNUM >= ? AND RNUM <= ?";
		List<Funding> result = jt.query(sql, new BeanPropertyRowMapper<Funding>(Funding.class),
				(page_no - 1) * FundingDao.BOARD_PER_PAGE + 1, page_no * FundingDao.BOARD_PER_PAGE);
		return result;
	}

	@Override
	public List<Funding> selectFundingTitleByPage(String title, int page_no) {
		String sql = "SELECT * FROM (SELECT sub.*, ROWNUM AS RNUM FROM ( select * from funding where title like '%'||?||'%' order by fno) sub) WHERE RNUM >= ? AND RNUM <= ?";
		List<Funding> result = jt.query(sql, new BeanPropertyRowMapper<Funding>(Funding.class), title,
				(page_no - 1) * FundingDao.BOARD_PER_PAGE + 1, page_no * FundingDao.BOARD_PER_PAGE);
		return result;
	}

}
