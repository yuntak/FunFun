package funfun.jdbc.service;

import funfun.jdbc.dto.CBoard;

public interface CBoardService {
	void insertCBoard(CBoard cboard);
	void deleteCBoard(String userId);
	void updateCBoard(CBoard cboard);
}
