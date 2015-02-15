package easydel.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import easydel.contant.RequestStatus;
import easydel.dao.IRequestDao;
import easydel.dao.IUserDao;
import easydel.dao.IViewMyCarryRequestDao;
import easydel.dao.IViewMyReportRequestDao;
import easydel.dao.IViewMySendRequestDao;
import easydel.entity.Request;
import easydel.entity.ViewMyCarryRequest;
import easydel.entity.ViewMyReportRequest;
import easydel.entity.ViewMySendRequest;
import easydel.exception.ServiceFailException;

public class RequestServiceImpl implements IRequestService {

	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IRequestDao requestDao;
	@Autowired
	private IUserDao userDao;
	@Autowired
	private IViewMyCarryRequestDao viewMyCarryDao;
	@Autowired
	private IViewMyReportRequestDao viewMyReportDao;
	@Autowired
	private IViewMySendRequestDao viewMySendDao;

	@Override
	@Transactional(rollbackFor = { ServiceFailException.class })
	public void serviceRegistrateNewRequest(Request request, MultipartFile file)
			throws ServiceFailException {
		int insertResult = 0;

		insertResult = requestDao.insertRequest(request);

		if (insertResult <= 0) {
			throw new ServiceFailException();
		}

		int updateResult = 0;
		String filePath = null;
		File createRequest = null;
		try {
			if (file != null && !file.isEmpty()) {
				createRequest = new File("c:/db/uploaded/request/"
						+ request.getRequestId());
				file.transferTo(createRequest);
				filePath = "/request/" + request.getRequestId();
				request.setCargoPicture(filePath);
				updateResult = requestDao.updateRequestPicture(request);
				if (updateResult <= 0) {
					throw new ServiceFailException("db 수정 실패 - 알 수 없는 원인");
				}
			}
		} catch (IllegalStateException | IOException e) {
			if(createRequest != null) {
				createRequest.delete();
			}
			throw new ServiceFailException("이미지 저장 실패");
		}
		
		if(userDao.selectUserEDMoney(request.getSenderId())
				< request.getDeliveryPrice()) {
			throw new ServiceFailException("EDMoney 잔액 부족");
		}
		if(userDao.updateUserEDMoney(request.getSenderId(), (request.getDeliveryPrice() * (-1)))
				<= 0) {
			throw new ServiceFailException("EDMoney 수정 실패 - 알 수 없는 원인");
		}
		
	}

	@Override
	public void serviceRemoveRequest(Integer requestId)
			throws ServiceFailException {
		Request currRequest = requestDao.selectRequestByRequestId(requestId);
		if(userDao.updateUserEDMoney(currRequest.getSenderId(), currRequest.getDeliveryPrice())
				<= 0) {
			throw new ServiceFailException("EDMoney 환불 실패 - 알 수 없는 원인");
		}
		if(requestDao.deleteRequestrByRequestId(requestId)
				<= 0) {
			throw new ServiceFailException("request 삭제 실패 - 알 수 없는 원인");
		}
	}
	
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public HashMap<String, List<ViewMyCarryRequest>> serviceGetMyCarryRequestList(String userId)
			throws ServiceFailException {
		if(userId == null) throw new ServiceFailException("입력된 아이디가 null");
		HashMap<String, List<ViewMyCarryRequest>> result = new HashMap<String, List<ViewMyCarryRequest>>();
		List<ViewMyCarryRequest> allList = viewMyCarryDao.selectMyCarryRequest(userId);
		List<ViewMyCarryRequest> beforeDel = new ArrayList<ViewMyCarryRequest>();
		List<ViewMyCarryRequest> onDel = new ArrayList<ViewMyCarryRequest>();
		List<ViewMyCarryRequest> afterDel = new ArrayList<ViewMyCarryRequest>();
		for(ViewMyCarryRequest req: allList) {
			switch(RequestStatus.valueOf(req.getRequestStatus())) {
			case request:
			case wait:
				beforeDel.add(req);
				break;
			case on:
			case cancelBySender:
			case cancelByDeliver:
				onDel.add(req);
				break;
			case arrive:
			case quit:
				afterDel.add(req);
				break;
			default:
				break;
			}
		}
		result.put("beforeDel", beforeDel);
		result.put("onDel", onDel);
		result.put("afterDel", afterDel);
		return result;
	}
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public HashMap<String, List<ViewMyReportRequest>> serviceGetMyReportRequestList(String userId)
			throws ServiceFailException {
		if(userId == null) throw new ServiceFailException("입력된 아이디가 null");
		HashMap<String, List<ViewMyReportRequest>> result = new HashMap<String, List<ViewMyReportRequest>>();
		List<ViewMyReportRequest> allList = viewMyReportDao.selectMyReportRequest(userId);
		List<ViewMyReportRequest> reportList = new ArrayList<ViewMyReportRequest>();
		List<ViewMyReportRequest> reportedList = new ArrayList<ViewMyReportRequest>();
		for(ViewMyReportRequest req: allList) {
			if(userId.equals(req.getReportedUserId())) {
				reportedList.add(req);
			} else if(userId.equals(req.getReportUserId())) {
				reportList.add(req);
			}
		}
		result.put("report", reportList);
		result.put("reported", reportedList);
		return result;
	}
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public HashMap<String, List<ViewMySendRequest>> serviceGetMySendRequestList(String userId)
			throws ServiceFailException {
		if(userId == null) throw new ServiceFailException("입력된 아이디가 null");
		HashMap<String, List<ViewMySendRequest>> result = new HashMap<String, List<ViewMySendRequest>>();
		List<ViewMySendRequest> allList = viewMySendDao.selectMySendRequest(userId);
		List<ViewMySendRequest> beforeDel = new ArrayList<ViewMySendRequest>();
		List<ViewMySendRequest> onDel = new ArrayList<ViewMySendRequest>();
		List<ViewMySendRequest> afterDel = new ArrayList<ViewMySendRequest>();
		for(ViewMySendRequest req: allList) {
			switch(RequestStatus.valueOf(req.getRequestStatus())) {
			case request:
			case wait:
				beforeDel.add(req);
				break;
			case on:
			case cancelBySender:
			case cancelByDeliver:
				onDel.add(req);
				break;
			case arrive:
			case quit:
				afterDel.add(req);
				break;
			default:
				break;
			}
		}
		result.put("beforeDel", beforeDel);
		result.put("onDel", onDel);
		result.put("afterDel", afterDel);
		return result;
	}
}
