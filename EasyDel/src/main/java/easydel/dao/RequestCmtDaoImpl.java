package easydel.dao;

import java.util.HashMap;

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

	@Override
	public int updateRequestCmtPicturePathByCmtId(Integer cmtId,
			String replyPicture) {
		String stmt = namespace + ".updateRequestCmtPicturePathByCmtId";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("cmtId", cmtId);
		params.put("replyPicture", replyPicture);
		int result = sqlSession.update(stmt, params);
		return result;
	}
}
