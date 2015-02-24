package easydel.service;

import java.util.List;

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;

public interface IProfileService {
	public List<CourierEval> serviceGetCourierInfos(Integer pageNum, String courierId);
	public int serviceGetTotalPageNumOfCourierEval(String courierId);
	public List<SenderEval> serviceGetSenderInfos(Integer pageNum, String senderId);
	public int serviceGetTotalPageNumOfSenderEval(String senderId);
}
