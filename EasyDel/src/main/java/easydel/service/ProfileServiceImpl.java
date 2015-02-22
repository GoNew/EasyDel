package easydel.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.dao.IProfileDao;
import easydel.entity.CourierEval;
import easydel.entity.Title;
import easydel.entity.User;

public class ProfileServiceImpl implements IProfileService {
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IProfileDao dao;

	@Autowired
	private SqlSession session;
	
	@Override	
	public List<CourierEval> serviceGetCourierInfos(Integer pageNum, String courierId){
		List<CourierEval> result = null;
		result = dao.selectCourierInfos(pageNum, courierId);
		return result;
	}
}
