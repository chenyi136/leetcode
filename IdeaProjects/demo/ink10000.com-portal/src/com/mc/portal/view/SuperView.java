package com.mc.portal.view;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.SuperEntity;
import com.mc.core.service.SuperService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.PageBody;
public abstract class SuperView<K, E extends SuperEntity> extends Global {
	/**
	 * 日志对象
	 * */
	protected final Log logger = LogFactory.getLog(SuperView.class);
	/**
	 * 业务接口
	 * */
	protected SuperService<K, E> service;
	/**
	 * 构造方法
	 * @param service 业务接口
	 * */
	public SuperView(SuperService<K, E> service) {
		this.service = service;
	}
	/**
	 * 加载对象
	 * @param request 请求对象
	 * @param id 数据主键
	 * @param en 实体对象
	 * @param view 视图路径
	 * */
	protected final ModelAndView load(HttpServletRequest request, K id, E en, String view) throws Exception {
		E temp = service.get(en);
		if (temp == null) {
			en.doFieldValue(JDBC_PRIMARY_FIELD, null);
		} else {
			en = temp;
			en.doFieldValue(JDBC_PRIMARY_FIELD, id);
		}
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + view);
		res.addObject("pages", en);
		return res;
	}
	/**
	 * 查询参数
	 * @param request 请求对象
	 * @param field 排序字段
	 * @param queue 排序方式
	 * */
	protected final PageBody list(HttpServletRequest request, SuperEntity.Field field, boolean queue) {
		request.setAttribute(KEY_JUMP_MESSAGE, request.getParameter(KEY_JUMP_MESSAGE));
		PageBody res = null;
		try {
			String temp = request.getParameter(KEY_JUMP_PAGING);
			if (temp != null && !temp.equals("")) {
				res = JsonTool.read(CryptoTool.Base64H.decode(temp), PageBody.class);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (res == null) {
			res = new PageBody();
		}
		if (res.getOrder() == null || res.getOrder().equals("")) {
			res.setOrder(field.FrameFieldName);
			res.setQueue(queue);
		}
		return res;
	}
	/**
	 * 查询数据
	 * @param request 请求对象
	 * @param en 实体对象
	 * @param pages 参数对象
	 * */
	protected final List<E> list(HttpServletRequest request, E en, PageBody pages) throws Exception {
		if (en == null || pages == null) {
			return new ArrayList<E>();
		}
		this.list(request, pages, en);
		List<PageBody.PageBodyValue> equal = pages.getEqual();
		if (equal != null && equal.size() > 0) {
			for (PageBody.PageBodyValue temp : equal) {
				if (en.doFieldVerify(this.list(temp.name)) != null) {
					en.setSqlQueryTerm(true, temp.name, SuperEntity.Operation.EqualTo, temp.value);
				}
			}
		}
		List<PageBody.PageBodyValue> like = pages.getLike();
		if (like != null && like.size() > 0) {
			for (PageBody.PageBodyValue temp : like) {
				if (en.doFieldVerify(this.list(temp.name)) != null) {
					en.setSqlQueryTerm(true, temp.name, SuperEntity.Operation.Like, "%" + temp.value.replace("%", "\\%").replace("_", "\\_") + "%");
				}
			}
		}
		en.setSqlLeafTotal(service.count(en));
		if (en.getSqlLeafTotal() < 1L) {
			return new ArrayList<E>();
		}
		en.setSqlLeafSize(pages.getSize() > 0 ? pages.getSize() : LEAF_DEF_SIZE);
		en.setSqlLeafNow(pages.getNow() > en.getSqlLeafTabs() ? en.getSqlLeafTabs() : pages.getNow());
		if (en.doFieldVerify(this.list(pages.getOrder())) != null) {
			en.setSqlQueryOrder(pages.getOrder(), pages.getQueue());
		}
		List<E> res = service.list(en);
		if (res != null) {
			pages.init(en.getSqlLeafTotal(), en.getSqlLeafSize(), en.getSqlLeafTabs(), en.getSqlLeafNow(), new Long(res.size()));
			return res;
		}
		return new ArrayList<E>();
	}
	/**
	 * 加载方法
	 * @param request 请求对象
	 * @param response 响应对象
	 * @param en 实体对象
	 * */
	public abstract ModelAndView load(HttpServletRequest request, HttpServletResponse response, E en) throws Exception;
	/**
	 * 加载方法
	 * @param request 请求对象
	 * @param response 响应对象
	 * @param id 数据主键
	 * */
	public abstract JMapView load(HttpServletRequest request, K id);
	/**
	 * 增改方法
	 * @param request 请求对象
	 * @param response 响应对象
	 * @param en 实体对象
	 * */
	public abstract ModelAndView save(HttpServletRequest request, HttpServletResponse response, E en) throws Exception;
	/**
	 * 增改方法
	 * @param request 请求对象
	 * @param en 实体对象
	 * */
	public abstract JMapView save(HttpServletRequest request, E en);
	/**
	 * 删除方法
	 * @param request 请求对象
	 * @param en 实体对象
	 * @param ids 主键数组
	 * */
	public JMapView drop(HttpServletRequest request, E en, K[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length < 1) {
				res.setState("请求参数非法");
				return res;
			}
			en.setSqlQueryIn(true, new SuperEntity.Field(null, false, null, ids[0].getClass(), JDBC_PRIMARY_FIELD, 0, null), true, ids);
			res.put("count", service.trash(en));
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	/**
	 * 查询参数
	 * @param request 请求对象
	 * @param pages 参数对象
	 * @param en 实体对象
	 * */
	public abstract Object list(HttpServletRequest request, PageBody pages, E en) throws Exception;
	/**
	 * 查询方法
	 * @param request 请求对象
	 * @param response 响应对象
	 * */
	public abstract ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception;
	/**
	 * 查询方法
	 * @param request 请求对象
	 * @param pages 参数对象
	 * */
	public abstract JMapView list(HttpServletRequest request, PageBody pages);
	/**
	 * 驼峰命名
	 * @param frame 结构字段
	 * */
	private String list(String frame) {
		if (frame == null || frame.equals("") || frame.indexOf("_") == -1) {
			return frame;
		}
		StringBuffer res = new StringBuffer();
		String[] datas = frame.split("_");
		for (int i = 0; i < datas.length; i++) {
			res.append(i != 0 ? datas[i].substring(0, 1).toUpperCase() + datas[i].substring(1) : datas[i]);
		}
		return res.toString();
	}
}