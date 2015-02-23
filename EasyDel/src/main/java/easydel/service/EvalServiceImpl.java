package easydel.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.IEvalDao;
import easydel.entity.CourierEval;
import easydel.entity.SenderEval;
import easydel.entity.User;
import easydel.exception.ServiceFailException;

public class EvalServiceImpl implements IEvalService {
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IEvalDao dao;

	@Autowired
	private SqlSession session;
	
	@Override
	public User serviceGetCourier(Integer requestId) throws ServiceFailException{
		if(requestId == null)
			throw new ServiceFailException("존재하지 않는 의뢰 글");
		User user = null;
		user = dao.selectCourierByRequestId(requestId);
		if(user == null)
			throw new ServiceFailException("해당 유저를 찾을 수 없음");
		return user;
	}
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void serviceCourierEval(CourierEval courierEval) throws ServiceFailException {
		int result = 0;
		result = dao.insertCourierEval(courierEval);
		
		if(result <= 0){
			throw new ServiceFailException("알수 없는 에러");
		}
	}
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void serviceUpdateCourierEval(Integer requestId) throws ServiceFailException{ 
		int result = 0;
		result = dao.updateCourierEvalScore(requestId);
		
		if(result <= 0){
			throw new ServiceFailException("알수 없는 에러");
		}
	}
	
	
	
	@Override
	public User serviceGetSender(Integer requestId){
		User user = null;
		user = dao.selectSenderByRequestId(requestId);
		return user;
	}

	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void serviceSenderEval(SenderEval senderEval) throws ServiceFailException {
		int result = 0;
		result = dao.insertSenderEval(senderEval);
		
		if(result <= 0){
			throw new ServiceFailException("알수 없는 에러");
		}
	}
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void serviceUpdateSenderEval(Integer requestId) throws ServiceFailException{ 
		int result = 0;
		result = dao.updateSenderEvalScore(requestId);
		
		if(result <= 0){
			throw new ServiceFailException("알수 없는 에러");
		}
	}

}
