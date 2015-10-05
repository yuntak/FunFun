package funfun.jdbc.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.BoardDao;
import funfun.jdbc.dto.Board;

@Service
public class BoardServiceImpl implements BoardService {
	private static Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	BoardDao dao;

	@Override
	public List<Map<String, Object>> SelectByCode(String code) {
		List<Map<String, Object>> result = null;
		try{
		result = dao.SelectBoardByCode(code);
		}catch(EmptyResultDataAccessException e){
			result = null;
		}
		logger.trace("{}", result);
		return result;
	}

	@Override
	public void insertBoard(Board board) {
		int insertResult = dao.insertBoard(board);
		logger.trace("insert over : {}", insertResult);

	}

	@Override
	public void delete(int no) {
		int deleteNo = dao.deleteBoard(no);

	}

}