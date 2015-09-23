package funfun.jdbc.dao;

import funfun.jdbc.dto.FBoard;

public interface FBoardDao {

	public int getBoardCount();
	  public int insertFBoard(FBoard fboard);
	   public int deleteFBoard(String userId);
	   public FBoard selectFBoard(int no);
}
