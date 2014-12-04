package com.mercury.beans;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class RTSUserInfo {
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
