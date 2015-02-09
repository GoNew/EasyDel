package easydel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.IDongDao;
import easydel.entity.AddressDong;

public class DongServiceImpl implements IDongService {

	@Autowired
	IDongDao dao;
	
	@Override
	@Transactional
	public List<AddressDong> getDongByGu(String guName) {
		return dao.selectAddressDongsByAddressGuName(guName);
	}

}
