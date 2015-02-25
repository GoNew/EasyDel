package easydel.dao;

import java.util.Date;
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
			Integer requestStatusFilter, Integer requestTypeFilter, String userId) {
		String stmt = namespace + ".selectTitlesOrderByDefault";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("pageNum", pageNum);
		params.put("requestStatusFilter", requestStatusFilter);
		params.put("requestTypeFilter", requestTypeFilter);
		params.put("userId", userId);
		
		List<Title> result = session.selectList(stmt, params);
		return result;
	}

	@Override
	public List<Title> selectTitlesOrderByPrice(Integer pageNum,
			Integer requestStatusFilter, Integer requestTypeFilter, String userId) {
		String stmt = namespace + ".selectTitlesOrderByPrice";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("pageNum", pageNum);
		params.put("requestStatusFilter", requestStatusFilter);
		params.put("requestTypeFilter", requestTypeFilter);
		params.put("userId", userId);
		
		List<Title> result = session.selectList(stmt, params);
		return result;
	}
	
	@Override
	public List<Title> selectTitlesOrderBySenderAvg(Integer pageNum,
			Integer requestStatusFilter, Integer requestTypeFilter, String userId) {
		String stmt = namespace + ".selectTitlesOrderBySenderAvg";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("pageNum", pageNum);
		params.put("requestStatusFilter", requestStatusFilter);
		params.put("requestTypeFilter", requestTypeFilter);
		params.put("userId", userId);
		
		List<Title> result = session.selectList(stmt, params);
		return result;
	}

	@Override
	public List<Title> selectTitlesOrderByExpireDate(Integer pageNum,
			Integer requestStatusFilter, Integer requestTypeFilter, String sort, String userId) {
		String stmt = namespace + ".selectTitlesOrderByExpireDate";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("pageNum", pageNum);
		params.put("requestStatusFilter", requestStatusFilter);
		params.put("requestTypeFilter", requestTypeFilter);
		params.put("sort", sort);
		params.put("userId", userId);
		
		List<Title> result = session.selectList(stmt, params);
		return result;
	}

	@Override
	public List<Title> selectTitlesUsingRecommend(Integer pageNum,
			Integer requestStatusFilter, Integer requestTypeFilter,
			Integer startPos, Integer arrivalPos, Date startTime,
			Date arrivalTime, String userId) {
		String stmt = namespace + ".selectTitlesUsingRecommend";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("pageNum", pageNum);
		params.put("requestStatusFilter", requestStatusFilter);
		params.put("requestTypeFilter", requestTypeFilter);
		params.put("userId", userId);
		params.put("startPos", startPos);
		params.put("arrivalPos", arrivalPos);
		params.put("startTime", startTime);
		params.put("arrivalTime", arrivalTime);
		
		List<Title> result = session.selectList(stmt, params);
		return result;
	}
}
