package funfun.jdbc.dao;

import funfun.jdbc.dto.CBoard;

public interface CBoardDao {
	public int insertCBoard(CBoard cboard);
	public int deleteCBoard(String userId);
	public int updateCBoard(CBoard cboard);
	public CBoard selectCBoard(int cno);
}
