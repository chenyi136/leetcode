package com.etoak.crawl.page;
import java.util.ArrayList;
import java.util.List;
public class AnalyzePages {
	public Integer keyword;
	public Long scope;
	public String order;
	public List<Integer> media;
	public List<String> trend;
	public AnalyzePages() {
		this.scope = 24L;
		this.order = "CREATED_ASC";
		this.media = new ArrayList<Integer>();
		this.trend = new ArrayList<String>();
		this.trend.add("FUMIAN");
	}
}