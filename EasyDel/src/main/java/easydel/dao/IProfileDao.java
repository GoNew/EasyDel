package easydel.dao;

import java.util.List;

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;

public interface IProfileDao {
	public Integer selectCountOfCourierInfosByUserId(String userId);
	public List<CourierEval> selectCourierEvalsByUserId(Integer pageNum,
			String courierId);
	public Integer selectCountOfSenderInfosByUserId(String userId);
	public List<SenderEval> selectSenderEvalsByUserId(Integer pageNum,
			String senderId);
}
