package easydel.dao;

import easydel.entity.RequestCmt;

public interface IRequestCmtDao {
	public int insertRequestCmt(RequestCmt reqCmt);
	public int updateRequestCmtPicturePathByCmtId(Integer cmtId, String replyPicture);
}
