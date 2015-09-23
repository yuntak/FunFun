package funfun.jdbc.dao;

import java.util.List;
import java.util.Map;

import funfun.jdbc.dto.Board;

public interface BoardDao {
	public List<Map<String, Object>> SelectBoardByCode(String code);
	 public Board selectBoard(int no);
	   public int insertBoard(Board board);
	   public int deleteBoard(int no);
}
