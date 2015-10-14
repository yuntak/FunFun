package funfun.jdbc.dao;

import java.util.List;

import funfun.jdbc.dto.Funding;

public interface FundingDao {
	int BOARD_PER_PAGE = 9;
	public int insertFunding(Funding funding);
	public int deleteFunding(int fno);
	public int updateFunding(Funding funding);
	public int updateFundingMoney(Funding funding);
	public int updateFundingDate(Funding funding);
	public int selectCountAllPage();
	public Funding selectFunding(int fno);
	public List<Funding> selectFundingByPage(int page_no);
	public List<Funding> selectFundingTitleByPage(String title, int page_no);
}
