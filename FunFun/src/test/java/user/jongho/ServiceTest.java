package user.jongho;


import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertThat;

import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import funfun.jdbc.dao.UsersDao;
import funfun.jdbc.dto.Users;
import funfun.jdbc.service.UsersService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/application-config.xml")
public class ServiceTest {
	private static Logger logger = LoggerFactory.getLogger(ServiceTest.class);
	@Autowired
	UsersService service;
	@Autowired
	UsersDao dao;
	
	/*@Before
	public void cleanDB(){
		dao.deleteAllUsers();
	}*/
	@Test
	public void testServiceBean(){
		logger.trace("service bean ok? {}",service);
		assertThat(service, is(not(nullValue())));
	}
	@Test
	public void testInsert(){
		Users user = new Users();
		user.setId("lol6");
		String name="롤2";
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
	public void testUpdate(){
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
	public void testPassById(){
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
	public void testPassUpdate(){
		String sId = dao.getUserIdById("lol6");
		Users user = new Users();
		user.setId(sId);
		user.setPass("9090");
		System.out.println("1");
		service.updatePass(user);
		System.out.println("2");
		assertThat(user.getPass(), is("9090"));
	}
	
	@Test
	public void testRollUpdate(){
		String sId = dao.getUserIdById("lol6");
		Users user = new Users();
		user.setId(sId);
		user.setRoll("person");
		System.out.println("1");
		service.updateRoll(user);
		System.out.println("2");
		assertThat(user.getRoll(), is("person"));
	}
	
	@Test
	public void testIdById(){
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
	public void testIdCheck(){
		String retrieved = service.checkId("whdgh1265");
		logger.trace("{}",retrieved);
		assertThat(retrieved, is("0"));
	}
	
	@Test
	public void testNickNameCheck(){
		String retrieved = service.checkNickname("심슨");
		logger.trace("{}",retrieved);
		assertThat(retrieved, is("0"));
	}
	
	@Test
	public void testEmailCheck(){
		String retrieved = service.checkEmail("whdgh1265@naver.com");
		logger.trace("{}",retrieved);
		assertThat(retrieved, is("0"));
	}
	
	@Test
	public void testLogin(){
		Map<String, Object> retrieved = service.loginUsers("whdgh1265", "dhkdn");
		logger.trace("{}",retrieved);
		assertThat(retrieved, is(not(nullValue())));
	}
	
	@Test
	public void testDelete(){
		Users retrieved = dao.selectUser("lol7");
		service.delete("lol7");
		assertThat(retrieved.getId(),is(nullValue()));
	}
	
	@Test
	public void testIdConfirm(){
		int retrieved = service.IdConfirm("lol6");
		logger.trace("{}",retrieved);
		assertThat(retrieved,is(1));
	}
}
