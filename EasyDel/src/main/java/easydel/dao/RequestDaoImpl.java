package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.Request;

public class RequestDaoImpl implements IRequestDao {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(RequestDaoImpl.class);
	}
	@Autowired
	private SqlSession session;
	
	private String jll_namespace = "easydel.jll.mapper.requests";

	public RequestDaoImpl() {
	}

	@Override
	public int insertRequest(Request request) {
		String stmt = jll_namespace + ".insertUser";
		int result = session.insert(stmt, request);
		return result;
	}

	@Override
	public int deleteRequest(Request request) {
		String stmt = jll_namespace + ".deleteRequestrByUserId";
		int result = session.delete(stmt, request);
		return result;
	}

	@Override
	public int CheckvalidationCode(Request request) {
		return 0;
	}

	
}
