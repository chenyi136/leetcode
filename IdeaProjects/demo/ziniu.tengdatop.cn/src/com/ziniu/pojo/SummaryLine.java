package com.ziniu.pojo;
import java.util.Map;
public class SummaryLine {
	public String[] xAxis;
	public Map<String, Item> series;
	public static class Item {
		public String type;
		public String stack;
		public String name;
		public long[] data;
		public Item(String name, int length) {
			this.type = "line";
			this.stack = "总量";
			this.name = name;
			this.data = new long[length];
		}
	}
}