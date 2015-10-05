package funfun.jdbc.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.CBoardDao;
import funfun.jdbc.dto.CBoard;
@Service
public class CBoardServiceImpl implements CBoardService {
	private static Logger logger = LoggerFactory.getLogger(CBoardServiceImpl.class);
	@Autowired
	CBoardDao cdao;
	
	@Override
	public void insertCBoard(CBoard cboard) {
		int insertresult = cdao.insertCBoard(cboard);
		logger.trace("insert over : {}",insertresult);
	}

	@Override
	public void deleteCBoard(String userId) {
		int deleteresult = cdao.deleteCBoard(userId);
		logger.trace("delete over : {}",deleteresult);
	}

	@Override
	public void updateCBoard(CBoard cboard) {
		int updateresult = cdao.updateCBoard(cboard);
		logger.trace("update ovaer : {}",updateresult);
	}

}
