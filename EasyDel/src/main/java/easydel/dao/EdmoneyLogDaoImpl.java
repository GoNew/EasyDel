package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.EdmoneyLog;

public class EdmoneyLogDaoImpl implements IEdmoneyLogDao {
	@Autowired
	private SqlSession sqlSession;
	
	private String namespace = "easydel.gonew.mapper.edmoneyLog";
	
	@Override
	public int insertEdmoneylog(EdmoneyLog log) {
		String stmt = namespace + ".insertEdmoneylog";
		int result = sqlSession.insert(stmt, log);
		return result;
	}

}
