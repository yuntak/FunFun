package funfun.jdbc.service;

import java.util.List;
import java.util.Map;

import funfun.jdbc.dto.Board;

public interface BoardService {
	List<Map<String, Object>> SelectByCode(String code);
	   void insertBoard(Board board);
	   void delete(int no);
}
