package funfun.jdbc.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.FundingDao;
import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Funding;
@Service
public class FundingServiceImpl implements FundingService {
	private static Logger logger = LoggerFactory.getLogger(FundingServiceImpl.class);
	
	@Autowired
	FundingDao fddao;

	@Override
	public void insertFunding(Funding funding) {
		int result = fddao.insertFunding(funding);
		logger.trace("insert over : {}",result);
	}

	@Override
	public void deleteFunding(int fno) {
		int result = fddao.deleteFunding(fno);
		logger.trace("delete over : {}",result);
	}

	@Override
	public void updateFunding(Funding funding) {
		int result = fddao.updateFunding(funding);
		logger.trace("update over : {}",result);
	}

	@Override
	public void updateFundingMoney(Funding funding) {
		int result = fddao.updateFundingMoney(funding);
		logger.trace("update over : {}",result);		
	}

	@Override
	public void updateFundingDate(Funding funding) {
		int result = fddao.updateFundingDate(funding);
		logger.trace("update over : {}",result);
		logger.trace("{}",funding);
	}

	@Override
	public int countFundingPage() {
		int pageresult = fddao.selectCountAllPage();
		logger.trace("page over : {}",pageresult);
		return pageresult;
	}

	@Override
	public List<Funding> selectFundingByPage(int page_no) {
		List<Funding> selectresult = null;
		try {
			selectresult = fddao.selectFundingByPage(page_no);
		} catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public List<Funding> selectFundingTitleByPage(String title, int page_no) {
		List<Funding> selectresult = null;
		try{
			selectresult = fddao.selectFundingTitleByPage(title, page_no);
		}catch(EmptyResultDataAccessException e){
			selectresult = null;
		}
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}

}
