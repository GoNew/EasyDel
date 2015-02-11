package easydel.service;

import java.util.List;

import easydel.contant.AlertStatus;
import easydel.entity.AlertLog;
import easydel.exception.ServiceFailException;

//2015.02.11 10:48 오현성 작성

//alert log를 보여주고, 삭제하는 등의 서비스를 제공하기 위한 service interface
public interface IAlertService {
	public List<AlertLog> getAlert(String userId);
	public int getAlertListCount(String userId);
	public boolean hasMoreRemainingEvalThings(String userId);
	public void insertAlert(String userId, String comment, AlertStatus status) throws ServiceFailException;
	public void deleteAlert(Integer alertId) throws ServiceFailException;
}
