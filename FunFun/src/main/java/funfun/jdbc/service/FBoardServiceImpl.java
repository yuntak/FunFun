package funfun.jdbc.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.BoardDao;
import funfun.jdbc.dao.FBoardDao;
import funfun.jdbc.dao.ReplyDao;
import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Reply;

@Service
public class FBoardServiceImpl implements FBoardService {
	private static Logger logger = LoggerFactory.getLogger(FBoardServiceImpl.class);
	@Autowired
	FBoardDao fdao;
	@Autowired
	ReplyDao rdao;
	@Autowired
	BoardDao dao;

	@Override
	public void insertFBoard(FBoard fboard) {
		int result = dao.insertBoard(fboard.getBoardCode(),fboard.getUserId());
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
		List<FBoard> selectresult = null;
		try {
			selectresult = fdao.selectFBoardByCode(board_no, board_code);
		} catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select over : {}  size : {}", selectresult,selectresult.size());
		
		return selectresult;
	}

	@Override
	public void deleteFBoardByFno(int fno) {
		int deleteresult = fdao.deleteFBoardByFno(fno);
		logger.trace("delete over : {}", deleteresult);

	}

	@Override
	public List<FBoard> selectFBoardById(String userId) {
		List<FBoard> selectresult = null;
		try {
			selectresult = fdao.selectFBoardById(userId);
		} catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select id over : {}", selectresult);
		return selectresult;
	}

	@Override
	public List<FBoard> selectFBoardByTitle(String title) {
		List<FBoard> selectresult = null;
		try {
			selectresult = fdao.selectFBoardByTitle(title);
		} catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select title over : {}", selectresult);
		return selectresult;
	}

	@Override
	public List<FBoard> selectFBoardByPage(String board_code, int page_no) {
		List<FBoard> selectresult = null;
		try {
			selectresult = fdao.selectFBoardByPage(board_code,page_no);
		} catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select over : {}  size : {}", selectresult,selectresult.size());
		return selectresult;
	}

	@Override
	public List<FBoard> selectTitleFBoardByPage(String title, String code, int page_no) {
		List<FBoard> selectresult = null;
		try {
			selectresult = fdao.selectFBoardBySelectTitlePage(title,code,page_no);
		} catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public List<FBoard> selectNicknameFBoardByPage(String nickname, String code, int page_no) {
		List<FBoard> selectresult = null;
		try {
			selectresult = fdao.selectFBoardBySelectNicknamePage(nickname, code, page_no);
		} catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}
	
	@Override
	public List<FBoard> selectFBoardBySelectContextPage(String context, String code, int page_no) {
		List<FBoard> selectresult = null;
		try {
			selectresult = fdao.selectFBoardBySelectContextPage(context,code,page_no);
		} catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public FBoard selectFullFBoard(int no) {
		FBoard selectresult=null;
		List<Reply> replyList=null;
		int updateresult = 0;
		try{
		updateresult = fdao.updateFBoardVeiw(no);
		selectresult = fdao.selectFullFBoard(no);
		replyList = rdao.selectBoardReply(selectresult.getBoardNo(), selectresult.getBoardCode());
		selectresult.setReplys(replyList);
		}catch(EmptyResultDataAccessException e){
			selectresult = null;
			
		}
		logger.trace("select freeBoard Service : {}", selectresult);
		return selectresult;
	}

	@Override
	public int selectCount(int to, int from) {
		int selectCount = fdao.selectCount(to, from);
		logger.trace("select over : {}", selectCount);
		return selectCount;
	}

	@Override
	public int selectCountAllPage() {
		int selectCountPage = fdao.selectCountAllPage();
		logger.trace("select page over : {}",selectCountPage);
		return selectCountPage;
	}

	@Override
	public String selectnickname(int no) {
		String selectresult = fdao.selectNickname(no);
		logger.trace("select over : {}",selectresult);
		return selectresult;
	}

	@Override
	public int selectFBoardByTitleAllPage(String title, String code) {
		int selectCountPage = fdao.selectFBoardByTitleAllPage(title, code);
		logger.trace("select page over : {}",selectCountPage);
		return selectCountPage;
	}
	
	@Override
	public int selectFBoardByNicknameAllPage(String nickname, String code) {
		int selectCountPage = fdao.selectFBoardByNicknameAllPage(nickname, code);
		logger.trace("select page over : {}",selectCountPage);
		return selectCountPage;
	}
	
	@Override
	public int selectFBoardByContextAllPage(String context, String code) {
		int selectCountPage = fdao.selectFBoardByContextAllPage(context, code);
		logger.trace("select page over : {}",selectCountPage);
		return selectCountPage;
	}
}