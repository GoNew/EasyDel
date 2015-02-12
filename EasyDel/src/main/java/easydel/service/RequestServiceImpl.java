package easydel.service;

import java.io.File;
import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import easydel.dao.IRequestDao;
import easydel.entity.Request;
import easydel.exception.ServiceFailException;
import easydel.exception.VaildateFailException;

public class RequestServiceImpl implements IRequestService {

	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IRequestDao dao;

	@Autowired
	private SqlSession session;

	@Override
	@Transactional(rollbackFor = { ServiceFailException.class })
	public void serviceRegistrateNewRequest(Request request, MultipartFile file)
			throws ServiceFailException {
		int insertResult = 0;

		insertResult = dao.insertRequest(request);

		if (insertResult <= 0) {
			throw new ServiceFailException();
		}

		int updateResult = 0;
		String filePath = null;
		File createProfile = null;
		try {
			if (file != null && !file.isEmpty()) {
				createProfile = new File("c:/db/uploaded/request/"
						+ request.getRequestId());
				file.transferTo(createProfile);
				filePath = "/request/" + request.getRequestId();
				request.setCargoPicture(filePath);
				updateResult = dao.updateRequestPicture(request);
				if (updateResult <= 0) {
					throw new ServiceFailException();
				}
			}
		} catch (IllegalStateException | IOException e) {
			throw new ServiceFailException();
		}
	}

	@Override
	@Transactional
	public void Checkvalicode(Request request) throws VaildateFailException {

	}

}
