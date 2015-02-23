package easydel.service;

import java.util.List;

import easydel.entity.CourierEval;

public interface IProfileService {
	public List<CourierEval> serviceGetCourierInfos(Integer pageNum, String courierId);

	int serviceGetTotalPageNumOfCourierEval(String courierId);
}
