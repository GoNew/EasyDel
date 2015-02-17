package easydel.contant;

public enum ReportStatus {
//	1-신고 처리중
//	2-처리 완료
	reportOnProcess(1),
	reportAfterTraitement(2);
	
	private int statusCode;
	private ReportStatus(int statusCode) {
		this.statusCode = statusCode;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public static ReportStatus valueOf(int statusCode) {
		ReportStatus[] all = ReportStatus.values();
		for(ReportStatus state: all) {
			if(state.getStatusCode() == statusCode)
				return state;
		}
		return null;
	}
}
