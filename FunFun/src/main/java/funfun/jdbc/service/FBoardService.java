package funfun.jdbc.service;

import funfun.jdbc.dto.FBoard;

public interface FBoardService {
	   void insertFBoard(FBoard fboard);
	   void deleteFBoard(String userId);
	}
