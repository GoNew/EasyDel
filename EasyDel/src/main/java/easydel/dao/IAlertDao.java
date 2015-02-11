package easydel.dao;

import java.util.List;

import easydel.entity.AlertLog;

public interface IAlertDao {
	public List<AlertLog> selectAlertLogsByUserId(String userId);
	public Integer countAlertLogsByUserId(String userId);
	public int insertAlertLog(AlertLog alertLog);
	public int deleteAlertLogByAlertId(Integer alertId);
}
