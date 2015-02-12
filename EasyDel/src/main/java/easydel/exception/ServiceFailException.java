package easydel.exception;

public class ServiceFailException extends Exception{
	public ServiceFailException(){
		super();
	}
	public ServiceFailException(String errorMsg){
		super(errorMsg);
	}
}
