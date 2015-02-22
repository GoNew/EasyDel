package easydel.dao;

import java.util.List;

import easydel.entity.CourierEval;

public interface IProfileDao {
	public List<CourierEval> selectCourierInfos(Integer pageNum, String courierId);
}
