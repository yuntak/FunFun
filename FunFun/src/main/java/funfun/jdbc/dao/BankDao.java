package funfun.jdbc.dao;

import java.util.List;

import funfun.jdbc.dto.Bank;

public interface BankDao {
	public int insertBank(Bank bank);
	public int deleteBank(int bno);
	public List<Bank> selectBankByFno(int fno);
	public List<Bank> selectBankByFnoUserId(int fno,String userId);
	public Bank selectBank(int bno);
}
