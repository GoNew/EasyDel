package easydel.service;

import org.springframework.beans.factory.annotation.Autowired;

import easydel.dao.IViewMyCarryRequestDao;
import easydel.dao.IViewMyReportRequestDao;
import easydel.dao.IViewMySendRequestDao;

public class ShowMyRequestsImpl implements IShowMyRequests {
	@Autowired
	IViewMyCarryRequestDao viewMyCarryRequestDao;
	@Autowired
	IViewMyReportRequestDao viewMyReportRequestDao;
	@Autowired
	IViewMySendRequestDao viewMySendRequestDao;
}
