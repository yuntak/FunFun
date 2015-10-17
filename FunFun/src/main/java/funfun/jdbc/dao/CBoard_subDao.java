package funfun.jdbc.dao;

import java.util.List;

import funfun.jdbc.dto.CBoard_sub;

public interface CBoard_subDao {
	int BOARD_PER_PAGE = 26;
	public int insertCBoardSub(CBoard_sub sub);
	public int deleteCBoardSub(int no,int contentBoardCno);
	public int updateCBoardSub(CBoard_sub sub);
	public int selectCountCno(int cno);
	public List<CBoard_sub> selectCBoardSubByPage(int cno,int page_no);
	public List<CBoard_sub> selectCBoardSub(int cno);
	public CBoard_sub selectCBoardBycno(int no, int cno);
}
