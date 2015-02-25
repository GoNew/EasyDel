package easydel.service;

import java.util.Date;
import java.util.List;

import easydel.entity.Title;

public interface IBoardService {
	public void boardTest();
	
	public List<Title> getBoard(String sortType, String delTypeFilter,
			String statusFilter, Integer pageNum, String userId,
			Integer startPos, Integer arrivalPos, Date startTime,
			Date arrivalTime);
}
