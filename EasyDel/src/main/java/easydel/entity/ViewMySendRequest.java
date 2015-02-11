package easydel.entity;

public class ViewMySendRequest {
	private Integer requestId;
	private String cargoName;
	private String userId;
	private Integer courierAvgTime;
	private Integer courierAvgKind;
	private Integer courierAvgSafe;
	private Integer courierTotalcnt;
	private Integer courierSuccesscnt;
	private Integer requestStatus;
	private Integer senderEvalstatus;
	public ViewMySendRequest() {
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
	public Integer getCourierAvgTime() {
		return courierAvgTime;
	}
	public void setCourierAvgTime(Integer courierAvgTime) {
		this.courierAvgTime = courierAvgTime;
	}
	public Integer getCourierAvgKind() {
		return courierAvgKind;
	}
	public void setCourierAvgKind(Integer courierAvgKind) {
		this.courierAvgKind = courierAvgKind;
	}
	public Integer getCourierAvgSafe() {
		return courierAvgSafe;
	}
	public void setCourierAvgSafe(Integer courierAvgSafe) {
		this.courierAvgSafe = courierAvgSafe;
	}
	public Integer getCourierTotalcnt() {
		return courierTotalcnt;
	}
	public void setCourierTotalcnt(Integer courierTotalcnt) {
		this.courierTotalcnt = courierTotalcnt;
	}
	public Integer getCourierSuccesscnt() {
		return courierSuccesscnt;
	}
	public void setCourierSuccesscnt(Integer courierSuccesscnt) {
		this.courierSuccesscnt = courierSuccesscnt;
	}
	public Integer getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(Integer requestStatus) {
		this.requestStatus = requestStatus;
	}
	public Integer getSenderEvalstatus() {
		return senderEvalstatus;
	}
	public void setSenderEvalstatus(Integer senderEvalstatus) {
		this.senderEvalstatus = senderEvalstatus;
	}
	@Override
	public String toString() {
		return "ViewMySendRequest [requestId=" + requestId + ", cargoName="
				+ cargoName + ", userId=" + userId + ", courierAvgTime="
				+ courierAvgTime + ", courierAvgKind=" + courierAvgKind
				+ ", courierAvgSafe=" + courierAvgSafe + ", courierTotalcnt="
				+ courierTotalcnt + ", courierSuccesscnt=" + courierSuccesscnt
				+ ", requestStatus=" + requestStatus + ", senderEvalstatus="
				+ senderEvalstatus + "]";
	}
}
