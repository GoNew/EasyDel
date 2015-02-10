package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.AddressGu;

public class GuDaoImpl implements IGuDao {
	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.gonew.mapper.addressGus";

	@Override
	public List<AddressGu> selectAllAddressGus() {
		String stmt = namespace + ".selectAllAddressGus";
		List<AddressGu> result = session.selectList(stmt);
		return result;
	}

}
