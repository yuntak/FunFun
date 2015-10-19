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

import funfun.jdbc.dto.Funding_form;
@Repository
public class FundingFormDaoImpl implements FundingFormDao {

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;
	
	@Override
	public int FundingFormInsert(Funding_form form) {
		String sql = "insert into funding_form(ffno,subject,category,ff_context,tel,money,user_id,receive,funding_fno) values(seq_funding_form.nextval,?,?,?,?,?,?,?,?)";
		int result = jt.update(sql,form.getSubject(),form.getCategory(),form.getFfContext(),form.getTel(),form.getMoney(),form.getUserId(),form.getReceive(),form.getFunding_fno());
		return result;
	}

	@Override
	public int FundingFormDelete(int ffno) {
		String sql = "delete from funding_form where ffno=?";
		int result = jt.update(sql,ffno);
		return result;
	}

	@Override
	public List<Funding_form> selectFundingForm() {
		String sql = "select * from funding_form";
		List<Funding_form> result = jt.query(sql, new BeanPropertyRowMapper<Funding_form>(Funding_form.class));
		return result;
	}
	
	private RowMapper<Funding_form> getFFormRowMapper() {
		return new RowMapper<Funding_form>() {

			@Override
			public Funding_form mapRow(ResultSet rs, int rowNum) throws SQLException {
				Funding_form form = new Funding_form();
				form.setFfno(rs.getInt("ffno"));
				form.setSubject(rs.getString("subject"));
				form.setCategory(rs.getString("category"));
				form.setFfContext(rs.getString("ff_context"));
				form.setTel(rs.getString("tel"));
				form.setMoney(rs.getString("money"));
				form.setUserId(rs.getString("user_id"));
				form.setReceive(rs.getString("receive"));
				form.setFunding_fno(rs.getInt("funding_fno"));
				return form;
			}
		};
	}

	@Override
	public Funding_form selectFundingFormByFfno(int fno) {
		String sql = "select * from funding_form where funding_fno=?";
		Funding_form result=null;
		try{
		result = jt.queryForObject(sql, getFFormRowMapper(),fno);
		}catch(EmptyResultDataAccessException e){
			result=null;
		}
		if(result==null){
			return null;
		}else{
			return result;
		}
	}

	@Override
	public int updateReceive(Funding_form form) {
		String sql = "update funding_form set receive=? where ffno=?";
		int updateresult = jt.update(sql,form.getReceive(),form.getFfno());
		return updateresult;
	}

}
