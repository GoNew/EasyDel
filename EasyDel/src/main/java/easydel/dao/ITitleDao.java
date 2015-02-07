package easydel.dao;

import java.util.List;

import easydel.entity.Title;

//2015.02.07 17:28 오현성 작성

public interface ITitleDao {
	public List<Title> selectAllTitles();
	public List<Title> selectTitlesOrderedDefaultByPageNum(int pageNum);
}
