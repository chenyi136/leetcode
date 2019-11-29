package com.mc.portal.aop;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.mc.core.entity.SuperEntity;
import com.mc.core.entity.auth.Account;
import com.mc.core.entity.site.Daily;
import com.mc.core.service.SuperService;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.site.DailyService;
import com.mc.core.tool.JsonTool;
import com.mc.portal.StartListener;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
@Aspect
@Component("com.mc.portal.aop.DailyPointAop")
public class DailyPointAop implements ApplicationContextAware {
	private static final ConcurrentLinkedQueue<Daily> QUEUE = new ConcurrentLinkedQueue<Daily>();
	private ThreadLocal<Daily> task = new ThreadLocal<Daily>();
	private ApplicationContext context;
	private AccountService accountService;
	private DailyService dailyService;
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
		this.dailyService = context.getBean(DailyService.class);
		this.accountService = context.getBean(AccountService.class);
	}
	@Scheduled(initialDelay = 120 * 1000L, fixedDelay = 120 * 1000L)
	public void task() {
		try {
			List<Daily> datas = new ArrayList<Daily>();
			while (!QUEUE.isEmpty()) {
				datas.add(QUEUE.poll());
				if (datas.size() >= 50) {
					break;
				}
			}
			if (datas.size() > 0) {
				dailyService.batch(datas);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Autowired
	@Pointcut("@annotation(com.mc.portal.aop.DailyPoint)")
	public void point() {}
	@Before("point()")
	public void before(JoinPoint point) throws Throwable {
		this.task(point, true);
	}
	@AfterReturning(pointcut = "point()", returning = "res")
	public void afterReturning(JoinPoint point, Object res) {}
	@AfterThrowing(pointcut = "point()", throwing = "e")
	public void afterThrowing(Exception e) {}
	@After("point()")
	public void after(JoinPoint point) throws Throwable {
		this.task(point, false);
	}
	@Around("point()")
	public Object around(ProceedingJoinPoint point) throws Throwable {
		return point.proceed();
	}
	@SuppressWarnings("unchecked")
	private void task(JoinPoint point, boolean start) throws Exception {
		if (start) {
			Method method = ((MethodSignature) point.getSignature()).getMethod();
			DailyPoint daily = method.getAnnotation(DailyPoint.class);
			Object[] datas = point.getArgs();
			if (datas == null || datas.length < 1) {
				return;
			}
			
			//方法参数
			Daily en = new Daily();
			String[] state = new String[datas.length];
			String args = null;
			for (int i = 0; i < datas.length; i++) {
				Object data = datas[i];
				if (data == null) {
					continue;
				}
				
				if (data instanceof HttpServletRequest) {
					state[i] = HttpServletRequest.class.getName();
					HttpServletRequest request = (HttpServletRequest) data;
					en.setRemote(ServletTool.getAddr(request));
					en.setAddress(ServletTool.getURI(request));
					en.setType(request.getMethod().toUpperCase());
					if (en.getType().equals("GET")) {
						if (daily.refer()) {
							String refer = request.getHeader("Referer");
							if (refer != null && refer.startsWith(Global.ROOT)) {
								en.setRefer(refer.replace(Global.ROOT, ""));
							}
						}
						en.setForbid(daily.forbid());
					} else if (en.getType().equals("POST")) {
						if (!daily.refer()) {
							String refer = request.getHeader("Referer");
							if (refer != null && refer.startsWith(Global.ROOT)) {
								en.setRefer(refer.replace(Global.ROOT, ""));
							}
						}
						en.setForbid(!daily.forbid());
					}
					
					String query = request.getQueryString();
					if (query != null) {
						String[] groups = query.split("&");
						StringBuffer temp = new StringBuffer();
						for (String group : groups) {
							if (!group.startsWith(Global.KEY_JUMP_MESSAGE)) {
								temp.append("&" + group);
							}
						}
						if (temp.length() > 0) {
							en.setArgs("?" + temp.substring(1));
						}
					}
					
					Map<String, String[]> temp = request.getParameterMap();
					Map<String, String[]> param = new HashMap<String, String[]>();
					for (Map.Entry<String, String[]> group : temp.entrySet()) {
						param.put(group.getKey(), group.getValue());
					}
					for (String key : daily.param()) {
						param.put(key, new String[] {});
					}
					for (String key : daily.protect()) {
						param.put(key, new String[] {});
					}
					en.setParam(JsonTool.write(param));
					
					OnlineInfo online = ServletTool.getOnline(request);
					if (online != null) {
						en.setFkAccount(online.id);
					} else {
						String[] username;
						if (en.getAddress().startsWith("login.htm") && (username = param.get("username")) != null && username.length > 0 && username[0] != null && !username[0].equals("")) {
							Account account = new Account();
							account.setUsername(username[0]);
							account.setSqlQueryField(account.setId(null));
							account.setSqlLeafSize(1L);
							List<Account> accounts = accountService.list(account);
							if (accounts != null && accounts.size() > 0) {
								en.setFkAccount(accounts.get(0).getId());
							}
						}
					}
				} else if (data instanceof HttpServletResponse) {
					state[i] = HttpServletResponse.class.getName();
				} else if (data instanceof PageBody) {
					state[i] = PageBody.class.getName();
					args = JsonTool.write(data);
				} else {
					state[i] = data.getClass().getName();
				}
			}
			if (en.getArgs() == null && args != null) {
				en.setArgs(args);
			}
			
			//数据备份
			List<SuperEntity> entry = new ArrayList<SuperEntity>();
			if (daily.service() != Object.class && Arrays.asList(daily.service().getInterfaces()).contains(SuperService.class)) {
				Annotation[][] groups = method.getParameterAnnotations();
				Class<?> clazz = null;
				Object[] keys = null;
				for (int i = 0; i < groups.length; i++) {
					Annotation[] fields = groups[i];
					for (Annotation field : fields) {
						if (field.annotationType() == DailyPoint.Primary.class) {
							clazz = datas[i].getClass();
							if (clazz.isArray()) {
								clazz = clazz.getComponentType();
								if (clazz.isPrimitive()) {
									if (clazz == int.class) {
										clazz = Integer.class;
										keys = JsonTool.read(JsonTool.write(datas[i]), Integer[].class);
									} else if (clazz == long.class) {
										clazz = Long.class;
										keys = JsonTool.read(JsonTool.write(datas[i]), Long[].class);
									}
								} else {
									if (clazz == Integer.class) {
										keys = (Integer[]) datas[i];
									} else if (clazz == Long.class) {
										keys = (Long[]) datas[i];
									} else if (clazz == String.class) {
										keys = (String[]) datas[i];
									}
								}
							} else {
								if (clazz == int.class || clazz == Integer.class) {
									clazz = Integer.class;
									keys = new Integer[] { (Integer) datas[i] };
								} else if (clazz == long.class || clazz == Long.class) {
									clazz = Long.class;
									keys = new Long[] { (Long) datas[i] };
								} else if (clazz == String.class) {
									keys = new String[] { (String) datas[i] };
								} else if (clazz.getSuperclass() == SuperEntity.class) {
									keys = this.task((SuperEntity) datas[i], ((DailyPoint.Primary) field).field(), clazz);
								}
							}
							break;
						}
					}
					
					if (keys != null) {
						if (clazz == Integer.class) {
							SuperService<Integer, ? extends SuperEntity> service = (SuperService<Integer, ? extends SuperEntity>) context.getBean(daily.service());
							for (Object key : keys) {
								SuperEntity data = service.load((Integer) key);
								if (data != null) {
									entry.add(data);
								}
							}
						} else if (clazz == Long.class) {
							SuperService<Long, ? extends SuperEntity> service = (SuperService<Long, ? extends SuperEntity>) context.getBean(daily.service());
							for (Object key : keys) {
								SuperEntity data = service.load((Long) key);
								if (data != null) {
									entry.add(data);
								}
							}
						} else if (clazz == String.class) {
							SuperService<String, ? extends SuperEntity> service = (SuperService<String, ? extends SuperEntity>) context.getBean(daily.service());
							for (Object key : keys) {
								SuperEntity data = service.load((String) key);
								if (data != null) {
									entry.add(data);
								}
							}
						}
					}
				}
			}
			if (!daily.alias().equals("")) {
				en.setName(daily.alias());
			}
			
			en.setProject(1);
			en.setMethod(method.getName() + "(" + JsonTool.write(state).replace("\"", "").replace(",", ", ").replace("[", "").replace("]", "") + ")");
			en.setEntry(JsonTool.write(entry));
			en.setSize(entry.size());
			en.setCreated(new Date());
			if (en.getSize() < 1) {
				en.setSize(daily.impact() ? 1 : 0);
			}
			en.setTrack(System.currentTimeMillis());
			task.set(en);
		} else {
			Daily en = task.get();
			if (en != null) {
				String[] power = StartListener.MAPPER.get(en.getAddress());
				if (power != null) {
					en.setFkPower(power[0]);
					if (en.getName() == null) {
						en.setName(power[1]);
					}
					if (en.getRefer() != null) {
						int index = en.getRefer().indexOf("?");
						power = StartListener.MAPPER.get(index != -1 ? en.getRefer().substring(0, index) : en.getRefer());
						if (power == null) {
							en.doFieldValue(en.setRefer(null).ClazzFieldName, null);
						} else {
							en.setTitle(power[1]);
						}
					}
					en.setTrack(System.currentTimeMillis() - en.getTrack());
					QUEUE.offer(en);
				}
				task.remove();
			}
		}
	}
	private Object[] task(SuperEntity entity, String field, Class<?> clazz) throws Exception {
		Field[] temps = entity.getClass().getDeclaredFields();
		for (java.lang.reflect.Field temp : temps) {
			temp.setAccessible(true);
			if (temp.getName().equals(field)) {
				clazz = temp.getType();
				if (clazz == Integer.class) {
					return new Integer[] { (Integer) temp.get(entity) };
				} else if (clazz == Long.class) {
					return new Long[] { (Long) temp.get(entity) };
				} else if (clazz == String.class) {
					return new String[] { (String) temp.get(entity) };
				}
			}
		}
		return null;
	}
}