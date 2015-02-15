package easydel.dao;

import easydel.entity.CourierEval;
import easydel.entity.User;

public interface IEvalDao {
	public User selectCourierByRequestId(Integer requestId);
	public int insertCourierEval(CourierEval courierEval);
}
