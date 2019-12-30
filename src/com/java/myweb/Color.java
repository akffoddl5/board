package com.java.myweb;

public class Color {
	
	String myColor = "red";
	String mySubColor1 = "blue";
	String mySubColor2 = "green";
	int colorNum = 3;
	
	String specialColor ;
	
	public String getSpecialColor() {
		return specialColor;
	}
	public void setSpecialColor(String specialColor) {
		this.specialColor = specialColor;
	}
	public String getMyColor() {
		return myColor;
	}
	public void setMyColor(String myColor) {
		this.myColor = myColor;
	}
	public String getMySubColor1() {
		return mySubColor1;
	}
	public void setMySubColor1(String mySubColor1) {
		this.mySubColor1 = mySubColor1;
	}
	public String getMySubColor2() {
		return mySubColor2;
	}
	public void setMySubColor2(String mySubColor2) {
		this.mySubColor2 = mySubColor2;
	}
	public int getColorNum() {
		return colorNum;
	}
	public void setColorNum(int colorNum) {
		this.colorNum = colorNum;
	}
	
	public String printFavoriteColor() {
		System.out.println("my favorite color is red");
		return "red";
	}
	
	public String printSpecialColor() {
		System.out.println("my special color is "+this.specialColor);
		return this.specialColor;
	}
	
	
	

}
