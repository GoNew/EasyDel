package easydel.dao;

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;
import easydel.entity.User;

public interface IEvalDao {
	public User selectCourierByRequestId(Integer requestId);
	public int insertCourierEval(CourierEval courierEval);
	public User selectSenderByRequestId(Integer requestId);
	public int insertSenderEval(SenderEval senderEval);
}
