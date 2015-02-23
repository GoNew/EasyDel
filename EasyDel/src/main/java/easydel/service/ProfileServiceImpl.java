package easydel.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.dao.IProfileDao;
import easydel.entity.CourierEval;

public class ProfileServiceImpl implements IProfileService {
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IProfileDao dao;
	
	@Override	
	public List<CourierEval> serviceGetCourierInfos(Integer pageNum, String courierId){
		return dao.selectCourierEvalsByUserId(pageNum, courierId);
	}
	
	private final int setPageSize = 5;
	
	@Override
	public int serviceGetTotalPageNumOfCourierEval(String courierId) {
		Integer result = dao.selectCountOfCourierInfosByUserId(courierId);
		if(result == null)
			result = new Integer(0);
		return (result / setPageSize) + 1;
	}
}
