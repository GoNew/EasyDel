package easydel.service;

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;
import easydel.entity.User;
import easydel.exception.ServiceFailException;

public interface IEvalService {
	public User serviceGetCourier(Integer requestId, String exeUserId) throws ServiceFailException;
	public void serviceCourierEval(CourierEval courierEval) throws ServiceFailException;
	
	public User serviceGetSender(Integer requestId, String exeUserId) throws ServiceFailException;
	public void serviceSenderEval(SenderEval senderEval) throws ServiceFailException;
}
