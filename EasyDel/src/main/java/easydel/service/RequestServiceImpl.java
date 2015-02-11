package easydel.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.IRequestDao;
import easydel.entity.Request;
import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.exception.VaildateFailException;

public class RequestServiceImpl implements IRequestService {
	
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IRequestDao dao;

	@Autowired
	private SqlSession session;

	@Override
	@Transactional
	public void serviceRegistrateNewRequest(Request request)
			throws ServiceFailException {
		int result = 0;
		result = dao.insertRequest(request);

		if (result <= 0) {
			throw new ServiceFailException();
		}
		
	}

	@Override
	@Transactional
	public void Checkvalicode(Request request) throws VaildateFailException {
		
	}

	
}
