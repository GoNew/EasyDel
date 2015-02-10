package easydel.service;

import easydel.entity.Request;
import easydel.exception.ServiceFailException;
import easydel.exception.VaildateFailException;

public interface IRequestService {
	
	public void serviceRegistrateNewRequest()
	throws ServiceFailException;
	public void Checkvalicode(Request request)
	throws VaildateFailException;
	}
