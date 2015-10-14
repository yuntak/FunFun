package funfun.jdbc.service;

import java.util.List;
import java.util.Map;

import funfun.jdbc.dto.Board;

public interface BoardService {
	List<Map<String, Object>> SelectByCode(String code);
	   void insertBoard(String code,String id);
	   void delete(int no);
}
