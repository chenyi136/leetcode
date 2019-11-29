package com.mc.portal.pojo;
import java.net.URL;
import java.net.URLClassLoader;
/**
 * 数据层-模板助手
 * @author 1138789752@qq.com
 * @version 2017-10-30 11:53:14
 * */
public class TemplateHelper extends URLClassLoader {
	public TemplateHelper(URL[] urls) {
		super(urls, ClassLoader.getSystemClassLoader());
	}
	public TemplateHelper(URL[] urls, ClassLoader loader) {
		super(urls, loader);
	}
	public Class<?> load(String name, byte[] code) throws Exception {
		return super.defineClass(name, code, 0, code.length);
	}
}