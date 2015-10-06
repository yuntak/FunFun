package user.jongho;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertThat;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import funfun.jdbc.dao.BoardDao;
import funfun.jdbc.dao.CBoardDao;
import funfun.jdbc.dao.FBoardDao;
import funfun.jdbc.dao.FundingDao;
import funfun.jdbc.dao.FundingFormDao;
import funfun.jdbc.dao.ReplyDao;
import funfun.jdbc.dao.UsersDao;
import funfun.jdbc.dto.Board;
import funfun.jdbc.dto.CBoard;
import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Funding;
import funfun.jdbc.dto.Funding_form;
import funfun.jdbc.dto.Reply;
import funfun.jdbc.dto.Users;
import funfun.jdbc.service.BoardService;
import funfun.jdbc.service.CBoardService;
import funfun.jdbc.service.FBoardService;
import funfun.jdbc.service.FundingFormService;
import funfun.jdbc.service.FundingService;
import funfun.jdbc.service.ReplyService;
import funfun.jdbc.service.UsersService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class ServiceTest {
	private static Logger logger = LoggerFactory.getLogger(ServiceTest.class);
	@Autowired
	UsersService service;
	@Autowired
	UsersDao dao;

	@Autowired
	BoardService bservice;
	@Autowired
	BoardDao bdao;

	@Autowired
	FBoardDao fdao;
	@Autowired
	FBoardService fservice;

	@Autowired
	CBoardDao cdao;
	@Autowired
	CBoardService cservice;
	@Autowired
	ReplyDao rdao;
	@Autowired
	ReplyService rservice;
	
	@Autowired
	FundingFormDao ffdao;
	@Autowired
	FundingFormService ffservice;
	
	@Autowired
	FundingDao fddao;
	@Autowired
	FundingService fdservice;
	/*@Before
	public void cleanDB(){
		dao.deleteAllUsers();
	}*/
	
	@Test
	public void TestFundingByPage(){
		fdservice.selectFundingByPage(1);
	}
	
	@Test
	public void TestAllPageFunding(){
		fdservice.countFundingPage();
	}
	
	@Test
	public void TestUpdateDateFunding() throws Exception{
		Funding funding = new Funding();
		funding.setFno(4);
		Date date = DatePase("2011-11-01");
		funding.setStartDate(date);
		Date date2 = DatePase("2011-12-31");
		funding.setEndDate(date2);
		fdservice.updateFundingDate(funding);
	}
	public Date DatePase(String strdate) throws Exception{
		DateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Date date2;
		date2=date.parse(strdate);
		return date2;
	}
	
	@Test
	public void TestUpdateMoneyFunding(){
		Funding funding = new Funding();
		funding.setFno(4);
		funding.setMoney(20000);
		fdservice.updateFundingMoney(funding);
	}
	
	@Test
	public void TestUpdateFunding(){
		Funding funding = new Funding();
		funding.setFno(4);
		funding.setTitle("원피스");
		funding.setFContent("c:\\program files\\funding\\onpice.jpg");
		funding.setFContext("c:\\program files\\funding\\onpice main.jpg");
		funding.setGoal(5000000);
		funding.setMoney(250000);
		funding.setContext("원피스 연재 시작합니다.");
		fdservice.updateFunding(funding);
	}
	
	@Test
	public void TestDeleteFunding(){
		fdservice.deleteFunding(1);
	}
	
	@Test
	public void TestInsertFunding(){
		Funding funding = new Funding();
		funding.setTitle("웹툰 통");
		funding.setGoal(1000000);
		funding.setFContent("c:\\program files\\funding\\title.jpg");
		funding.setFContext("c:\\program files\\funding\\titlemain.jpg");
		funding.setMoney(0);
		funding.setContext("웹툰 통에 대한 이야기 입니다.");
		Date date= new Date();
		funding.setStartDate(date);
		Date date2 = new Date(13-01-01);
		funding.setEndDate(date2);
		funding.setUserId("every9168");
		fdservice.insertFunding(funding);
	}
	
	@Test
	public void TestInsertFForm(){
		Funding_form form = new Funding_form();
		form.setSubject("webtoon");
		form.setFfContext("만화");
		form.setCategory("만화");
		form.setTel("010-7747-9168");
		form.setMoney("5000000");
		form.setUserId("loll333");
		ffservice.insertForm(form);
		assertThat(form.getSubject(),is("만화"));
	}
	
	@Test
	public void TestDeleteFForm(){
		ffservice.deleteForm(1);
	}
	
	@Test
	public void TestSelectFForm(){
		ffservice.selectForm();
	}
	@Test
	public void TestSelectByFFnoForm(){
		Funding_form form = ffdao.selectFundingFormByFfno(1);
		ffservice.selectFormByFfno(1);
		logger.trace("{}",form);
		assertThat(form,is(not(nullValue())));
	}
	@Test
	public void TestinsertCBoard(){
		Board board = new Board();
		board.setCode("66");
		board.setUserId("loll333");
		bservice.insertBoard(board);
		CBoard cboard = new CBoard();
		cboard.setTitle("만화");
		cboard.setContent("호롤롤로로롤로로로로롤로로로로롤로ㅗ로");
		cboard.setCview(8);
		cboard.setGood(4);
		cboard.setCategory("webtoon");
		cboard.setBoard_code("66");
		cboard.setUserId("loll333");
		cservice.insertCBoard(cboard);
		CBoard result = cdao.selectCBoard(7);
		logger.trace("{}",result);
		assertThat(result.getCategory(),is("webtoon"));
		
	}
	@Test
	public void TestCBoardUpdate(){
		CBoard cboard = new CBoard();
		cboard.setTitle("추석 끝");
		cboard.setContent("다시 시작인가???");
		cboard.setCno(10);
		cservice.updateCBoard(cboard);
		logger.trace("{}",cboard);
		assertThat(cboard.getTitle(),is("추석 끝"));
	}
	@Test
	public void TestCBoardDelete(){
		cservice.deleteCBoard("loll333");
	}
	@Test
	public void TestFullFBoard(){
		FBoard fboard = fdao.selectFullFBoard(7);
		fservice.selectFullFBoard(7);
		logger.trace("{}",fboard);
		assertThat(fboard,is(not(nullValue())));
	}
	
	@Test
	public void TestSelectBoardAllPage(){
		fservice.selectCountAllPage();
	}
	
	@Test
	public void TestselectBoardReply(){
		Reply reply = rdao.selectBoardReply(25, "22");
		rservice.selectBoardReply(25, "22");
		logger.trace("{}",reply);
		assertThat(reply,is(not(nullValue())));
	}
	
	@Test
	public void TestReplyInsert(){
		Reply reply = new Reply();
		reply.setRno(1);
		reply.setContext("재미없어");
		reply.setBoardNo(25);
		reply.setBoardCode("22");
		reply.setUserId("loll333");
		rdao.insertReply(reply);
		logger.trace("{}",reply);
		assertThat(reply.getContext(),is("재미없어"));
	}
	
	@Test
	public void TestSelectReply(){
		rservice.selectReply(6);
	}
	
	@Test
	public void TestFBoardCount(){
		int fboard = fdao.selectCount(0, 20);
		fservice.selectCount(0, 20);
		logger.trace("{}",fboard);
		assertThat(fboard,is(11));
	}
	
	@Test
	public void TestFBoardselectUserIdByPage(){
		List<FBoard> fboard = fdao.selectFBoardBySelectUserIdPage("loll333", "22", 1);
		fservice.selectUserIdFBoardByPage("loll333", "22", 1);
		logger.trace("{}",fboard);
		assertThat(fboard,is(not(nullValue())));
	}
	
	@Test
	public void TestFBoardselectTitleByPage(){
		List<FBoard> fboard = fdao.selectFBoardBySelectTitlePage("","22", 1);
		fservice.selectTitleFBoardByPage("","22", 1);
		logger.trace("{}",fboard);
		assertThat(fboard,is(not(nullValue())));
	}
	
	@Test
	public void TestFBoardselectByPage(){
		List<FBoard> fboard = fdao.selectFBoardByPage("22", 1);
		fservice.selectFBoardByPage("22", 1);
		logger.trace("{}",fboard);
		assertThat(fboard,is(not(nullValue())));
	}
	
	
	@Test
	public void testServiceBean() {
		logger.trace("service bean ok? {}", service);
		assertThat(service, is(not(nullValue())));
	}

	@Test
	public void testInsert() {
		Users user = new Users();
		user.setId("zxz222");
		String name = "롤6";
		user.setNickname(name);
		user.setPass("123");
		user.setEmail("every9168@naver.com");
		user.setAddress("서울");
		user.setMail_no("123-456");
		user.setCellphone("010-123");
		user.setRoll("null");
		service.insert(user);
		Users retrieved = dao.selectUser(user.getId());
		assertThat(retrieved.getNickname(), is(name));
	}

	@Test
	public void testUpdate() {
		String sId = dao.getUserIdById("zxz1265");
		Users user = new Users();
		user.setId(sId);
		user.setNickname("정준하");
		user.setEmail("bbbbb@bbbb.com");
		user.setAddress("충남 서산");
		user.setCellphone("010-1111-2222");
		System.out.println("1");
		service.update(user);
		System.out.println("2");

		System.out.println("3");
		assertThat(user.getNickname(), is("정준하"));
	}

	@Test
	public void testUsersDelete() {
		Users retrieved = dao.selectUser("lol7");
		service.delete("lol7");
		assertThat(retrieved.getId(), is(nullValue()));
	}

	@Test
	public void testBoardInsert() {
		Board board = new Board();
		board.setNo(3);
		board.setCode("11");
		board.setUserId("whdgh1265");

		bservice.insertBoard(board);
		Board retrieved = bdao.selectBoard(board.getNo());
		assertThat(retrieved.getCode(), is("11"));
	}

	@Test
	public void testBoardDelete() {
		Board retrieved = bdao.selectBoard(2);
		bservice.delete(2);
		assertThat(retrieved.getNo(), is(not(nullValue())));
	}

	@Test
	public void testPassById() {
		Users user = new Users();
		user.setId("lolllll1");
		user.setNickname("lol");
		user.setPass("123");
		user.setEmail("every9168@naver.com");
		user.setAddress("서울");
		user.setMail_no("123-456");
		user.setCellphone("010-123");
		user.setRoll("null");
		service.insert(user);
		service.PassById(user);
		String retrieved = dao.getUserPasswordById(user.getId());
		assertThat(retrieved, is("1234"));
	}

	@Test
	public void testPassUpdate() {
		String sId = dao.getUserIdById("zxz1265");
		Users user = new Users();
		user.setId(sId);
		user.setPass("9090");
		System.out.println("1");
		service.updatePass(user);
		System.out.println("2");
		assertThat(user.getPass(), is("9090"));
	}

	@Test
	public void testIdById() {
		Users user = new Users();
		user.setId("loll333");
		user.setNickname("lol");
		user.setPass("123");
		user.setEmail("every9168@naver.com");
		user.setAddress("서울");
		user.setMail_no("123-456");
		user.setCellphone("010-123");
		user.setRoll("null");
		service.insert(user);
		service.IdById(user);
		String retrieved = dao.getUserIdById(user.getId());
		assertThat(retrieved, is("loll333"));
	}

	@Test
	public void testIdCheck() {
		String retrieved = service.checkId("whdgh1265");
		logger.trace("{}", retrieved);
		assertThat(retrieved, is("0"));
	}

	@Test
	public void testNickNameCheck() {
		String retrieved = service.checkNickname("심슨");
		logger.trace("{}", retrieved);
		assertThat(retrieved, is("0"));
	}

	@Test
	public void testEmailCheck() {
		String retrieved = service.checkEmail("whdgh1265@naver.com");
		logger.trace("{}", retrieved);
		assertThat(retrieved, is("0"));
	}

	@Test
	public void testLogin() {
		Map<String, Object> retrieved = service.loginUsers("whdgh1265", "dhkdn");
		logger.trace("{}", retrieved);
		assertThat(retrieved, is(not(nullValue())));
	}

	@Test
	public void testIdConfirm() {
		int retrieved = service.IdConfirm("lol6");
		logger.trace("{}", retrieved);
		assertThat(retrieved, is(1));
	}

	@Test
	public void TestFBoardDelete() {
		FBoard fboard = fdao.selectFBoard(22);
		fservice.deleteFBoardByFno(22);
		assertThat(fboard.getFno(), is(not(nullValue())));
		
		Board retrieved = bdao.selectBoard(52);
		bservice.delete(52);
		assertThat(retrieved.getNo(), is(not(nullValue())));
		
	}

	@Test
	public void TestFBoardInsert() {
		Board board = new Board();
		
		board.setCode("11");
		board.setUserId("every9168");
		bservice.insertBoard(board);
		
		FBoard fboard = new FBoard();
		fboard.setTitle("줴훈줴훈");
		fboard.setFcontext("저 사람 이솽훼");
		fboard.setFview(3);
		fboard.setBoardCode("11");
		fboard.setUserId("every9168");
		fservice.insertFBoard(fboard);
		logger.trace("{}", fboard);
		
		
	}

	@Test
	public void TestFBoardUpdate() {
		FBoard fboard = new FBoard();
		fboard.setFno(5);
		fboard.setTitle("재훈재훈재훈");
		fboard.setFcontext("저 사람 이상하다고");
		fservice.updateFBoard(fboard);
		logger.trace("{}", fboard);
		FBoard retrieved = fdao.selectFBoard(5);
		assertThat(retrieved.getTitle(), is("재훈재훈재훈"));
	}

	@Test
	public void TestFBoardselect() {
		List<FBoard> fboard = fdao.selectFBoardByCode(1, "11");
		fservice.selectFBoardByCode(1, "11");
		assertThat(fboard, is(not(nullValue())));
	}
	
	@Test
	   public void TestFBoardselectById(){
	      List<FBoard> fboard = fdao.selectFBoardById("loll333");
	      fservice.selectFBoardById("loll333");
	      assertThat(fboard,is(not(nullValue())));
	   }
	
	@Test
	   public void TestFBoardselectByTitle(){
	      List<FBoard> fboard = fdao.selectFBoardByTitle("재");
	      fservice.selectFBoardByTitle("재");
	      logger.trace("{}",fboard);
	      assertThat(fboard,is(not(nullValue())));
	   }
}
