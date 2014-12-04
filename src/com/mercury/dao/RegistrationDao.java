package com.mercury.dao;

import com.mercury.beans.RTSUser;

public interface RegistrationDao {
	public void save(RTSUser user);
	public RTSUser findByName(String userid);
}
