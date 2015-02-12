package easydel.service;

import org.springframework.web.multipart.MultipartFile;

import easydel.entity.Request;
import easydel.exception.ServiceFailException;
import easydel.exception.VaildateFailException;

public interface IRequestService {
	
	public void serviceRegistrateNewRequest(Request request, MultipartFile file)
	throws ServiceFailException;
	
	public void Checkvalicode(Request request)
	throws VaildateFailException;
}
