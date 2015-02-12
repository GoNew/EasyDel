package easydel.dao;

import easydel.entity.Request;

public interface IRequestDao {
	
	public int insertRequest(Request request);
	public int deleteRequestrByRequestId(Integer requestId);
	public int updateRequestPicture(Request request);
	public int CheckvalidationCode(Request request);
	public int selectDeliveryPriceByRequestId(Integer requestId);
	public Request selectRequestByRequestId(Integer requestId);
}
