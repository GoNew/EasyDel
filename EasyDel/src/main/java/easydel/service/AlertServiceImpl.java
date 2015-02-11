package easydel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.contant.AlertStatus;
import easydel.dao.IAlertDao;
import easydel.entity.AlertLog;
import easydel.exception.ServiceFailException;

public class AlertServiceImpl implements IAlertService {
	@Autowired
	IAlertDao dao;

	@Override
	public List<AlertLog> getAlert(String userId) {
		return dao.selectAlertLogsByUserId(userId);
	}

	@Override
	public int getAlertListCount(String userId) {
		Integer result = dao.countAlertLogsByUserId(userId);
		result = result != null ? result : 0;
		return result;
	}
	
	@Override
	public boolean hasMoreRemainingEvalThings(String userId) {
		Integer evalCount = dao.countRequestsBeforeEvalByUserId(userId);
		return (evalCount != null) && (evalCount != 0);
	}

	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void insertAlert(String userId, String comment, AlertStatus status)
			throws ServiceFailException {
		AlertLog alertLog = new AlertLog();
		alertLog.setAlertComment(comment);
		alertLog.setUserId(userId);
		alertLog.setAlertStatus(status.getAlertStatusCode());
		
		int insertResult = dao.insertAlertLog(alertLog);
		if(insertResult != 1) {
			throw new ServiceFailException();
		}
	}

	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void deleteAlert(Integer alertId)
			throws ServiceFailException {
		int deleteResult = dao.deleteAlertLogByAlertId(alertId);
		if(deleteResult != 1) {
			throw new ServiceFailException();
		}
	}

}
