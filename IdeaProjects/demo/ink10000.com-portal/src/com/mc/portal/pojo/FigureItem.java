package com.mc.portal.pojo;
/**
 * 数据层-视频系列
 * @author 1138789752@qq.com
 * @version 2017-10-30 11:53:14
 * */
public class FigureItem {
	/**
	 * 文件标识
	 * */
	public String id;
	/**
	 * 文件名称
	 * */
	public String name;
	/**
	 * 构造方法
	 * */
	public FigureItem() {}
	/**
	 * 构造方法
	 * @param id 文件标识
	 * @param name 文件名称
	 * */
	public FigureItem(String id, String name) {
		this.id = id;
		this.name = name;
	}
}