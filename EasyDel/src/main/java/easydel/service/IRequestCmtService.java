package easydel.service;

import org.springframework.web.multipart.MultipartFile;

import easydel.exception.ServiceFailException;

public interface IRequestCmtService {
	public void addNewRequestCmt(Integer requestId, String userId, String contentText, MultipartFile file)
			throws ServiceFailException;
}
