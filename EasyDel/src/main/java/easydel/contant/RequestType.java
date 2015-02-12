package easydel.contant;

public enum RequestType {
//	0 - 일반 운송
//	1 - 구매 후 운송
	nomal(0),
	puchase(1);
	
	private int typeCode;
	private RequestType(int typeCode) {
		this.typeCode = typeCode;
	}
	public int getTypeCode() {
		return typeCode;
	}
}
