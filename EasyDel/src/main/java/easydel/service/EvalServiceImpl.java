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
	public User serviceGetCourier(Integer requestId, String exeUserId) throws ServiceFailException {
		if(requestId == null)
			throw new ServiceFailException("존재하지 않는 의뢰 글");
		User user = null;
		user = dao.selectCourierByRequestId(requestId, exeUserId);
		if(user == null)
			throw new ServiceFailException("접근 불가능한 유저");
		return user;
	}
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void serviceCourierEval(CourierEval courierEval) throws ServiceFailException {
		if(dao.checkAndUpdateCourierEvalStatusSetComplete(courierEval.getRequestId())
				<= 0)
			throw new ServiceFailException("이미 평가된 글");
		if(dao.insertCourierEval(courierEval) <= 0)
			throw new ServiceFailException("평가 등록 실패");
		if(dao.updateCourierEvalScore(courierEval.getRequestId()) <= 0)
			throw new ServiceFailException("유저 평가 정보 update 실패");
	}
	
	@Override
	public User serviceGetSender(Integer requestId, String exeUserId) throws ServiceFailException {
		if(requestId == null)
			throw new ServiceFailException("존재하지 않는 의뢰 글");
		User user = null;
		user = dao.selectSenderByRequestId(requestId, exeUserId);
		if(user == null)
			throw new ServiceFailException("접근 불가능한 유저");
		return user;
	}

	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void serviceSenderEval(SenderEval senderEval) throws ServiceFailException {
		if(dao.checkAndUpdateSenderEvalStatusSetComplete(senderEval.getRequestId())
				<= 0)
			throw new ServiceFailException("이미 평가된 글");
		if(dao.insertSenderEval(senderEval) <= 0)
			throw new ServiceFailException("평가 등록 실패");
		if(dao.updateSenderEvalScore(senderEval.getRequestId()) <= 0)
			throw new ServiceFailException("유저 평가 정보 update 실패");
	}
}
