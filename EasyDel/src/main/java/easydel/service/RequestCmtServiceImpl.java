package easydel.service;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import easydel.dao.IRequestCmtDao;
import easydel.entity.RequestCmt;
import easydel.exception.ServiceFailException;

public class RequestCmtServiceImpl implements IRequestCmtService {
	@Autowired
	IRequestCmtDao reqCmtDao;

	public static final Logger logger = LoggerFactory
			.getLogger(RequestCmtServiceImpl.class);
	
	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void addNewRequestCmt(Integer requestId, String userId,
			String contentText, MultipartFile file) throws ServiceFailException {
		if((requestId == null) || (userId == null))
			throw new ServiceFailException("권한없는 접근");
		if((file == null || file.isEmpty()) && (contentText == null || contentText.isEmpty()))
			throw new ServiceFailException("사진과 내용 둘다 작성되지 않음");

		RequestCmt reqCmt = new RequestCmt();
		if(contentText != null)
			reqCmt.setReplyText(contentText);
		reqCmt.setRequestId(requestId);
		reqCmt.setUserId(userId);
		if(reqCmtDao.insertRequestCmt(reqCmt) <= 0)
			throw new ServiceFailException("댓글 저장 실패");

		File createPictureFile = null;
		try {
			if (file != null && !file.isEmpty()) {
				createPictureFile = new File("c:/db/uploaded/cmt/"
						+ reqCmt.getCmtId());
				file.transferTo(createPictureFile);
				logger.trace("mylog: " + reqCmt);
				logger.trace("mylog: " + "/cmt/" + reqCmt.getCmtId());
				if (reqCmtDao.updateRequestCmtPicturePathByCmtId(reqCmt.getCmtId(), "/cmt/" + reqCmt.getCmtId())
						<= 0) {
					throw new ServiceFailException("이미지 경로 저장 실패");
				}
			}
		} catch (IllegalStateException | IOException e) {
			if(createPictureFile != null) {
				createPictureFile.delete();
			}
			throw new ServiceFailException("이미지 저장 실패");
		}
	}
}
