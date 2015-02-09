package easydel.service;

import java.util.List;

import easydel.entity.AddressDong;

public interface IDongService {
	public List<AddressDong> getDongByGu(String guName);
}
