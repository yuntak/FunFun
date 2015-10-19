package funfun.jdbc.service;

import java.util.List;

import funfun.jdbc.dto.Bank;

public interface BankService {
	int insertBank(Bank bank);
	int deleteBank(int bno);
	Bank selectBank(int bno);
	List<Bank> selectBankByFno(int fno);
	List<Bank> selectBankByFnoUserId(int fno,String userId);
}
