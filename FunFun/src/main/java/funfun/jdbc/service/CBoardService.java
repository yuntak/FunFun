package funfun.jdbc.service;

import java.util.List;

import funfun.jdbc.dto.CBoard;

public interface CBoardService {
	void insertCBoard(CBoard cboard);
	void deleteCBoard(int cno);
	void updateCBoard(CBoard cboard);
	void updateCBoardVeiw(int cno);
	void updateCBoardGood(int cno);
	List<CBoard> selectCBoardByPage(String code,int page_no);
	List<CBoard> selectCBoardByCategoryPage(String category,String code,int page_no);
	List<CBoard> selectCBoardBySelectTitlePage(String title,String code, int page_no);
	int selectCountAllPage();
}
