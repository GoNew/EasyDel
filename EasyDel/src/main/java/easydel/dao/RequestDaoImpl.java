package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.User;


import easydel.entity.Request;

public class RequestDaoImpl implements IRequestDao {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(RequestDaoImpl.class);
	}

	@Override
	public Request insertRequest(Request request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Request selectRequest(Request request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Request updateRequest(Request request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Request deleteRequest(Request request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int CheckvalidationCode(Request request) {
		Integer Valicode;
///		Valicode = session.selectOne(,validationCode);// DB에서 validationCode를 가져오기
//		alicode = session.selectOne(jll_namespace+".selectUserById", userId);
		return 0;
		}

}
