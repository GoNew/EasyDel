package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.RequestCmt;

public class RequestCmtDaoImpl implements IRequestCmtDao {
	@Autowired
	private SqlSession sqlSession;
	
	private String namespace = "easydel.gonew.mapper.requestCmts";
	
	@Override
	public int insertRequestCmt(RequestCmt reqCmt) {
		String stmt = namespace + ".insertRequestCmt";
		int result = sqlSession.insert(stmt, reqCmt);
		return result;
	}
}
