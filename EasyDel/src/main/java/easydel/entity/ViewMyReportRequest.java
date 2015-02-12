package easydel.entity;

import java.sql.Date;

public class ViewMyReportRequest {
	private Integer requestId;
	private String cargoName;
	private String reportedUserId;
	private String reportUserId;
	private String reportTypeDesc;
	private Date reportDate;
	private Integer reportStatus;
	public ViewMyReportRequest() {
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
	public String getReportedUserId() {
		return reportedUserId;
	}
	public void setReportedUserId(String reportedUserId) {
		this.reportedUserId = reportedUserId;
	}
	public String getReportUserId() {
		return reportUserId;
	}
	public void setReportUserId(String reportUserId) {
		this.reportUserId = reportUserId;
	}
	public String getReportTypeDesc() {
		return reportTypeDesc;
	}
	public void setReportTypeDesc(String reportTypeDesc) {
		this.reportTypeDesc = reportTypeDesc;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public Integer getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(Integer reportStatus) {
		this.reportStatus = reportStatus;
	}
	@Override
	public String toString() {
		return "ViewMyReportRequest [requestId=" + requestId + ", cargoName="
				+ cargoName + ", reportedUserId=" + reportedUserId
				+ ", reportUserId=" + reportUserId + ", reportTypeDesc="
				+ reportTypeDesc + ", reportDate=" + reportDate
				+ ", reportStatus=" + reportStatus + "]";
	}
}
