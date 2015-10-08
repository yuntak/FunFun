package funfun.jdbc.dao;

import java.util.List;

import funfun.jdbc.dto.CBoard;

public interface CBoardDao {
	int BOARD_PER_PAGE = 26;
	public int insertCBoard(CBoard cboard);
	public int deleteCBoard(int cno);
	public int updateCBoard(CBoard cboard);
	public int updateCBoardVeiw(int cno);
	public int updateCBoardGood(int cno);
	public CBoard selectCBoard(int cno);
	public List<CBoard> selectCBoardByPage(String code,int page_no);
	public List<CBoard> selectCBoardByCategoryPage(String category,String code,int page_no);
	public List<CBoard> selectCBoardBySelectTitlePage(String title,String code, int page_no);
	public CBoard selectFullCBoard(int cno);

}
