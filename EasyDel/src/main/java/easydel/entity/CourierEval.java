package easydel.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 배달부평가 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class CourierEval implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 의뢰건. */
	private Integer requestId;

	/** 회원. */
	private String courierId;

	/** 배달부평가. */
	private String courierCmt;
	
	private Date regDate;
	private Integer courierSafe;
	private Integer courierKind;
	private Integer courierTime;
	
	/**
	 * 생성자.
	 */
	public CourierEval() {
		super();
	}

	public Integer getRequestId() {
		return requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public String getCourierId() {
		return courierId;
	}

	public void setCourierId(String courierId) {
		this.courierId = courierId;
	}

	public String getCourierCmt() {
		return courierCmt;
	}

	public void setCourierCmt(String courierCmt) {
		this.courierCmt = courierCmt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Integer getCourierSafe() {
		return courierSafe;
	}

	public void setCourierSafe(Integer courierSafe) {
		this.courierSafe = courierSafe;
	}

	public Integer getCourierKind() {
		return courierKind;
	}

	public void setCourierKind(Integer courierKind) {
		this.courierKind = courierKind;
	}

	public Integer getCourierTime() {
		return courierTime;
	}

	public void setCourierTime(Integer courierTime) {
		this.courierTime = courierTime;
	}

	@Override
	public String toString() {
		return "CourierEval [requestId=" + requestId + ", courierId="
				+ courierId + ", courierCmt=" + courierCmt + ", regDate="
				+ regDate + ", courierSafe=" + courierSafe + ", courierKind="
				+ courierKind + ", courierTime=" + courierTime + "]";
	}
	
}
