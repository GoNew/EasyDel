package easydel.service;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import easydel.dao.IRequestDao;
import easydel.dao.IUserDao;
import easydel.entity.Request;
import easydel.exception.ServiceFailException;

public class RequestServiceImpl implements IRequestService {

	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IRequestDao requestDao;
	@Autowired
	private IUserDao userDao;

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
}
