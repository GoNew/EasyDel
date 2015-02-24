package easydel.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import easydel.entity.Request;
import easydel.entity.ViewMyCarryRequest;
import easydel.entity.ViewMyReportRequest;
import easydel.entity.ViewMySendRequest;
import easydel.exception.ServiceFailException;

public interface IRequestService {

	public void serviceRegistrateNewRequest(Request request, MultipartFile file)
			throws ServiceFailException;

	public void serviceRemoveRequest(String deleteExcuteUserId,
			Integer requestId) throws ServiceFailException;

	public HashMap<String, List<ViewMyCarryRequest>> serviceGetMyCarryRequestList(
			String userId) throws ServiceFailException;

	public HashMap<String, List<ViewMyReportRequest>> serviceGetMyReportRequestList(
			String userId) throws ServiceFailException;

	public HashMap<String, List<ViewMySendRequest>> serviceGetMySendRequestList(
			String userId) throws ServiceFailException;

	public void admitCourierToPerformRequest(String exeUserId, Integer requestId)
			throws ServiceFailException;

	public void rejectCourierToPerformRequest(String exeUserId,
			Integer requestId) throws ServiceFailException;

	public void completeRequest(String exeUserId, Integer requestId)
			throws ServiceFailException;

	public Request getRequest(Integer requestId) throws ServiceFailException;

	public void cancelRequestBeforeDelFromCourier(String exeUserId, Integer requestId)
			throws ServiceFailException;

	public void arriveRequest(String exeUserId, Integer requestId)
			throws ServiceFailException;
	
	public Request getRequestWithRequestCmts(Integer requestId)
			throws ServiceFailException;

	public void applyRequest(String exeUserId, Integer requestId)
			throws ServiceFailException;

	public void cancelRequestOnDel(String exeUserId, Integer requestId)
			throws ServiceFailException;
}
