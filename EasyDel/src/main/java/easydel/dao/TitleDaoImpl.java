package easydel.dao;

import java.util.HashMap;
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
		List<Title> result = session.selectList(stmt);
		return result;
	}
	
	@Override
	public List<Title> selectTitlesOrderByDefault(Integer pageNum,
			Integer requestStatusFilter, Integer requestTypeFilter) {
		String stmt = namespace + ".selectTitlesOrderByDefault";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("pageNum", pageNum);
		params.put("requestStatusFilter", requestStatusFilter);
		params.put("requestTypeFilter", requestTypeFilter);
		
		List<Title> result = session.selectList(stmt, params);
		return result;
	}

}
