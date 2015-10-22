package funfun.jdbc.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.CBoardDao;
import funfun.jdbc.dao.CBoard_subDao;
import funfun.jdbc.dao.ReplyDao;
import funfun.jdbc.dto.CBoard;
import funfun.jdbc.dto.CBoard_sub;
import funfun.jdbc.dto.Reply;

@Service
public class CBoardServiceImpl implements CBoardService {
	private static Logger logger = LoggerFactory.getLogger(CBoardServiceImpl.class);
	@Autowired
	CBoardDao cdao;
	@Autowired
	ReplyDao rdao;
	@Autowired
	CBoard_subDao csdao;

	@Override
	public void insertCBoard(CBoard cboard) {
		int insertresult = cdao.insertCBoard(cboard);
		logger.trace("insert over : {}", insertresult);
	}

	@Override
	public void deleteCBoard(int cno) {
		int deleteresult = cdao.deleteCBoard(cno);
		logger.trace("delete over : {}", deleteresult);
	}

	@Override
	public void updateCBoard(CBoard cboard) {
		int updateresult = cdao.updateCBoard(cboard);
		logger.trace("update ovaer : {}", updateresult);
	}

	@Override
	public List<CBoard> selectCBoardByPage(String code, int page_no) {
		CBoard result = null;
		List<CBoard_sub> csList = null;
		List<CBoard> selectresult = cdao.selectCBoardByPage(code, page_no);
		for (int i = 0; i < selectresult.size(); i++) {
			result = selectresult.get(i);
			csList = csdao.selectCBoardSub(result.getCno());
			result.setCboard_sub(csList);
		}
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public void updateCBoardVeiw(int cno) {
		int updateresult = cdao.updateCBoardVeiw(cno);
		logger.trace("update over : {}", updateresult);
	}

	@Override
	public void updateCBoardGood(int cno) {
		int updateresult = cdao.updateCBoardGood(cno);
		logger.trace("update over : {}", updateresult);
	}

	@Override
	public List<CBoard> selectCBoardByCategoryPage(String category, String code, int page_no) {
		List<CBoard> selectresult = null;

		try {
			selectresult = cdao.selectCBoardByCategoryPage(category, code, page_no);

		} catch (EmptyResultDataAccessException e) {
			selectresult = null;
		}
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public List<CBoard> selectCBoardBySelectTitlePage(String title, String code, int page_no) {
		List<CBoard> selectresult = cdao.selectCBoardBySelectTitlePage(title, code, page_no);
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public int selectCountAllPage() {
		int selectresult = cdao.selectCountAllPage();
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public CBoard selectFullCBoard(int cno) {
		CBoard selectresult = null;
		List<Reply> replyList = null;
		List<CBoard_sub> csList = null;
		int updateresult = 0;
		try {
			updateresult = cdao.updateCBoardVeiw(cno);
			selectresult = cdao.selectFullCBoard(cno);
			replyList = rdao.selectBoardReply(selectresult.getBoard_no(), selectresult.getBoard_code());
			selectresult.setReplys(replyList);
			csList = csdao.selectCBoardSub(cno);
			selectresult.setCboard_sub(csList);
		} catch (EmptyResultDataAccessException e) {
			selectresult = null;

		}
		logger.trace("select content Board Service : {}", selectresult);
		return selectresult;
	}

	@Override
	public int selectCBoardByContextAllPage(String context, String code) {
		int selectresult = cdao.selectCBoardByContextAllPage(context, code);
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public int selectCBoardByNicknameAllPage(String nickname, String code) {
		int selectresult = cdao.selectCBoardByNicknameAllPage(nickname, code);
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public int selectCBoardByTitleAllPage(String title, String code) {
		int selectresult = cdao.selectCBoardByTitleAllPage(title, code);
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}

	@Override
	public int selectCBoardByCategoryAllPage(String context, String code) {
		int selectresult = cdao.selectCBoardByCategoryAllPage(context, code);
		logger.trace("select over : {}", selectresult);
		return selectresult;
	}
}
