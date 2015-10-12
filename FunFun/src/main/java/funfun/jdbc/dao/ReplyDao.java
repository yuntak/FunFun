package funfun.jdbc.dao;

import java.util.List;

import funfun.jdbc.dto.Reply;

public interface ReplyDao {
	public Reply selectReply(int rno);
	public List<Reply> selectBoardReply(int board_no,String board_code);
	public int insertReply(Reply reply);
}
