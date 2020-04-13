package com.example.demo.dto;

import java.util.Date;

public class LoanDto {
	private Integer id;
	private Double loanAmount;
	private Date loanSanctionDate;
	private String loanReason;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Double getLoanAmount() {
		return loanAmount;
	}
	public void setLoanAmount(Double loanAmount) {
		this.loanAmount = loanAmount;
	}
	public Date getLoanSanctionDate() {
		return loanSanctionDate;
	}
	public void setLoanSanctionDate(Date loanSanctionDate) {
		this.loanSanctionDate = loanSanctionDate;
	}
	public String getLoanReason() {
		return loanReason;
	}
	public void setLoanReason(String loanReason) {
		this.loanReason = loanReason;
	}
	
	
	

}
