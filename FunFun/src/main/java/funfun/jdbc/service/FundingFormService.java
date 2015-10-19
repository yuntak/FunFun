package funfun.jdbc.service;

import java.util.List;

import funfun.jdbc.dto.Funding_form;

public interface FundingFormService {
	void insertForm(Funding_form form);
	void deleteForm(int ffno);
	List<Funding_form> selectForm();
	Funding_form selectFormByFfno(int ffno);

}
