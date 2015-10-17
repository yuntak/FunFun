package funfun.jdbc.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.CBoard_subDao;
import funfun.jdbc.dto.CBoard_sub;
@Service
public class CBoard_subServiceImpl implements CBoard_subService {
	private static Logger logger = LoggerFactory.getLogger(CBoard_subServiceImpl.class);
	@Autowired
	CBoard_subDao csdao;
	
	
	@Override
	public void insertCBoardSub(CBoard_sub sub) {
		int selectCount = csdao.selectCountCno(sub.getContentBoardCno());
		sub.setNo(selectCount+1);
		int insertresult = csdao.insertCBoardSub(sub);
		logger.trace("insert over : {}",insertresult);		
	}

	@Override
	public void deleteCBoardSub(int no, int contentBoardCno) {
		int deleteresult = csdao.deleteCBoardSub(no, contentBoardCno);
		logger.trace("delete over : {}",deleteresult);		
	}

	@Override
	public void updateCBoardSub(CBoard_sub sub) {
		int updateresult = csdao.updateCBoardSub(sub);
		logger.trace("update over : {}",updateresult);		
	}

	@Override
	public int selectCountCno(int cno) {
		int selectCount = csdao.selectCountCno(cno);
		logger.trace("select over : {}",selectCount);
		return selectCount;
	}

	@Override
	public List<CBoard_sub> selectCBoardSubByPage(int cno, int page_no) {
		List<CBoard_sub> selectresult = csdao.selectCBoardSubByPage(cno, page_no);
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}

	@Override
	public CBoard_sub selectCBoardBycno(int no,int cno) {
		CBoard_sub selectresult = csdao.selectCBoardBycno(no,cno);
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}

	@Override
	public List<CBoard_sub> selectCBoardSub(int cno) {
		List<CBoard_sub> selectresult = csdao.selectCBoardSub(cno);
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}
}
