package com.ziniu.pojo;
public class AnalyzePage {
	public Integer[] keyword;
	public String[] trend;
	public Integer[] media;
	public Integer created;
	public String queue;
	public Integer place;
	public AnalyzePage init() {
		this.created = 24;
		this.trend = new String[] { "ZHENGMIAN", "ZHONGLI", "FUMIAN", "WUXIAO" };
		this.queue = "SCREEN_DESC";
		this.place = 1;
		return this;
	}
}