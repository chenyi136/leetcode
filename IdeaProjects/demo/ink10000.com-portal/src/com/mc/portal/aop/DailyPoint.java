package com.mc.portal.aop;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import com.mc.portal.crux.Global;
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
@Documented
public @interface DailyPoint {
	public String alias() default "";
	/**
	 * GET请求时，默认无来源，若设置为true则有来源<br>
	 * POST请求时，默认有来源，若设置为true则无来源<br>
	 * 默认值为false
	 * */
	public boolean refer() default false;
	/**
	 * GET请求时，默认可以访问，若设置为true则不能访问<br>
	 * POST请求时，默认不能访问，若设置为true则可以访问<br>
	 * 默认值为false
	 * */
	public boolean forbid() default false;
	/**
	 * 是否记录更新影响条数
	 * */
	public boolean impact() default false;
	/**
	 * 忽略保存请求参数字段
	 * */
	public String[] param() default {};
	public String[] protect() default {};
	public Class<?> service() default Object.class;
	@Retention(RetentionPolicy.RUNTIME)
	@Target({ElementType.PARAMETER})
	public @interface Primary {
		public String field() default Global.JDBC_PRIMARY_FIELD;
	}
}