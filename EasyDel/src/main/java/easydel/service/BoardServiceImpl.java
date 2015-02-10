package easydel.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.ITitleDao;
import easydel.entity.Title;

public class BoardServiceImpl implements IBoardService {
	public BoardServiceImpl() {
		super();
	}
	
	public static final Logger logger = LoggerFactory
			.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private ITitleDao dao;
	
	@Override
	public void boardTest() {
	}

	@Override
	@Transactional
	public List<Title> getBoard(String sortType, String delTypeFilter,
			String statusFilter, Integer pageNum) {
		if((pageNum == null) || (pageNum < 1)) {
			pageNum = new Integer(1);
		}
		
		List<Title> result = null;
		
		Integer delTypeCode = null;
		Integer statusCode = null;
		
		if((delTypeFilter == null) || (delTypeFilter.equals("total")) || (delTypeFilter.equals(""))) {
			delTypeCode = null;
		} else if(delTypeFilter.equals("nomal")) {
			delTypeCode = 0;
		} else if(delTypeFilter.equals("purchase")) {
			delTypeCode = 1;
		} else {
			delTypeCode = null;
		}
		
		if((statusFilter == null) || statusFilter.equals("total") || statusFilter.equals("")) {
			statusCode = null;
		} else if(statusFilter.equals("onDelivery")) {
			statusCode = 1;
		} else {
			statusCode = null;
		}
		
		if((sortType == null) || (sortType.equals("")) || (sortType.equals("default"))) {
			result = dao.selectTitlesOrderByDefault(pageNum, statusCode, delTypeCode);
		} else if(sortType.equals("price")) {
			result = dao.selectTitlesOrderByPrice(pageNum, statusCode, delTypeCode);
		} else if(sortType.equals("senderAvg")) {
			result = dao.selectTitlesOrderBySenderAvg(pageNum, statusCode, delTypeCode);
		} else if(sortType.equals("expireDate")) {
			result = dao.selectTitlesOrderByExpireDate(pageNum, statusCode, delTypeCode, null);
		} else if(sortType.equals("expireDateASC")) {
			result = dao.selectTitlesOrderByExpireDate(pageNum, statusCode, delTypeCode, "ASC");
		} else if(sortType.equals("expireDateDESC")) {
			result = dao.selectTitlesOrderByExpireDate(pageNum, statusCode, delTypeCode, "DESC");
		} else {
			result = dao.selectTitlesOrderByDefault(pageNum, statusCode, delTypeCode);
		}
		
		return result;
	}

}
