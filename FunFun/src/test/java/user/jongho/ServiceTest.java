package user.jongho;


import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertThat;

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
import funfun.jdbc.dao.FBoardDao;
import funfun.jdbc.dao.UsersDao;
import funfun.jdbc.dto.Board;
import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Users;
import funfun.jdbc.service.BoardService;
import funfun.jdbc.service.FBoardService;
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

	@Test
	public void testServiceBean() {
		logger.trace("service bean ok? {}", service);
		assertThat(service, is(not(nullValue())));
	}

	@Test
	public void testInsert() {
		Users user = new Users();
		user.setId("zxz222");
		String name = "롤2";
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
		FBoard fboard = fdao.selectFBoard(4);
		fservice.deleteFBoardByFno(4);
		assertThat(fboard.getFno(), is(not(nullValue())));
		
		Board retrieved = bdao.selectBoard(4);
		bservice.delete(4);
		assertThat(retrieved.getNo(), is(not(nullValue())));
		
	}

	@Test
	public void TestFBoardInsert() {
		Board board = new Board();
		board.setNo(6);
		board.setCode("11");
		board.setUserId("whdgh1265");
		bservice.insertBoard(board);
		
		FBoard fboard = new FBoard();
		fboard.setTitle("줴훈줴훈");
		fboard.setFContext("저 사람 이솽훼");
		fboard.setFview(1);
		fboard.setBoardNo(1);
		fboard.setBoardCode("11");
		fboard.setUserId("whdgh1265");
		fservice.insertFBoard(fboard);
		logger.trace("{}", fboard);
		
		
	}

	@Test
	public void TestFBoardUpdate() {
		FBoard fboard = new FBoard();
		fboard.setFno(5);
		fboard.setTitle("재훈재훈재훈");
		fboard.setFContext("저 사람 이상하다고");
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
}
