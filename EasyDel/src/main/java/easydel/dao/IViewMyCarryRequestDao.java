package easydel.dao;

import java.util.List;

import easydel.entity.ViewMyCarryRequest;

public interface IViewMyCarryRequestDao {
	public List<ViewMyCarryRequest> selectMyCarryRequest(String userId);
}
