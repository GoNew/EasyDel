package easydel.service;

import easydel.entity.Request;
import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.exception.VaildateFailException;

public interface IRequestService {
	
	public void serviceRegistrateNewRequest(Request request)
	throws ServiceFailException;
	
	public void Checkvalicode(Request request)
	throws VaildateFailException;
	}
