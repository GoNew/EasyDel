package easydel.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.dao.ITitleDao;

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
		logger.trace(dao.selectTitlesOrderByDefault(null, null, null)+ "");
	}

}
