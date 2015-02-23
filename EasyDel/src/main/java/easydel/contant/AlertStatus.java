package easydel.contant;

public enum AlertStatus {
//	0 - 시스템 로그
//	1 - 발송인 로그
//	2 - 운송인 로그
	system(1),
	sender(2),
	deliver(3);
	
	private int alertStatusCode;
	private AlertStatus(int alertStatusCode) {
		this.alertStatusCode = alertStatusCode;
	}
	public int getAlertStatusCode() {
		return alertStatusCode;
	}
	public static AlertStatus valueOf(int statusCode) {
		AlertStatus[] all = AlertStatus.values();
		for(AlertStatus state: all) {
			if(state.getAlertStatusCode() == statusCode)
				return state;
		}
		return null;
	}
}
