package easydel.dao;

import java.util.List;

import easydel.entity.ViewMySendRequest;

public interface IViewMySendRequestDao {
	public List<ViewMySendRequest> selectMySendRequest(String userId);
}
