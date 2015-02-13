package easydel.service;

import easydel.entity.CourierEval;
import easydel.exception.ServiceFailException;

public interface IEvalService {
	public void serviceGetCourier(String requestId);
	public void serviceCourierEval(CourierEval courierEval) throws ServiceFailException;
}
