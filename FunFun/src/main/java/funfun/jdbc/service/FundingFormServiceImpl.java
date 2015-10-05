package funfun.jdbc.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.FundingFormDao;
import funfun.jdbc.dto.Funding_form;
@Service
public class FundingFormServiceImpl implements FundingFormService{
	private static Logger logger = LoggerFactory.getLogger(FundingFormServiceImpl.class);
	
	@Autowired
	FundingFormDao ffdao;
	
	@Override
	public void insertForm(Funding_form form) {
		int insertresult = ffdao.FundingFormInsert(form);
		logger.trace("insert over : {}",insertresult);
	}

	@Override
	public void deleteForm(int ffno) {
		int deleteresult = ffdao.FundingFormDelete(ffno);
		logger.trace("delete over : {}",deleteresult);
	}

	@Override
	public List<Funding_form> selectForm() {
		List<Funding_form> selectresult = ffdao.selectFundingForm();
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}

	@Override
	public Funding_form selectFormByFfno(int ffno) {
		Funding_form selectresult=null;
		try{
			selectresult = ffdao.selectFundingFormByFfno(ffno);
		}catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select over : {}",selectresult);
		if (selectresult == null){
			return null;
		} else {
			return selectresult;
		}
	}
	
}
