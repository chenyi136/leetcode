package com.mc.portal.crux;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auth.Account;
import com.mc.core.entity.auth.Group;
import com.mc.core.entity.auth.Power;
import com.mc.core.service.auth.AccountService;
import com.mc.core.template.DaoImplTemplate;
import com.mc.core.template.DaoMapperTemplate;
import com.mc.core.template.DaoTemplate;
import com.mc.core.template.EntityTemplate;
import com.mc.core.template.ServiceImplTemplate;
import com.mc.core.template.ServiceTemplate;
import com.mc.portal.pojo.OnlineInfo;
public class Global extends com.mc.core.crux.Global {
	/**
	 * 权限体系用户群组
	 * */
	public static final Map<Integer, Group> GROUP = new LinkedHashMap<Integer, Group>();
	/**
	 * 项目构建全部依赖
	 * */
	public static final Map<String, LibraryItem> LIBRARY = new LinkedHashMap<String, LibraryItem>();
	/**
	 * 权限体系权限列表
	 * */
	public static final Map<String, Power> POWER = new LinkedHashMap<String, Power>();
	/**
	 * 文件最大的字节数
	 * */
	public static final Long FILE_MAX_SIZE = 16 * 1024 * 1024L;
	/**
	 * 静态页面刷新参数
	 * */
	public static final String KEY_JUMP_CACHE = "KEY_JUMP_CACHE";
	/**
	 * 访问跳转消息参数
	 * */
	public static final String KEY_JUMP_MESSAGE = "KEY_JUMP_MESSAGE";
	/**
	 * 访问跳转分页参数
	 * */
	public static final String KEY_JUMP_PAGING = "KEY_JUMP_PAGING";
	/**
	 * 当前页面访问权限
	 * */
	public static final String KEY_JUMP_POWER = "KEY_JUMP_POWER";
	/**
	 * 访问跳转目标参数
	 * */
	public static final String KEY_JUMP_TARGET = "KEY_JUMP_TARGET";
	/**
	 * 访问跳转签名参数
	 * */
	public static final String KEY_JUMP_TOKEN = "KEY_JUMP_TOKEN";
	/**
	 * 用户最后访问路径
	 * */
	public static final String KEY_LOCAL_ADDRESS = "KEY_LOCAL_ADDRESS";
	/**
	 * 本地存储用户标识
	 * */
	public static final String KEY_LOCAL_ONLINE = "KEY_LOCAL_ONLINE";
	/**
	 * 验证信息存储标识
	 * */
	public static final String KEY_SESSION_CAPTCHA = "KEY_SESSION_CAPTCHA";
	/**
	 * 当前工作空间配置
	 * */
	public static final String KEY_SESSION_CONFIG = "KEY_SESSION_CONFIG";
	/**
	 * 在线用户会话信息
	 * */
	public static final String KEY_SESSION_ONLINE = "KEY_SESSION_ONLINE";
	/**
	 * 我的工作空间集合
	 * */
	public static final String KEY_SESSION_WORKS = "KEY_SESSION_WORKS";
	/**
	 * 数据存储主键字段
	 * */
	public static final String JDBC_PRIMARY_FIELD = "id";
	/**
	 * 邮箱正则验证表达
	 * */
	public static final String PATTERN_VERIFY_EMAIL = "^([a-z0-9A-Z_]+[-|//.]*)*[a-z0-9A-Z_|-]*@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?//.)+[a-zA-Z]{2,}$";
	/**
	 * 超级管理账号编号
	 * */
	public static final String SUPER_MANAGER_ACCOUNT = "3c7c8e1ab0f84908a1f55ed50a614231";
	/**
	 * 视图页面路径前缀
	 * */
	public static final String VIEW_PATH_PREFIX = "jsp/";
	/**
	 * 项目代码导出级别
	 * */
	public static final Map<String, String> AUTO_PROJECT_LEVEL = new LinkedHashMap<String, String>() {
		public static final long serialVersionUID = 1L;
		{
			super.put(EntityTemplate.class.getName(), "模型层实体类");
			super.put(DaoTemplate.class.getName(), "持久层接口类");
			super.put(DaoImplTemplate.class.getName(), "持久层实现类");
			super.put(DaoMapperTemplate.class.getName(), "持久映射文件");
			super.put(ServiceTemplate.class.getName(), "业务层接口类");
			super.put(ServiceImplTemplate.class.getName(), "业务层实现类");
		}
	};
	/**
	 * 项目构建默认依赖
	 * */
	public static final Map<String, String> AUTO_LIBRARY_TACIT = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			super.put("4177054e180d09e3998808efa0401c7", "aopalliance-1.0.0.jar");
			super.put("1ad1e8959324b0f680b8e62406955642", "asm-3.3.1.jar");
			super.put("b79f1927b4d55baea80ccacbefbc7f96", "aspectjweaver-1.6.12.jar");
			super.put("c4173b2a9ae53833045560fcc5f374b9", "c3p0-0.9.5.jar");
			super.put("b3f681be48fce094cf01a045f5bdca6f", "cglib-2.2.2.jar");
			super.put("75615356605c8128013da9e3ac62a249", "commons-codec-1.9.0.jar");
			super.put("40b4b4d8eac886f6b4a2a3bd2f31b00", "commons-logging-1.2.0.jar");
			super.put("dd77e787b7b5dc56f6a1cb658716d55d", "commons-fileupload-1.3.3.jar");
			super.put("affa7b33f76464c0f79d4d1225b705a5", "commons-io-2.5.0.jar");
			super.put("62727a85e2e1bf6a756f5571d19cc71c", "commons-pool2-2.4.2.jar");
			super.put("837309a10727ca78f1ce63adb3a29b08", "jackson-annotations-2.8.5.jar");
			super.put("a5512a5a5b4c61283138da691411a13d", "jackson-core-2.8.5.jar");
			super.put("723cb81b0d09f982efb8959caeea26a9", "jackson-databind-2.8.5.jar");
			super.put("f45c4f59399ca84f65ec4ff25072b63d", "javax.servlet.jsp.jstl-1.2.1.jar");
			super.put("e81f03bad3a397e1a07561e4b00be00b", "javax.servlet.jsp.jstl-api-1.2.1.jar");
			super.put("fb87bd84e336ca3dc6b6c108f51bf25e", "log4j-1.2.17.jar");
			super.put("28a61e7d649173f24ac8e5bd5bc3104b", "mchange-commons-java-0.2.11.jar");
			super.put("10e2f3b21bd9af58468cb43ed25a78f5", "mybatis-3.2.3.jar");
			super.put("de409c23fab2613cfd3f3a13774eeaca", "mybatis-spring-1.2.3.jar");
			super.put("7cb3763bacff464562c0e6485644e694", "mysql-connector-java-5.1.44.jar");
			super.put("e6bdca783400be844140f847feac483b", "spring-aop-4.3.10.jar");
			super.put("6126d02a081180a2b07f5a939af9b10f", "spring-aspects-4.3.10.jar");
			super.put("74741f42604171f363a8e935bc795fd", "spring-beans-4.3.10.jar");
			super.put("1438f1671496db1500a18b5cb1875ece", "spring-context-4.3.10.jar");
			super.put("f96d56324d1c9634bdac565c21e82e8", "spring-context-support-4.3.10.jar");
			super.put("319b0c64f774e5387f298e5b930bb39d", "spring-core-4.3.10.jar");
			super.put("6f96c7c0fde9eed34a64accb0c117f4b", "spring-expression-4.3.10.jar");
			super.put("b53d9e6c1cec08c1241ca3aa0c26c23b", "spring-jdbc-4.3.10.jar");
			super.put("7b8dcc6fdd14051414e0d799dac56a17", "spring-orm-4.3.10.jar");
			super.put("a4cf77f4a3cdbc03f571d69680bb9906", "spring-tx-4.3.10.jar");
			super.put("ad0fd8c1498b109efeb7c655e3c0b0f5", "spring-web-4.3.10.jar");
			super.put("389fb29b4f301a8b466d870d1589d7ae", "spring-webmvc-4.3.10.jar");
		}
	};
	/**
	 * 存储硬盘盘符映射
	 * */
	public static final Map<String, String> BLOG_DISK_TRAY = new LinkedHashMap<String, String>() {
		public static final long serialVersionUID = 1L;
		{
			super.put("A:", null);//虚拟硬盘
			super.put("D:", "D:");//电脑硬盘
			super.put("F:", "F:");//西部硬盘
			super.put("G:", "G:");//希捷硬盘
		}
	};
	/**
	 * 双色球的中奖金额 
	 * */
	public static final Map<String, Integer> BLOG_LOTTERY_DLT = new LinkedHashMap<String, Integer>() {
		public static final long serialVersionUID = 1L;
		{
			super.put("5+2", 10000000);
			super.put("5+1", 2000000);
			super.put("4+2", 200000);
			super.put("5+0", 200000);
			super.put("4+1", 200);
			super.put("3+2", 200);
			super.put("4+0", 10);
			super.put("3+1", 10);
			super.put("2+2", 10);
			super.put("3+0", 5);
			super.put("2+1", 5);
			super.put("1+2", 5);
			super.put("0+2", 5);
		}
	};
	/**
	 * 双色球的中奖金额 
	 * */
	public static final Map<String, Integer> BLOG_LOTTERY_SSQ = new LinkedHashMap<String, Integer>() {
		public static final long serialVersionUID = 1L;
		{
			super.put("6+1", 5000000);
			super.put("6+0", 200000);
			super.put("5+1", 3000);
			super.put("5+0", 200);
			super.put("4+1", 200);
			super.put("4+0", 10);
			super.put("3+1", 10);
			super.put("2+1", 5);
			super.put("1+1", 5);
			super.put("0+1", 5);
		}
	};
	/**
	 * 文件数据缓存目录
	 * */
	public static String CACHE = "/";
	/**
	 * 云享部落的根路径
	 * */
	public static String CLOUD = "http://www.ink10000.com/";
	/**
	 * 项目运行的上下文
	 * */
	public static String CONTEXT = "/";
	/**
	 * 代码生成重建目录
	 * */
	public static String OUTPUT = "D:/work/myeclipse-2014/ink10000.com/src/";
	/**
	 * 当前项目开发目录
	 * */
	public static String PROJECT = "/";
	/**
	 * 本地存储最大时长
	 * */
	@Syllable(title = "本地存储最大时长")
	public static Integer LOCAL_MAX_TIME = 7 * 24 * 3600;
	/**
	 * 登录验证码的文字
	 * */
	@Syllable(title = "登录验证码的文字")
	public static String ONLINE_CAPTCHA_WORD = "1";
	/**
	 * 页面链接跳转
	 * @param request 请求对象
	 * @param target 前往页面
	 * @param message 处理消息
	 * */
	protected final ModelAndView jump(HttpServletRequest request, String target, String message) {
		ModelAndView res = new ModelAndView("jump");
		res.addObject(KEY_JUMP_TARGET, target);
		res.addObject(KEY_JUMP_PAGING, request.getParameter(KEY_JUMP_PAGING));
		res.addObject(KEY_JUMP_MESSAGE, message);
		return res;
	}
	/**
	 * 输出网页内容
	 * @param response 请求对象
	 * @param data 网页内容
	 * @param e 异常信息
	 * */
	protected final void out(HttpServletResponse response, String data, Exception e) {
		try {
			response.reset();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			if (data != null) {
				response.getWriter().write(data);
			} else {
				e.printStackTrace(response.getWriter());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	/**
	 * 文件访问链接
	 * @param id 文件标识
	 * @param tacit 有默认吗
	 * */
	public static final String file(String id, boolean... tacit) {
		if (id == null || id.length() < 3) {
			return tacit != null && tacit.length > 0 && tacit[0]? ROOT + "_/my/i/face.jpg" : "javascript:;";
		}
		return ROOT + "data/" + id.substring(0, 2) + "/" + id;
	}
	/**
	 * 获取用户信息
	 * @param accountService 业务接口
	 * @param id 用户编号
	 * */
	public static final OnlineInfo online(AccountService accountService, String id) {
		OnlineInfo res = new OnlineInfo();
		res.name = "-";
		Account en = accountService.load(id);
		if (en != null) {
			res.id = id;
			res.face = file(en.getFace(), true);
			res.name = !en.doIsEmpty(en.getName()) ? en.getName() : en.getUsername();
		}
		return res;
	}
	/**
	 * 类库依赖对象
	 * */
	public static final class LibraryItem {
		public String ID;
		public String PATH;
		public String NAME;
		public String KIND;
		public String SOURCE;
		public LibraryItem() {}
		public LibraryItem(String ID) {
			this.ID = ID;
		}
	}
	/**
	 * 权限封装对象
	 * */
	public static final class PowerItem {
		public String id;
		public String name;
		public String icon;
		public String url;
		public List<PowerItem> next;
	}
}