package easydel.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.dao.IEvalDao;
import easydel.entity.CourierEval;
import easydel.entity.User;
import easydel.exception.ServiceFailException;

public class EvalServiceImpl implements IEvalService {
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IEvalDao dao;

	@Autowired
	private SqlSession session;
	
	@Override
	public void serviceGetCourier(String requestId){
		User user = null;
		
		user = dao.selectCourierByRequestId(requestId);
	}

	@Override
	public void serviceCourierEval(CourierEval courierEval) throws ServiceFailException {
		int result = 0;
		result = dao.insertCourierEval(courierEval);
		
		if(result <=0){
			throw new ServiceFailException();
		}
	}

}
