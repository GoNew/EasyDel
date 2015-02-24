package easydel.dao;


public interface IEdmoneyDao {
	public int getEdmoneyByUserId(String userId);
	public int depositEdmoney(String userId);
	public int withdrawEdmoney(String userId);
	
}
