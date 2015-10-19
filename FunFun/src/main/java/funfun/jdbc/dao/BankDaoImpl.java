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

import funfun.jdbc.dto.Bank;
import funfun.jdbc.dto.CBoard;

@Repository
public class BankDaoImpl implements BankDao {

	@Autowired
	JdbcTemplate jt;
	@Autowired
	NamedParameterJdbcTemplate namedjt;

	@Override
	public int insertBank(Bank bank) {
		String sql = "insert into bank values(seq_bank.nextval,?,?,?)";
		int result = jt.update(sql, bank.getFno(), bank.getUserId(), bank.getMoney());
		return result;
	}

	@Override
	public int deleteBank(int bno) {
		String sql = "delete from bank where bno=?";
		int result = jt.update(sql, bno);
		return result;
	}

	@Override
	public List<Bank> selectBankByFno(int fno) {
		String sql = "select * from bank where fno=?";
		List<Bank> result = jt.query(sql, new BeanPropertyRowMapper<Bank>(Bank.class), fno);
		return result;
	}
	
	@Override
	public List<Bank> selectBankByFnoUserId(int fno, String userId) {
		String sql = "select * from bank where fno=? and user_id=?";
		List<Bank> result = jt.query(sql, new BeanPropertyRowMapper<Bank>(Bank.class), fno,userId);
		return result;
	}

	private RowMapper<Bank> getBankRowMapper() {
		return new RowMapper<Bank>() {

			@Override
			public Bank mapRow(ResultSet rs, int rowNum) throws SQLException {
				Bank bank = new Bank();
				bank.setBno(rs.getInt("bno"));
				bank.setFno(rs.getInt("fno"));
				bank.setUserId(rs.getString("user_id"));
				bank.setMoney(rs.getDouble("money"));
				return bank;
			}
		};
	}

	@Override
	public Bank selectBank(int bno) {
		String sql = "select * from bank where bno=?";
		Bank result = jt.queryForObject(sql, getBankRowMapper(),bno);
		return result;
	}

	
}
