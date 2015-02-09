package easydel.dao;

import easydel.entity.Request;

public interface IRequestDao {
	
	public Request insertRequest(Request request);
	public Request selectRequest(Request request);
	public Request updateRequest(Request request);
	public Request deleteRequest(Request request);
	public int CheckvalidationCode(Request request);

}
