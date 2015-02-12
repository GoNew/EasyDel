package easydel.service;

import org.springframework.web.multipart.MultipartFile;

import easydel.entity.Request;
import easydel.exception.ServiceFailException;

public interface IRequestService {
	
	public void serviceRegistrateNewRequest(Request request, MultipartFile file)
			throws ServiceFailException;
	public void serviceRemoveRequest(Integer requestId)
			throws ServiceFailException;
}
