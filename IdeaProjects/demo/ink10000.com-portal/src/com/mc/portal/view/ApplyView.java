package com.mc.portal.view;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auth.Apply;
import com.mc.core.service.auth.ApplyService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/apply/")
public class ApplyView extends Global {
	@Autowired
	private ApplyService applyService;
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView(VIEW_PATH_PREFIX + "_/share/apply");
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public JMapView index(HttpServletRequest request, String type, @RequestParam(name = "prefixs[]", required = false) String[] prefixs, Apply en) {
		JMapView res = new JMapView();
		try {
			if (!Arrays.asList("load", "save", "drop", "list").contains(type)) {
				res.setState("请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			if (type.equals("load")) {
				if (en.getId() == null || en.getId() < 1) {
					res.setState("请求参数非法");
					return res;
				}
				
				Apply temp = new Apply();
				if ((temp = applyService.load(en.getId())) == null || !temp.getFkAccount().equals(online.id)) {
					res.setState("请求参数非法");
					return res;
				}
				
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("name", temp.getName());
				data.put("address", temp.getAddress());
				data.put("mark", temp.getMark());
				data.put("username", temp.getUsername());
				data.put("email", temp.getEmail());
				data.put("phone", temp.getPhone());
				data.put("password", !temp.doIsEmpty(temp.getPassword()) ? CryptoTool.DES.decode(temp.getPassword()) : null);
				data.put("defray", !temp.doIsEmpty(temp.getDefray()) ? CryptoTool.DES.decode(temp.getDefray()) : null);
				data.put("device", !temp.doIsEmpty(temp.getDevice()) ? CryptoTool.DES.decode(temp.getDevice()) : null);
				data.put("occur", temp.getOccur());
				data.put("edited", TimeTool.getTime(temp.getEdited(), null));
				res.setData(data);
				res.setState(OK);
			} else if (type.equals("save")) {
				if (!en.doIsEmpty(en.getPassword())) {
					en.setPassword(CryptoTool.DES.encode(en.getPassword()));
				}
				if (!en.doIsEmpty(en.getDefray())) {
					en.setDefray(CryptoTool.DES.encode(en.getDefray()));
				}
				if (!en.doIsEmpty(en.getDevice())) {
					en.setDevice(CryptoTool.DES.encode(en.getDevice()));
				}
				en.setEdited(new Date());
				if (en.getId() == null) {
					en.setFkAccount(online.id);
				} else {
					if (en.getPhone() == null) {
						en.setSqlUpdateNull(en.setPhone(null));
					}
				}
				res.setState(en.getId() == null ? (applyService.save(en) ? OK : "添加应用失败") : (applyService.update(en) ? OK : "更新应用失败"));
			} else if (type.equals("drop")) {
				if (en.getId() == null || en.getId() < 1) {
					res.setState("请求参数非法");
					return res;
				}
				res.setState(applyService.delete(en.getId()) ? OK : "删除应用失败");
			} else if (type.equals("list")) {
				if (prefixs == null || prefixs.length < 1) {
					res.setState("请求参数非法");
					return res;
				}
				
				Apply temp = new Apply();
				temp.setFkAccount(online.id);
				temp.setSqlQueryField(temp.setId(null), temp.setName(null), temp.setAddress(null), temp.setMark(null), temp.setUsername(null), temp.setEmail(null), temp.setPhone(null), temp.setOccur(null), temp.setEdited(null));
				if (!prefixs[0].equals("/")) {
					temp.setSqlQueryIn(true, temp.setAddress(null), true, prefixs);
				}
				temp.setSqlQueryOrder(temp.setAddress(null), true);
				temp.setSqlQueryOrder(temp.setUsername(null), true);
				temp.setSqlLeafSize(LEAF_MAX_SIZE);
				List<Apply> datas = applyService.list(temp);
				if (datas != null && datas.size() > 0) {
					for (Apply data : datas) {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("id", data.getId());
						map.put("name", data.getName());
						map.put("address", data.getAddress());
						map.put("mark", data.getMark());
						map.put("username", data.getUsername());
						map.put("email", data.getEmail());
						map.put("phone", data.getPhone());
						map.put("occur", data.getOccur());
						map.put("edited", TimeTool.getTime(data.getEdited(), null));
						res.setDatas(map);
					}
					res.setState(OK);
				} else {
					res.setState("暂无数据");
				}
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}