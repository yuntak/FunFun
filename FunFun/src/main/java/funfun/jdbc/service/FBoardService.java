package funfun.jdbc.service;

import java.util.List;

import funfun.jdbc.dto.FBoard;

public interface FBoardService {
	   void insertFBoard(FBoard fboard);
	   void deleteFBoard(String userId);
	   void updateFBoard(FBoard fboard);
	   void deleteFBoardByFno(int fno);
	   List<FBoard> selectFBoardByCode(int board_no,String board_code);
	   List<FBoard> selectFBoardById(String userId);
	}
