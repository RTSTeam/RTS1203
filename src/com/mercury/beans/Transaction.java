package com.mercury.beans;

public class Transaction {
	private int tranID;
	private String userID;
	private int ticketID;
	private String passengerType;
	private double price;
	private int qyt;
	private String tranType;
	private int reservation;
	public int getTranID() {
		return tranID;
	}
	public void setTranID(int tranID) {
		this.tranID = tranID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getTicketID() {
		return ticketID;
	}
	public void setTicketID(int ticketID) {
		this.ticketID = ticketID;
	}
	public String getPassengerType() {
		return passengerType;
	}
	public void setPassengerType(String passengerType) {
		this.passengerType = passengerType;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQyt() {
		return qyt;
	}
	public void setQyt(int qyt) {
		this.qyt = qyt;
	}
	public String getTranType() {
		return tranType;
	}
	public void setTranType(String tranType) {
		this.tranType = tranType;
	}
	public int getReservation() {
		return reservation;
	}
	public void setReservation(int reservation) {
		this.reservation = reservation;
	}
	
	
}
