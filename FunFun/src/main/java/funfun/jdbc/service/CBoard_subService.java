package funfun.jdbc.service;

import java.util.List;

import funfun.jdbc.dto.CBoard_sub;

public interface CBoard_subService {
	void insertCBoardSub(CBoard_sub sub);
	void deleteCBoardSub(int no, int contentBoardCno);
	void updateCBoardSub(CBoard_sub sub);
	int selectCountCno(int cno);
	List<CBoard_sub> selectCBoardSubByPage(int cno,int page_no);
	CBoard_sub selectCBoardBycno(int no,int cno);
}
