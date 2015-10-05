package funfun.jdbc.dao;

import java.util.List;

import funfun.jdbc.dto.Funding_form;

public interface FundingFormDao {
	public int FundingFormInsert(Funding_form form);
	public int FundingFormDelete(int ffno);
	public List<Funding_form> selectFundingForm();
	public Funding_form selectFundingFormByFfno(int ffno);
}
