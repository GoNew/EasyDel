package easydel.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.IRequestDao;
import easydel.exception.ServiceFailException;

public class ScheduleServiceImpl implements IScheduleService {
	@Autowired
	private IRequestDao reqDao;
	@Autowired
	private IRequestService reqService;
	
	public static final Logger logger = LoggerFactory
			.getLogger(ScheduleServiceImpl.class);
	
	@Override
	@Scheduled(fixedDelay = 60000) // 1분 마다 실행
	@Transactional(rollbackFor={ServiceFailException.class})
	public void checkAndDeleteExpireRequest() throws ServiceFailException {
		List<Integer> expireList = reqDao.selectExpireRequestsId();
		logger.trace("mylog: 삭제 예정: " + expireList);
		for(Integer requestId: expireList) {
			reqService.removeRequestBySystem(requestId);
		}
	}

}
