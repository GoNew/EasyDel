package easydel.contant;

public enum RequestStatus {
//	1 - 의뢰글
//	2 - 의뢰대기중
//	3 - 의뢰진행
//	4 - 운송완료
//	5 - 거래완료
//	6 - 발송인이 취소요청
//	7 - 운송인이 취소요청
	request(1),
	wait(2),
	on(3),
	arrive(4),
	quit(5),
	cancelBySender(6),
	cancelByDeliver(7);
	
	private int statusCode;
	private RequestStatus(int statusCode) {
		this.statusCode = statusCode;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public static RequestStatus valueOf(int statusCode) {
		RequestStatus[] all = RequestStatus.values();
		for(RequestStatus state: all) {
			if(state.getStatusCode() == statusCode)
				return state;
		}
		return null;
	}
}
