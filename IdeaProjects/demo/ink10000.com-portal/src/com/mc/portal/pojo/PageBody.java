package com.mc.portal.pojo;
import java.util.List;
/**
 * 数据层-分页参数
 * @author 1138789752@qq.com
 * @version 2017-10-30 11:53:14
 * */
public class PageBody {
	private Long total = null;
	private Long size = 0L;
	private Long tabs = null;
	private Long now = 1L;
	private Long show = null;
	private String order = null;
	private Boolean queue = false;
	private String[] link = new String[3];
	private List<PageBodyValue> equal = null;
	private List<PageBodyValue> like = null;
	private List<PageBodyValue> custom = null;
	public Long getTotal() {
		return total;
	}
	public Long getSize() {
		return size;
	}
	public void setSize(Long size) {
		this.size = size;
	}
	public Long getTabs() {
		return tabs;
	}
	public Long getNow() {
		return now;
	}
	public void setNow(Long now) {
		this.now = now;
	}
	public Long getShow() {
		return show;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public Boolean getQueue() {
		return queue;
	}
	public void setQueue(Boolean queue) {
		this.queue = queue;
	}
	public String[] getLink() {
		return link;
	}
	public void setLink(int index, String link) {
		if (index >= 0 && index < this.link.length) {
			this.link[index] = link;
		}
	}
	public List<PageBodyValue> getEqual() {
		return equal;
	}
	public void setEqual(List<PageBodyValue> equal) {
		this.equal = equal;
	}
	public List<PageBodyValue> getLike() {
		return like;
	}
	public void setLike(List<PageBodyValue> like) {
		this.like = like;
	}
	public List<PageBodyValue> getCustom() {
		return custom;
	}
	public void setCustom(List<PageBodyValue> custom) {
		this.custom = custom;
	}
	public void init(long total, long size, long tabs, long now, long show) {
		this.total = total;
		this.size = size;
		this.tabs = tabs;
		this.now = now;
		this.show = show;
		this.order = null;
		this.queue = null;
		this.link = null;
	}
	public static class PageBodyValue {
		public String tag;
		public String value;
		public String name;
	}
}