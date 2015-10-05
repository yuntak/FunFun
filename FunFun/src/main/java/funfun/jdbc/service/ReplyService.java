package funfun.jdbc.service;

import funfun.jdbc.dto.Reply;

public interface ReplyService {
	void insertReply(Reply reply);
	Reply selectBoardReply(int board_no,String board_code);
}
