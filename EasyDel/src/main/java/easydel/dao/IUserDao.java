package easydel.dao;

import easydel.entity.User;

//2015.02.09 13:24 rabbit(깡총깡총) 작성
//2015.02.10 11:20 rabbit(깡총깡총) 작성
//2015.02.12 22:05 gonew 수정

public interface IUserDao {
	public int insertUser(User user);
	public int updateUser(User user);
	public int deleteUserByUserId(String userId);
	public User selectUserByUserId(String userId);
	public int selectUserEDMoney(String userId);
	public int updateUserEDMoney(String userId, Integer usedEDMoney);
	public int updateUserCourierTotalCntAddedVariation(String userId, Integer variation);
	public int updateUserCourierSuccessCntAddedVariation(String userId, Integer variation);
	public int updateUserSenderTotalCntAddedVariation(String userId, Integer variation);
	public int updateUserSenderSuccessCntAddedVariation(String userId, Integer variation);
}
