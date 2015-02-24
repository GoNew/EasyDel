package easydel.dao;

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;
import easydel.entity.User;

public interface IEvalDao {
	public User selectCourierByRequestId(Integer requestId, String exeUserId);
	public int insertCourierEval(CourierEval courierEval);
	public int updateCourierEvalScore(Integer requestId);
	public int checkAndUpdateCourierEvalStatusSetComplete(Integer requestId);
	
	public User selectSenderByRequestId(Integer requestId, String exeUserId);
	public int insertSenderEval(SenderEval senderEval);
	public int updateSenderEvalScore(Integer requestId);
	public int checkAndUpdateSenderEvalStatusSetComplete(Integer requestId);
}
