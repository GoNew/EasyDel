package easydel.service;

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;
import easydel.entity.User;
import easydel.exception.ServiceFailException;

public interface IEvalService {
	public User serviceGetCourier(Integer requestId);
	public void serviceCourierEval(CourierEval courierEval) throws ServiceFailException;
	
	public User serviceGetSender(Integer requestId);
	public void serviceSenderEval(SenderEval senderEval) throws ServiceFailException;
}
