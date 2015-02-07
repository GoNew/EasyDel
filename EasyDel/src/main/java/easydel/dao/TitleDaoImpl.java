package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.Title;

public class TitleDaoImpl implements ITitleDao {
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.gonew.mapper.titles";
	
	public TitleDaoImpl() {
		super();
	}

	@Override
	public List<Title> selectAllTitles() {
		String stmt = namespace + "selectAllTitles";
		List<Title> result = session.selectList(stmt);
		return result;
	}

	@Override
	public List<Title> selectTitlesOrderedDefaultByPageNum(int pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
