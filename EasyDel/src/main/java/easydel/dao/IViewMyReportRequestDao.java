package easydel.dao;

import java.util.List;

import easydel.entity.ViewMyReportRequest;

public interface IViewMyReportRequestDao {
	public List<ViewMyReportRequest> selectMyReportRequest(String userId);
}
