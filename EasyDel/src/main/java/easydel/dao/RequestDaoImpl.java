package easydel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.contant.RequestStatus;
import easydel.entity.Request;

public class RequestDaoImpl implements IRequestDao {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(RequestDaoImpl.class);
	}
	@Autowired
	private SqlSession session;
	
	private String jll_namespace = "easydel.jll.mapper.requests";
	private String gonew_namespace = "easydel.gonew.mapper.requests";

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

	@Override
	public int updateStatusOfRequest(RequestStatus requestStatus,
			Integer requestId) {
		String stmt = gonew_namespace + ".updateStatusOfRequest";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("requestStatus", requestStatus.getStatusCode());
		params.put("requestId", requestId);
		int result = session.update(stmt, params);
		return result;
	}

	@Override
	public int updateStatusAndRemoveCourier(Integer requestId) {
		String stmt = gonew_namespace + ".updateStatusAndRemoveCourier";
		int result = session.update(stmt, requestId);
		return result;
	}

	@Override
	public Request selectRequestJoinRequestCmtByRequestId(Integer requestId) {
		String stmt = gonew_namespace + ".selectRequestJoinRequestCmtByRequestId";
		Request result = session.selectOne(stmt, requestId);
		return result;
	}

	@Override
	public int updateStatusAndApplyCourier(String courierId, Integer requestId) {
		String stmt = gonew_namespace + ".updateStatusAndApplyCourier";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("courierId", courierId);
		params.put("requestId", requestId);
		int result = session.update(stmt, params);
		return result;
	}

	@Override
	public Integer selectValidationCodeByRequestId(Integer requestId) {
		String stmt = gonew_namespace + ".selectValidationCodeByRequestId";
		Integer result = session.selectOne(stmt, requestId);
		return result;
	}
	
	@Override
	public List<Integer> selectExpireRequestsId() {
		String stmt = gonew_namespace + ".selectExpireRequestsId";
		List<Integer> result = session.selectList(stmt);
		return result;
	}
}
