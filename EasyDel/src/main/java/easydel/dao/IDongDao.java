package easydel.dao;

import java.util.List;

import easydel.entity.AddressDong;

public interface IDongDao {
	public List<AddressDong> selectAddressDongsByAddressGuName(String guName);
}
