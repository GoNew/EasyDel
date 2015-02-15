package easydel.dao;

import easydel.contant.RequestStatus;
import easydel.entity.Request;

public interface IRequestDao {
	
	public int insertRequest(Request request);
	public int deleteRequestrByRequestId(Integer requestId);
	public int updateRequestPicture(Request request);
	public int CheckvalidationCode(Request request);
	public int selectDeliveryPriceByRequestId(Integer requestId);
	public Request selectRequestByRequestId(Integer requestId);
	public int updateStatusOfRequest(RequestStatus requestStatus, Integer requestId);
	public int updateStatusAndRemoveCourier(Integer requestId);
}
