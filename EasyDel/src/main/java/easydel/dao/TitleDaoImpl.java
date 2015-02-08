package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.Title;

public class TitleDaoImpl implements ITitleDao {
	public static final Logger logger = LoggerFactory
			.getLogger(TitleDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.gonew.mapper.titles";
	
	public TitleDaoImpl() {
		super();
	}

	@Override
	public List<Title> selectAllTitles() {
		String stmt = namespace + ".selectAllTitles";
		logger.trace("1. ==========================================================");
		List<Title> result = session.selectList(stmt);
		logger.trace("2. ==========================================================");
		return result;
	}

	@Override
	public List<Title> selectTitlesOrderedDefaultByPageNum(int pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
