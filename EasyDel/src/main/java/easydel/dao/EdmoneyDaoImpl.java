package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.User;

public class EdmoneyDaoImpl implements IEdmoneyDao {
	
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(EdmoneyDaoImpl.class);
	}
	
	@Autowired
	private SqlSession session;


	@Override
	public int getEdmoneyByUserId(User user) {
		return 0;
	}

	@Override
	public int depositEdmoney(User user) {
		return 0;
	}

	@Override
	public int withdrawEdmoney(User user) {
		return 0;
	}

}
