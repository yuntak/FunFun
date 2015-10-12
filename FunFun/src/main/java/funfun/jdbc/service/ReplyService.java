package funfun.jdbc.service;

import java.util.List;

import funfun.jdbc.dto.Reply;

public interface ReplyService {
	void insertReply(Reply reply);
	List<Reply> selectBoardReply(int board_no,String board_code);
	Reply selectReply(int rno);
}
