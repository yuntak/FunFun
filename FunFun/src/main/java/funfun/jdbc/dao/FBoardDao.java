package funfun.jdbc.dao;

import java.util.List;

import funfun.jdbc.dto.FBoard;

public interface FBoardDao {

	public int getBoardCount();

	public int insertFBoard(FBoard fboard);

	public int deleteFBoard(String userId);

	public int deleteFBoardByFno(int fno);

	public int updateFBoard(FBoard fboard);

	public FBoard selectFBoard(int no);

	public List<FBoard> selectFBoardByCode(int board_no, String board_code);
}
