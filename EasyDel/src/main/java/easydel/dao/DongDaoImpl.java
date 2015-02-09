package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.AddressDong;

public class DongDaoImpl implements IDongDao {
	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.gonew.mapper.addressDongs";

	@Override
	public List<AddressDong> selectAddressDongsByAddressGuName(String guName) {
		String stmt = namespace + ".selectAddressDongsByAddressGuName";
		List<AddressDong> result = session.selectList(stmt, guName);
		return result;
	}

}
