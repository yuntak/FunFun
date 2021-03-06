package funfun.jdbc.dao;

import java.util.List;

import funfun.jdbc.dto.FBoard;

public interface FBoardDao {
	

	int BOARD_PER_PAGE = 26;

	public int getBoardCount();
	
	public int selectCount(int to, int from);
	
	public int getBoardPageCount();

	public int insertFBoard(FBoard fboard);

	public int deleteFBoard(String userId);

	public int deleteFBoardByFno(int fno);

	public int updateFBoard(FBoard fboard);

	public FBoard selectFBoard(int no);
	
	public FBoard selectFullFBoard(int no);
	
	public List<FBoard> selectFBoardByPage(String code,int page_no);
	
	public List<FBoard> selectFBoardBySelectNicknamePage(String nickname, String code, int page_no);
	
	public List<FBoard> selectFBoardBySelectTitlePage(String title,String code, int page_no);
	
	public List<FBoard> selectFBoardBySelectContextPage(String context,String code, int page_no);
	
	public int selectFBoardByTitleAllPage(String title,String code);
	
	public int selectFBoardByNicknameAllPage(String nickname,String code);
	
	public int selectFBoardByContextAllPage(String context,String code);

	public List<FBoard> selectFBoardByCode(int board_no, String board_code);
	
	public List<FBoard> selectFBoardById(String userId);
	
	public List<FBoard> selectFBoardByTitle(String title);
	
	public int selectCountAllPage();
	
	public String selectNickname(int no);
	
	public int updateFBoardVeiw(int no);
	
}
