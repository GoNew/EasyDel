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
		String stmt = jll_namespace + ".insertRequest";
		int result = session.insert(stmt, request);
		logger.trace("mylog: insertRequest 정상실행");
		return result;
	}
	
	@Override
	public int CheckvalidationCode(Request request) {
		return 0;
	}

	@Override
	public int deleteRequestrByRequestId(Integer requestId) {
		String stmt = jll_namespace + ".deleteRequestrByRequestId";
		int result = session.delete(stmt, requestId);
		return result;
	}

	@Override
	public int updateRequestPicture(Request request) {
		String stmt = jll_namespace + ".updateRequestPicture";
		int result = session.delete(stmt, request);
		return result;
	}

	@Override
	public int selectDeliveryPriceByRequestId(Integer requestId) {
		String stmt = jll_namespace + ".selectDeliveryPriceByRequestId";
		int result = session.selectOne(stmt, requestId);
		return result;
	}

	@Override
	public Request selectRequestByRequestId(Integer requestId) {
		String stmt = jll_namespace + ".selectRequestByRequestId";
		Request result = session.selectOne(stmt, requestId);
		return result;
	}

	
}
