package easydel.service;

import easydel.exception.ServiceFailException;

public interface ISmsMessageService {
	public boolean sendSms(String sendMsg, String phoneNum) throws ServiceFailException;
}
