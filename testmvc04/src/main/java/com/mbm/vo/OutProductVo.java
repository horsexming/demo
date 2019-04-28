package com.mbm.vo;

import org.springframework.format.annotation.DateTimeFormat;

public class OutProductVo {
	private String id;
	private String customName;
	private String contractNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private java.util.Date deliveryPeriod;// 交货日期
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private java.util.Date shipTime;// 船期
	private String productNo;
	private String cnumber;
	private String factoryName;
	private String tradeTerms;
	
	public String getTradeTerms() {
		return tradeTerms;
	}
	public void setTradeTerms(String tradeTerms) {
		this.tradeTerms = tradeTerms;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCustomName() {
		return customName;
	}
	public void setCustomName(String customName) {
		this.customName = customName;
	}
	public String getContractNo() {
		return contractNo;
	}
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	public java.util.Date getDeliveryPeriod() {
		return deliveryPeriod;
	}
	public void setDeliveryPeriod(java.util.Date deliveryPeriod) {
		this.deliveryPeriod = deliveryPeriod;
	}
	public java.util.Date getShipTime() {
		return shipTime;
	}
	public void setShipTime(java.util.Date shipTime) {
		this.shipTime = shipTime;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getCnumber() {
		return cnumber;
	}
	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}
	public String getFactoryName() {
		return factoryName;
	}
	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	
}
