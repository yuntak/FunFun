package funfun.jdbc.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.ReplyDao;
import funfun.jdbc.dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	private static Logger logger = LoggerFactory.getLogger(ReplyServiceImpl.class);
	@Autowired
	ReplyDao rdao;
	
	@Override
	public void insertReply(Reply reply) {
		int insertresult = rdao.insertReply(reply);
		logger.trace("insert over : {}",insertresult);
	}

	@Override
	public Reply selectBoardReply(int board_no, String board_code) {
		Reply selectresult = rdao.selectBoardReply(board_no, board_code);
		return selectresult;
	}

}
