package easydel.dao;

import java.util.List;

import easydel.entity.Title;

//2015.02.07 17:28 오현성 작성

public interface ITitleDao {
	public List<Title> selectAllTitles();
	public List<Title> selectTitlesOrderByDefault(Integer pageNum, Integer requestStatusFilter, Integer requestTypeFilter);
	public List<Title> selectTitlesOrderByPrice(Integer pageNum, Integer requestStatusFilter, Integer requestTypeFilter);
	public List<Title> selectTitlesOrderBySenderAvg(Integer pageNum, Integer requestStatusFilter, Integer requestTypeFilter);
	public List<Title> selectTitlesOrderByExpireDate(Integer pageNum, Integer requestStatusFilter, Integer requestTypeFilter, String sort);
}
