package funfun.jdbc.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.FBoardDao;
import funfun.jdbc.dto.FBoard;

@Service
public class FBoardServiceImpl implements FBoardService {
	private static Logger logger = LoggerFactory.getLogger(FBoardServiceImpl.class);
	@Autowired
	FBoardDao fdao;

	@Override
	public void insertFBoard(FBoard fboard) {
		int insertresult = fdao.insertFBoard(fboard);
		logger.trace("insert over : {}", insertresult);
	}

	@Override
	public void deleteFBoard(String userId) {
		int deleteresult = fdao.deleteFBoard(userId);
		logger.trace("delete over : {}", deleteresult);
	}

	@Override
	public void updateFBoard(FBoard fboard) {
		int updateresult = fdao.updateFBoard(fboard);
		logger.trace("update over : {}", updateresult);

	}

	@Override
	public List<FBoard> selectFBoardByCode(int board_no, String board_code) {
		List<FBoard> selectresult = fdao.selectFBoardByCode(board_no, board_code);
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public void deleteFBoardByFno(int fno) {
		int deleteresult = fdao.deleteFBoardByFno(fno);
		logger.trace("delete over : {}", deleteresult);
		
	}
	
	@Override
	   public List<FBoard> selectFBoardById(String userId) {
	      List<FBoard> selectresult = fdao.selectFBoardById(userId);
	      logger.trace("select id over : {}",selectresult);
	      return selectresult;
	   }

	@Override
	public List<FBoard> selectFBoardByTitle(String title) {
		 List<FBoard> selectresult = fdao.selectFBoardByTitle(title);
	      logger.trace("select title over : {}",selectresult);
	      return selectresult;
	}

	@Override
	public List<FBoard> selectFBoardByPage(String title, String board_code, int page_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FBoard> selectCodeFBoardByPage(String title, String code, int page_no) {
		List<FBoard> selectresult = fdao.selectFBoardByPage(title, code, page_no);
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}
	@Override
	public List<FBoard> selectUserIdFBoardByPage(String userId, String code, int page_no) {
		List<FBoard> selectresult = fdao.selectFBoardByPage(userId, code, page_no);
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public FBoard selectFullFBoard(int no) {
		FBoard selectresult = fdao.selectFullFBoard(no);
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}
	
	@Override
	public int selectCount(int to, int from) {
		int selectCount = fdao.selectCount(to, from);
		logger.trace("select over : {}",selectCount);
		return selectCount;
	}
}