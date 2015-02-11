package easydel.dao;

import easydel.entity.Request;

public interface IRequestDao {
	
	public int insertRequest(Request request);
	public int deleteRequest(Request request);
	public int CheckvalidationCode(Request request);

}
