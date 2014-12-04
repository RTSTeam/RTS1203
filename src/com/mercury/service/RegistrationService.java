package com.mercury.service;

import com.mercury.beans.RTSUser;
import com.mercury.beans.RTSUserInfo;
import com.mercury.beans.User;
import com.mercury.dao.RegistrationDao;

public class RegistrationService {
	private RegistrationDao rd;
	
	public RegistrationDao getHd() {
		return rd;
	}
	public void setHd(RegistrationDao rd) {
		this.rd = rd;
	}
	public String sayHello1(User user) {
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<h2><font color=blue>");
		sb.append("Hello " + user.getName() + " with age " + 
				user.getAge() + ", welcome to JavaEE!");
		sb.append("</font></h2>");
		sb.append("</body></html>");
		return sb.toString();
	}
	public String sayHello2(RTSUser rtsuser) {
		return "Hello " + rtsuser.getUserID() + ", welcome to JavaEE!";
	}
	
	public RTSUserInfo process(RTSUser rtsuser) {
		rd.save(rtsuser);
		RTSUserInfo rtsuserInfo = new RTSUserInfo();
		rtsuserInfo.setMsg(this.sayHello2(rtsuser));
		return rtsuserInfo;
	}
}
