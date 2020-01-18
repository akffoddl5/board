package com.java.beans;

import java.sql.Timestamp;

public class BoardDTO {
	
	private int bNum;
	private String bWriter;
	private String bSubject;
	private int bReadCount;
	private int bRef;
	private int bStep;
	private int bDepth;
	private Timestamp bRegDate;
	private String bContent;
	private String bIp;
	private int rNum;
	
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbSubject() {
		return bSubject;
	}
	public void setbSubject(String bSubject) {
		this.bSubject = bSubject;
	}
	public int getbReadCount() {
		return bReadCount;
	}
	public void setbReadCount(int bReadCount) {
		this.bReadCount = bReadCount;
	}
	public int getbRef() {
		return bRef;
	}
	public void setbRef(int bRef) {
		this.bRef = bRef;
	}
	public int getbStep() {
		return bStep;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbDepth() {
		return bDepth;
	}
	public void setbDepth(int bDepth) {
		this.bDepth = bDepth;
	}
	public Timestamp getbRegDate() {
		return bRegDate;
	}
	public void setbRegDate(Timestamp bRegDate) {
		this.bRegDate = bRegDate;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbIp() {
		return bIp;
	}
	public void setbIp(String bIp) {
		this.bIp = bIp;
	}
	
	

}
