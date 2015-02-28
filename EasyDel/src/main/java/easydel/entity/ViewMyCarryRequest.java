package easydel.entity;

import java.util.Date;

public class ViewMyCarryRequest {
	private Integer requestId;
	private String cargoName;
	private String userId;
	private Integer senderAvgTime;
	private Integer senderAvgKind;
	private Integer senderAvgThing;
	private Integer senderTotalcnt;
	private Integer senderSuccesscnt;
	private Integer requestStatus;
	private Integer courierEvalstatus;
	private Date expireDate;
	public Date getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}
	public ViewMyCarryRequest() {
		super();
	}
	public Integer getRequestId() {
		return requestId;
	}
	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}
	public String getCargoName() {
		return cargoName;
	}
	public void setCargoName(String cargoName) {
		this.cargoName = cargoName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getSenderAvgTime() {
		return senderAvgTime;
	}
	public void setSenderAvgTime(Integer senderAvgTime) {
		this.senderAvgTime = senderAvgTime;
	}
	public Integer getSenderAvgKind() {
		return senderAvgKind;
	}
	public void setSenderAvgKind(Integer senderAvgKind) {
		this.senderAvgKind = senderAvgKind;
	}
	public Integer getSenderAvgThing() {
		return senderAvgThing;
	}
	public void setSenderAvgThing(Integer senderAvgThing) {
		this.senderAvgThing = senderAvgThing;
	}
	public Integer getSenderTotalcnt() {
		return senderTotalcnt;
	}
	public void setSenderTotalcnt(Integer senderTotalcnt) {
		this.senderTotalcnt = senderTotalcnt;
	}
	public Integer getSenderSuccesscnt() {
		return senderSuccesscnt;
	}
	public void setSenderSuccesscnt(Integer senderSuccesscnt) {
		this.senderSuccesscnt = senderSuccesscnt;
	}
	public Integer getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(Integer requestStatus) {
		this.requestStatus = requestStatus;
	}
	public Integer getCourierEvalstatus() {
		return courierEvalstatus;
	}
	public void setCourierEvalstatus(Integer courierEvalstatus) {
		this.courierEvalstatus = courierEvalstatus;
	}
	@Override
	public String toString() {
		return "ViewMyCarryRequest [requestId=" + requestId + ", cargoName="
				+ cargoName + ", userId=" + userId + ", senderAvgTime="
				+ senderAvgTime + ", senderAvgKind=" + senderAvgKind
				+ ", senderAvgThing=" + senderAvgThing + ", senderTotalcnt="
				+ senderTotalcnt + ", senderSuccesscnt=" + senderSuccesscnt
				+ ", requestStatus=" + requestStatus + ", courierEvalstatus="
				+ courierEvalstatus + ", expireDate=" + expireDate + "]";
	}

}
