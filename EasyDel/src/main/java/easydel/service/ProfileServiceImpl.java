package easydel.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.dao.IProfileDao;
import easydel.entity.CourierEval;
import easydel.entity.SenderEval;

public class ProfileServiceImpl implements IProfileService {
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	private final int setPageSize = 5;
	@Autowired
	private IProfileDao dao;
	
	@Override	
	public List<CourierEval> serviceGetCourierInfos(Integer pageNum, String courierId){
		return dao.selectCourierEvalsByUserId(pageNum, courierId);
	}
	
	@Override
	public int serviceGetTotalPageNumOfCourierEval(String courierId) {
		Integer result = dao.selectCountOfCourierInfosByUserId(courierId);
		if(result == null)
			result = new Integer(0);
		return (result / setPageSize) + 1;
	}

	@Override
	public List<SenderEval> serviceGetSenderInfos(Integer pageNum,
			String senderId) {
		return dao.selectSenderEvalsByUserId(pageNum, senderId);
	}

	@Override
	public int serviceGetTotalPageNumOfSenderEval(String senderId) {
		Integer result = dao.selectCountOfSenderInfosByUserId(senderId);
		if(result == null)
			result = new Integer(0);
		return (result / setPageSize) + 1;
	}
}
