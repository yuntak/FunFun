package funfun.jdbc.service;

import funfun.jdbc.dto.Funding;

public interface FundingService {
	void insertFunding(Funding funding);
	void deleteFunding(int fno);
	void updateFunding(Funding funding);
	void updateFundingMoney(Funding funding);
	void updateFundingDate(Funding funding);
	int countFundingPage();
}
