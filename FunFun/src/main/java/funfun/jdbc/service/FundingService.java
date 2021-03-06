package funfun.jdbc.service;

import java.util.List;

import funfun.jdbc.dto.Funding;

public interface FundingService {
	void insertFunding(Funding funding);
	void deleteFunding(int fno);
	void updateFunding(Funding funding);
	void updateFundingMoney(Funding funding);
	void updateFundingDate(Funding funding);
	Funding selectFunding(int fno);
	int countFundingPage();
	List<Funding> selectFundingByPage(int page_no);
	List<Funding> selectFundingTitleByPage(String title, int page_no);
}
