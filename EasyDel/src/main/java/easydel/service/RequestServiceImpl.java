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

import easydel.contant.AlertStatus;
import easydel.contant.RequestStatus;
import easydel.dao.ICompleteDeliveryDao;
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
	@Autowired
	private IAlertService alertService;
	@Autowired
	private ICompleteDeliveryDao compDelDao;

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
	@Transactional(rollbackFor={ServiceFailException.class})
	public void serviceRemoveRequest(String deleteExcuteUserId, Integer requestId)
			throws ServiceFailException {
		if(deleteExcuteUserId == null)
			throw new ServiceFailException("삭제권한이 없는 유저");
		
		Request currRequest = requestDao.selectRequestByRequestId(requestId);
		if(currRequest == null)
			throw new ServiceFailException("존재하지 않는 글");
		
		if(!deleteExcuteUserId.equals(currRequest.getSenderId()))
			throw new ServiceFailException("삭제권한이 없는 유저");
		
		if(currRequest.getRequestStatus() != RequestStatus.request.getStatusCode())
			throw new ServiceFailException("해당 글이 삭제가 불가능한 상태");
		
		if(userDao.updateUserEDMoney(currRequest.getSenderId(), currRequest.getDeliveryPrice())
				<= 0)
			throw new ServiceFailException("EDMoney 환불 실패 - 알 수 없는 원인");

		if(requestDao.deleteRequestrByRequestId(requestId)
				<= 0)
			throw new ServiceFailException("request 삭제 실패 - 알 수 없는 원인");
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
			case arrive:
				onDel.add(req);
				break;
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
			case arrive:
				onDel.add(req);
				break;
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
	public void admitCourierToPerformRequest(String exeUserId, Integer requestId)
			throws ServiceFailException {
		if(exeUserId == null)
			throw new ServiceFailException("의뢰 수락 권한이 없는 유저");
		Request currRequest = requestDao.selectRequestByRequestId(requestId);
		if(currRequest == null)
			throw new ServiceFailException("존재하지 않는 글");
		if(!exeUserId.equals(currRequest.getSenderId()))
			throw new ServiceFailException("의뢰 수락 권한이 없는 유저");
		if(currRequest.getCourierId() == null)
			throw new ServiceFailException("의뢰 신청 유저가 존재하지 않습니다.");
		//거래 건수 update
		if(userDao.updateUserCourierTotalCntAddedVariation(currRequest.getCourierId(), 1) <=0
				|| userDao.updateUserSenderTotalCntAddedVariation(exeUserId, 1) <= 0)
			throw new ServiceFailException("거래 건수 update 중 에러 발생");
		
		if(requestDao.updateStatusOfRequest(RequestStatus.on, requestId)
				<= 0)
			throw new ServiceFailException("원인을 알 수 없는 에러");
		alertService.insertAlert(currRequest.getCourierId(),
				"'" + currRequest.getCargoName() + "'의뢰의 진행이 수락되었습니다.", AlertStatus.deliver);
	}
	
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void rejectCourierToPerformRequest(String exeUserId, Integer requestId)
			throws ServiceFailException {
		if(exeUserId == null)
			throw new ServiceFailException("의뢰 거절 권한이 없는 유저");
		Request currRequest = requestDao.selectRequestByRequestId(requestId);
		if(currRequest == null)
			throw new ServiceFailException("존재하지 않는 글");
		if(!exeUserId.equals(currRequest.getSenderId()))
			throw new ServiceFailException("의뢰 거절 권한이 없는 유저");
		if(currRequest.getCourierId() == null)
			throw new ServiceFailException("의뢰 신청 유저가 존재하지 않습니다.");
		
		if(requestDao.updateStatusAndRemoveCourier(requestId)
				<= 0)
			throw new ServiceFailException("원인을 알 수 없는 에러");
		alertService.insertAlert(currRequest.getCourierId(),
				"'" + currRequest.getCargoName() + "'의뢰의 진행이 거절되었습니다.", AlertStatus.deliver);
	}
	
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void cancelRequestBeforeDelFromCourier(String exeUserId, Integer requestId)
			throws ServiceFailException {
		if(exeUserId == null)
			throw new ServiceFailException("의뢰신청취소 권한이 없는 유저");
		Request currRequest = requestDao.selectRequestByRequestId(requestId);
		if(currRequest == null)
			throw new ServiceFailException("존재하지 않는 글");
		if(!exeUserId.equals(currRequest.getCourierId()))
			throw new ServiceFailException("의뢰신청취소 권한이 없는 유저");
		if(currRequest.getRequestStatus() != RequestStatus.wait.getStatusCode())
			throw new ServiceFailException("진행중 의뢰 취소 불가능");
		
		if(requestDao.updateStatusAndRemoveCourier(requestId)
				<= 0)
			throw new ServiceFailException("원인을 알 수 없는 에러");
		alertService.insertAlert(currRequest.getSenderId(),
				"'" + currRequest.getCargoName() + "'의뢰의 신청이 취소되었습니다.", AlertStatus.sender);
	}

	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void completeRequest(String exeUserId, Integer requestId)
			throws ServiceFailException {
		if(exeUserId == null)
			throw new ServiceFailException("거래 완료 권한이 없는 유저");
		Request currRequest = requestDao.selectRequestByRequestId(requestId);
		if(currRequest == null)
			throw new ServiceFailException("존재하지 않는 글");
		if(!exeUserId.equals(currRequest.getSenderId()))
			throw new ServiceFailException("거래 완료 권한이 없는 유저");
		if(currRequest.getCourierId() == null)
			throw new ServiceFailException("의뢰를 진행중인 유저가 존재하지 않습니다.");
		if(compDelDao.insertCompleteDelivery(requestId)
				<= 0)
			throw new ServiceFailException("거래완료 처리중 에러 발생");
		if(userDao.updateUserEDMoney(currRequest.getCourierId(), currRequest.getDeliveryPrice())
				<= 0)
			throw new ServiceFailException("운송인의 EDMoney를 갱신하는 중 에러");
		if(userDao.updateUserCourierSuccessCntAddedVariation(currRequest.getCourierId(), 1) <= 0
				| userDao.updateUserSenderSuccessCntAddedVariation(exeUserId, 1) <= 0)
			throw new ServiceFailException("SuccessCount 수정중 에러");
		
		if(requestDao.updateStatusOfRequest(RequestStatus.quit, requestId)
				<= 0)
			throw new ServiceFailException("원인을 알 수 없는 에러");
		alertService.insertAlert(currRequest.getCourierId(),
				"'" + currRequest.getCargoName() + "'의뢰가 거래완료 되었습니다.", AlertStatus.deliver);
		alertService.insertAlert(exeUserId,
				"'" + currRequest.getCargoName() + "'의뢰가 거래완료 되었습니다.", AlertStatus.sender);
	}

	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public Request getRequest(Integer requestId) throws ServiceFailException {
		Request result = null;
		result = requestDao.selectRequestByRequestId(requestId);
		if(result == null)
			throw new ServiceFailException("존재하지 않는 글");
		return result;
	}
	
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void arriveRequest(String exeUserId, Integer requestId) throws ServiceFailException {
		if(exeUserId == null)
			throw new ServiceFailException("운송완료 권한이 없는 유저");
		Request currRequest = requestDao.selectRequestByRequestId(requestId);
		if(currRequest == null)
			throw new ServiceFailException("존재하지 않는 글");
		if(!exeUserId.equals(currRequest.getCourierId()))
			throw new ServiceFailException("운송완료 권한이 없는 유저");
		switch (RequestStatus.valueOf(currRequest.getRequestStatus())) {
		default:
			throw new ServiceFailException("운송완료가 불가능한 글 상태");
		case on:
		case cancelByDeliver:
		case cancelBySender:
			break;
		}
		if(requestDao.updateStatusOfRequest(RequestStatus.arrive, requestId)
				<= 0)
			throw new ServiceFailException("글 상태 변경중 에러");
		alertService.insertAlert(currRequest.getSenderId(),
				"'" + currRequest.getCargoName() + "'의뢰의 운송이 완료 되었습니다.", AlertStatus.sender);
	}

	@Override
	public Request getRequestWithRequestCmts(Integer requestId)
			throws ServiceFailException {
		Request result = requestDao.selectRequestJoinRequestCmtByRequestId(requestId);
		if(result == null)
			throw new ServiceFailException("존재하지 않는 글");
		return result;
	}
	
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void applyRequest(String exeUserId, Integer requestId) throws ServiceFailException {
		if(exeUserId == null || requestId == null)
			throw new ServiceFailException("잘못된 접근");
		Request currRequest = requestDao.selectRequestByRequestId(requestId);
		if(currRequest == null)
			throw new ServiceFailException("존재하지 않는 글");
		if(currRequest.getRequestStatus() != RequestStatus.request.getStatusCode()
				|| currRequest.getSenderId() == exeUserId)
			throw new ServiceFailException("신청이 불가능한 의뢰");
		if(requestDao.updateStatusAndApplyCourier(exeUserId, requestId)
				<= 0)
			throw new ServiceFailException("신청 실패");
		alertService.insertAlert(currRequest.getSenderId(),
				"'" + currRequest.getCargoName() + "'의뢰에 대한 신청이 있습니다.",
				AlertStatus.sender);
	}
	
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void cancelRequestOnDel(String exeUserId, Integer requestId) throws ServiceFailException {
		if(exeUserId == null || requestId == null)
			throw new ServiceFailException("잘못된 접근");
		Request currRequest = requestDao.selectRequestByRequestId(requestId);
		if(currRequest == null)
			throw new ServiceFailException("존재하지 않는 글");
		switch (RequestStatus.valueOf(currRequest.getRequestStatus())) {
		case on:
			RequestStatus changeStatus = null;
			if(exeUserId.equals(currRequest.getSenderId())) {
				changeStatus = RequestStatus.cancelBySender;
			} else if(exeUserId.equals(currRequest.getCourierId())) {
				changeStatus = RequestStatus.cancelByDeliver;
			} else {
				throw new ServiceFailException("취소 권한이 없는 유저");
			}
			if(requestDao.updateStatusOfRequest(changeStatus, requestId)
					<= 0)
				throw new ServiceFailException("취소 요청중 에러 발생");
			alertService.insertAlert(currRequest.getSenderId(),
					"'" + currRequest.getCargoName() + "'의뢰 취소 신청되었습니다.",
					AlertStatus.sender);
			alertService.insertAlert(currRequest.getCourierId(),
					"'" + currRequest.getCargoName() + "'의뢰 취소 신청되었습니다.",
					AlertStatus.deliver);
			break;
		case cancelByDeliver:
			if(exeUserId.equals(currRequest.getSenderId()))
				deleteRequest(currRequest);
			break;
		case cancelBySender:
			if(exeUserId.equals(currRequest.getCourierId()))
				deleteRequest(currRequest);
			break;
		default:
			throw new ServiceFailException("취소가 불가능한 글");
		}
	}
	
	private void deleteRequest(Request currRequest) throws ServiceFailException {
		if(userDao.updateUserEDMoney(currRequest.getSenderId(), currRequest.getDeliveryPrice())
				<= 0)
			throw new ServiceFailException("EDMoney 환불 실패 - 알 수 없는 원인");
		if(requestDao.deleteRequestrByRequestId(currRequest.getRequestId())
				<= 0)
			throw new ServiceFailException("request 삭제 실패 - 알 수 없는 원인");
		alertService.insertAlert(currRequest.getSenderId(),
				"'" + currRequest.getCargoName() + "'의뢰가 삭제되었습니다.",
				AlertStatus.system);
		if(currRequest.getCourierId() != null) {
			alertService.insertAlert(currRequest.getCourierId(),
					"'" + currRequest.getCargoName() + "'의뢰가 삭제되었습니다.",
					AlertStatus.system);
		}
	}
	
}
