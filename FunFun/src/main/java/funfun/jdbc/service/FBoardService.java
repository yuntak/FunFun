package funfun.jdbc.service;

import java.util.List;

import funfun.jdbc.dto.FBoard;

public interface FBoardService {
	void insertFBoard(FBoard fboard);

	void deleteFBoard(String userId);

	void updateFBoard(FBoard fboard);

	void deleteFBoardByFno(int fno);

	List<FBoard> selectFBoardByCode(int board_no, String board_code);

	List<FBoard> selectFBoardById(String userId);

	List<FBoard> selectFBoardByTitle(String title);

	List<FBoard> selectFBoardByPage(String title, String board_code, int page_no);

	List<FBoard> selectCodeFBoardByPage(String title, String code, int page_no);

	List<FBoard> selectUserIdFBoardByPage(String userId, String code, int page_no);

	FBoard selectFullFBoard(int no);
	
	int selectCount(int to, int from);
}
