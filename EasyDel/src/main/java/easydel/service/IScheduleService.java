package easydel.service;

import easydel.exception.ServiceFailException;

public interface IScheduleService {
	public void checkAndDeleteExpireRequest() throws ServiceFailException;
}
