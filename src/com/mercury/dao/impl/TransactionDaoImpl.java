package com.mercury.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;

import com.mercury.beans.Transaction;
import com.mercury.dao.TransactionDao;

public class TransactionDaoImpl implements TransactionDao {

	private SimpleJdbcTemplate template;
	
	public void setDataSource(DataSource dataSource) {
		template = new SimpleJdbcTemplate(dataSource);
	}
	
	@Override
	public List<Transaction> queryTransactions(String userid) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM transactions where userid=?";
		Object[] params = {userid};
		
		return template.query(sql, new RowMapper<Transaction>() {
			@Override
			public Transaction mapRow(ResultSet rs, int line) throws SQLException {
				// TODO Auto-generated method stub
				Transaction transaction = new Transaction();
				transaction.setTranID(rs.getInt("tranid"));
				transaction.setUserID(rs.getString("userid"));
				transaction.setTicketID(rs.getInt("ticketid"));
				transaction.setPassengerType(rs.getString("passengertype"));
				transaction.setPrice(rs.getDouble("price"));
				transaction.setQyt(rs.getInt("qty"));
				transaction.setTranType(rs.getString("trantype"));
				transaction.setReservation(rs.getInt("reservationnum"));
				return transaction;
			}			
		}, params);
	}

}
