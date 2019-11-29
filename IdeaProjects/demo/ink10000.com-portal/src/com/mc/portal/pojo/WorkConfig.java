package com.mc.portal.pojo;
import java.util.Map;
import com.mc.core.entity.auto.Driver;
import com.mc.core.entity.auto.Inward;
import com.mc.core.template.TemplateConfig;
/**
 * 数据层-空间配置
 * @author 1138789752@qq.com
 * @version 2017-10-30 11:53:14
 * */
public class WorkConfig {
	/**空间编号*/
	public int id;
	/**空间名称*/
	public String name;
	/**持有者编号*/
	public String account;
	/**持有者名称*/
	public String username;
	/**删除权限*/
	public boolean trash;
	/**更新权限*/
	public boolean modify;
	/**默认驱动*/
	public Driver driver;
	/**模板配置*/
	public TemplateConfig template;
	/**字段取值*/
	public Map<Integer, Inward> inward;
}