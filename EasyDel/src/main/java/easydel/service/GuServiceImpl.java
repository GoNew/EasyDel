package easydel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.IGuDao;
import easydel.entity.AddressGu;

public class GuServiceImpl implements IGuService {

	@Autowired
	IGuDao dao;
	
	@Override
	@Transactional
	public List<AddressGu> getGu() {
		return dao.selectAllAddressGus();
	}

}
