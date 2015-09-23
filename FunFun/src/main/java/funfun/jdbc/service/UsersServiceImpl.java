package funfun.jdbc.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import funfun.jdbc.dao.UsersDao;
import funfun.jdbc.dto.Users;

@Service
public class UsersServiceImpl implements UsersService {
	private static Logger logger = LoggerFactory.getLogger(UsersServiceImpl.class);

	@Autowired
	UsersDao dao;

	@Override
	@Transactional
	public void update(Users user) {
		int updateResult = dao.updateUser(user);
		logger.trace("update over : {}", updateResult);
	}
	
	@Override
	@Transactional
	public void updatePass(Users user) {
		int updateResult = dao.updatePass(user);
		logger.trace("update over : {}", updateResult);
	}

	@Override
	public String PassById(Users user) {
		String selectResult = dao.getUserPasswordById(user.getId());
		logger.trace("select over : {}", selectResult);
		if (selectResult == user.getId()) {
			return "0";
		} else {
			return "1";
		}
	}
	@Override
	public String IdById(Users user) {
		String selectResult = dao.getUserIdById(user.getId());
		logger.trace("select over : {}", selectResult);
		if (selectResult == user.getId()) {
			return "0";
		} else {
			return "1";
		}
	}
	
	
	@Override
	public void insert(Users user) {
		int insertResult = dao.insertUser(user);
		logger.trace("insert over : {}",insertResult);
		//Return 필요
	}

	@Override
	public int IdConfirm(String id) {
		int selectId = dao.getUsersIdCount(id);
		logger.trace("Idconfirm : {}", selectId);
		return selectId;
	}

	@Override
	public void delete(String id) {
		int deleteId = dao.deleteUser(id);
		//로깅 리턴 필요
	}

	@Override
	public String checkId(String id) {
		String listId = "";
		try {
			listId = dao.checkId(id);
		} catch (EmptyResultDataAccessException e) {
			listId = "";
		}
		logger.trace("select over : {}", listId);
		if (listId == ""){
			return "0";
		} else {
			return "1";
		}
	}

	@Override
	public String checkNickname(String id) {
		String listNickName = "";
		try {
			listNickName = dao.checkNickname(id);
		} catch (EmptyResultDataAccessException e) {
			listNickName = "";
		}
		logger.trace("select over : {}", listNickName);
		if (listNickName == ""){
			return "0";
		} else {
			return "1";
		}
	}

	@Override
	public String checkEmail(String id) {
		String listEmail = "";
		try {
			listEmail = dao.checkEmail(id);
		} catch (EmptyResultDataAccessException e) {
			listEmail = "";
		}
		logger.trace("select over : {}", listEmail);
		if (listEmail == ""){
			return "0";
		} else {
			return "1";
		}
	}
	
	@Override
	public Users loginUsers(String id, String pass){
		Users users = null;
		try {
			users = dao.loginUsers(id, pass);
		} catch (EmptyResultDataAccessException e) {
			users=null;
		}
		logger.trace("{}",users);
		if (users == null){
			return null;
		} else {
			return users;
		}
	}

	@Override
	public void updateRoll(Users user) {
		int updateResult = dao.updateRoll(user);
		logger.trace("update over : {}", updateResult);
		
	}

}