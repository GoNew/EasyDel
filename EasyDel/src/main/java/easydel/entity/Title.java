package easydel.entity;

import java.util.Date;

public class Title {
	private Integer requestId;
	private Integer requestType;
	private Integer requestStatus;
	private String cargoName;
	private String senderId;
	private Integer senderAvg;
	private Integer pickupPlace;
	private String pickUpGu;
	private String pickUpDong;
	private Integer pickUpAddrX;
	private Integer pickUpAddrY;
	private Date pickupMinTime;
	private Date pickupMaxTime;
	private Integer arrivalPlace;
	private String arrivalPlaceGu;
	private String arrivalPlaceDong;
	private Integer arrivalPlaceAddrX;
	private Integer arrivalPlaceAddrY;
	private Date arrivalMinTime;
	private Date arrivalMaxTime;
	private Integer deliveryPrice;
	private Date expireDate;
	public Title() {
		super();
	}
	
	public Integer getPickupPlace() {
		return pickupPlace;
	}

	public void setPickupPlace(Integer pickupPlace) {
		this.pickupPlace = pickupPlace;
	}

	public Integer getArrivalPlace() {
		return arrivalPlace;
	}

	public void setArrivalPlace(Integer arrivalPlace) {
		this.arrivalPlace = arrivalPlace;
	}

	public Integer getRequestId() {
		return requestId;
	}
	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}
	public Integer getRequestType() {
		return requestType;
	}
	public void setRequestType(Integer requestType) {
		this.requestType = requestType;
	}
	public String getCargoName() {
		return cargoName;
	}
	public void setCargoName(String cargoName) {
		this.cargoName = cargoName;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public Integer getSenderAvg() {
		return senderAvg;
	}
	public void setSenderAvg(Integer senderAvg) {
		this.senderAvg = senderAvg;
	}
	public String getPickUpGu() {
		return pickUpGu;
	}
	public void setPickUpGu(String pickUpGu) {
		this.pickUpGu = pickUpGu;
	}
	public String getPickUpDong() {
		return pickUpDong;
	}
	public void setPickUpDong(String pickUpDong) {
		this.pickUpDong = pickUpDong;
	}
	public Integer getPickUpAddrX() {
		return pickUpAddrX;
	}
	public void setPickUpAddrX(Integer pickUpAddrX) {
		this.pickUpAddrX = pickUpAddrX;
	}
	public Integer getPickUpAddrY() {
		return pickUpAddrY;
	}
	public void setPickUpAddrY(Integer pickUpAddrY) {
		this.pickUpAddrY = pickUpAddrY;
	}
	public String getArrivalPlaceGu() {
		return arrivalPlaceGu;
	}
	public void setArrivalPlaceGu(String arrivalPlaceGu) {
		this.arrivalPlaceGu = arrivalPlaceGu;
	}
	public String getArrivalPlaceDong() {
		return arrivalPlaceDong;
	}
	public void setArrivalPlaceDong(String arrivalPlaceDong) {
		this.arrivalPlaceDong = arrivalPlaceDong;
	}
	public Integer getArrivalPlaceAddrX() {
		return arrivalPlaceAddrX;
	}
	public void setArrivalPlaceAddrX(Integer arrivalPlaceAddrX) {
		this.arrivalPlaceAddrX = arrivalPlaceAddrX;
	}
	public Integer getArrivalPlaceAddrY() {
		return arrivalPlaceAddrY;
	}
	public void setArrivalPlaceAddrY(Integer arrivalPlaceAddrY) {
		this.arrivalPlaceAddrY = arrivalPlaceAddrY;
	}
	public Integer getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(Integer deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public Date getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Date exprieDate) {
		this.expireDate = exprieDate;
	}
	public Integer getRequestStatus() {
		return requestStatus;
	}
	public void setRequestStatus(Integer requestStatus) {
		this.requestStatus = requestStatus;
	}
	public Date getPickupMinTime() {
		return pickupMinTime;
	}
	public void setPickupMinTime(Date pickupMinTime) {
		this.pickupMinTime = pickupMinTime;
	}
	public Date getPickupMaxTime() {
		return pickupMaxTime;
	}
	public void setPickupMaxTime(Date pickupMaxTime) {
		this.pickupMaxTime = pickupMaxTime;
	}
	public Date getArrivalMinTime() {
		return arrivalMinTime;
	}
	public void setArrivalMinTime(Date arrivalMinTime) {
		this.arrivalMinTime = arrivalMinTime;
	}
	public Date getArrivalMaxTime() {
		return arrivalMaxTime;
	}
	public void setArrivalMaxTime(Date arrivalMaxTime) {
		this.arrivalMaxTime = arrivalMaxTime;
	}
	@Override
	public String toString() {
		return "Title [requestId=" + requestId + ", requestType=" + requestType
				+ ", requestStatus=" + requestStatus + ", cargoName="
				+ cargoName + ", senderId=" + senderId + ", senderAvg="
				+ senderAvg + ", pickupPlace=" + pickupPlace + ", pickUpGu="
				+ pickUpGu + ", pickUpDong=" + pickUpDong + ", pickUpAddrX="
				+ pickUpAddrX + ", pickUpAddrY=" + pickUpAddrY
				+ ", pickupMinTime=" + pickupMinTime + ", pickupMaxTime="
				+ pickupMaxTime + ", arrivalPlace=" + arrivalPlace
				+ ", arrivalPlaceGu=" + arrivalPlaceGu + ", arrivalPlaceDong="
				+ arrivalPlaceDong + ", arrivalPlaceAddrX=" + arrivalPlaceAddrX
				+ ", arrivalPlaceAddrY=" + arrivalPlaceAddrY
				+ ", arrivalMinTime=" + arrivalMinTime + ", arrivalMaxTime="
				+ arrivalMaxTime + ", deliveryPrice=" + deliveryPrice
				+ ", expireDate=" + expireDate + "]";
	}
	
}
