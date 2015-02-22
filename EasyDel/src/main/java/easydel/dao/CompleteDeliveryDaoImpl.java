package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class CompleteDeliveryDaoImpl implements ICompleteDeliveryDao {
	@Autowired
	private SqlSession session;

	private String namespace = "easydel.gonew.mapper.completeDeliverys";
	
	@Override
	public int insertCompleteDelivery(Integer requestId) {
		String stmt = namespace + ".insertCompleteDelivery";
		int result = session.insert(stmt, requestId);
		return result;
	}

}
