package funfun.jdbc.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.BankDao;
import funfun.jdbc.dto.Bank;

@Service
public class BankServiceImpl implements BankService {
	private static Logger logger = LoggerFactory.getLogger(BankServiceImpl.class);
	
	@Autowired
	BankDao bkdao;

	@Override
	public int insertBank(Bank bank) {
		int insertresult = bkdao.insertBank(bank);
		logger.trace("insert over : {}",insertresult);
		return insertresult;
	}

	@Override
	public int deleteBank(int bno) {
		int deleteresult = bkdao.deleteBank(bno);
		logger.trace("delete over : {}",deleteresult);
		return deleteresult;
	}

	@Override
	public Bank selectBank(int bno) {
		Bank selectresult = bkdao.selectBank(bno);
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}

	@Override
	public List<Bank> selectBankByFno(int fno) {
		List<Bank> selectresult = bkdao.selectBankByFno(fno);
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}

	@Override
	public List<Bank> selectBankByFnoUserId(int fno, String userId) {
		List<Bank> selectresult = bkdao.selectBankByFnoUserId(fno, userId);
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}

}
