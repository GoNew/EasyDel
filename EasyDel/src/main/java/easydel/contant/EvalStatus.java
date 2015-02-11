package easydel.contant;

public enum EvalStatus {
//	1 - 평가 안함
//	2 - 평가 했음
	beforeEval(1),
	afterEval(2);
	
	private int statusCode;
	private EvalStatus(int statusCode) {
		this.statusCode = statusCode;
	}
	public int getStatusCode() {
		return statusCode;
	}
}
