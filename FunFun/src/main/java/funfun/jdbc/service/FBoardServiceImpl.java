package funfun.jdbc.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funfun.jdbc.dao.FBoardDao;
import funfun.jdbc.dto.FBoard;

@Service
public class FBoardServiceImpl implements FBoardService {
   private static Logger logger = LoggerFactory.getLogger(FBoardServiceImpl.class);
   @Autowired
   FBoardDao fdao;
   
   @Override
   public void insertFBoard(FBoard fboard) {
      int insertresult = fdao.insertFBoard(fboard);
      logger.trace("insert over : {}",insertresult);
   }

   @Override
   public void deleteFBoard(String userId) {
      int deleteresult = fdao.deleteFBoard(userId);
      logger.trace("delete over : {}",deleteresult);
      
   }

}