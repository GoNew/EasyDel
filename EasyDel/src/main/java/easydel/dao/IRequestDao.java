package easydel.dao;

import java.util.List;

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
	public Request selectRequestJoinRequestCmtByRequestId(Integer requestId);
	public int updateStatusAndApplyCourier(String courierId, Integer requestId);
	public Integer selectValidationCodeByRequestId(Integer requestId);
	public List<Integer> selectExpireRequestsId();
}
