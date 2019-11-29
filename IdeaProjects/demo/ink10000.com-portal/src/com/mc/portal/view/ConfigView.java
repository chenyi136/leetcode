package com.mc.portal.view;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.site.Config;
import com.mc.core.service.site.ConfigService;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.tool.ServletTool;
@Controller("com.mc.portal.view.ConfigView")
@RequestMapping("/config/")
public class ConfigView extends Global {
	@Autowired
	private ConfigService configService;
	@DailyPoint(refer = true)
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		if (id != null && id > 0) {
			Config en = new Config();
			en.setId(id);
			en.setSqlQueryField(en.setEntry(null), en.setOctet(null), en.setFkAccount(null));
			en = configService.get(en);
			if (en == null || en.doIsEmpty(en.getOctet()) || !en.getFkAccount().equals(online.id)) {
				response.sendError(404);
				return null;
			}
			
			ServletTool.getDown(request, response, Base64.decodeBase64(en.getEntry()), null, en.getOctet());
			return null;
		} else {
			Config en = new Config();
			en.setSqlUpdateNull(en.setClazz(null));
			en.setSqlUpdateNull(en.setField(null));
			en.setSqlQueryTerm(false, en.setFkAccount(null), Config.Operation.EqualTo, online.id);
			en.setSqlQueryTerm(true, en.setClazz(null), Config.Operation.EqualTo, "");
			en.setSqlQueryTerm(false, en.setFkAccount(null), Config.Operation.EqualTo, online.id);
			en.setSqlQueryTerm(true, en.setField(null), Config.Operation.EqualTo, "");
			en.setSqlQueryTerm(false, en.setFkAccount(null), Config.Operation.EqualTo, online.id);
			en.setSqlQueryNull(true, en.setClazz(null), false);
			en.setSqlQueryTerm(false, en.setFkAccount(null), Config.Operation.EqualTo, online.id);
			en.setSqlQueryNull(true, en.setField(null), false);
			configService.alter(en);
			
			en = new Config();
			en.setSqlUpdateNull(en.setOctet(null));
			en.setSqlQueryTerm(true, en.setFkAccount(null), Config.Operation.EqualTo, online.id);
			en.setSqlQueryTerm(true, en.setOctet(null), Config.Operation.EqualTo, "");
			configService.alter(en);
			
			en = new Config();
			en.setFkAccount(online.id);
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setEntry(null));
			en.setSqlQueryNull(true, en.setClazz(null), false);
			en.setSqlQueryNull(true, en.setField(null), false);
			en.setSqlQueryNull(true, en.setOctet(null), false);
			en.setSqlQueryOrder(en.setName(null), true);
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Config> datas1 = configService.list(en);
			
			en = new Config();
			en.setFkAccount(online.id);
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setOctet(null));
			en.setSqlQueryNull(true, en.setClazz(null), false);
			en.setSqlQueryNull(true, en.setField(null), false);
			en.setSqlQueryNull(true, en.setOctet(null), true);
			en.setSqlQueryOrder(en.setName(null), true);
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Config> datas2 = configService.list(en);
			
			ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "_/share/config");
			res.addObject("datas1", datas1 != null ? datas1 : new ArrayList<Config>());
			res.addObject("datas2", datas2 != null ? datas2 : new ArrayList<Config>());
			return res;
		}
	}
	@DailyPoint(refer = true, forbid = true, impact = true)
	@ResponseBody
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public JMapView index(HttpServletRequest request, String type, Integer id, String name, String entry, String note, @RequestParam(value = "octet", required = false) MultipartFile octet) {
		JMapView res = new JMapView();
		try {
			if (!Arrays.asList("load", "get", "save", "file", "drop").contains(type)) {
				res.setState("请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			if (type.equals("load") || type.equals("get")) {
				Config en = new Config();
				en.setId(id);
				en.setSqlQueryField(type.equals("load") ? new Config.Field[] { en.setName(null), en.setEntry(null), en.setFkAccount(null) } : new Config.Field[] { en.setName(null), en.setOctet(null), en.setFkAccount(null) });
				if (id == null || id < 1 || (en = configService.get(en)) == null || !en.getFkAccount().equals(online.id)) {
					res.setState("请求参数非法");
					return res;
				}
				
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("name", en.getName());
				data.put("entry", en.getEntry());
				data.put("octet", en.getOctet());
				res.setData(data);
				res.setState(OK);
			} else if (type.equals("save")) {
				if (name == null || name.equals("")) {
					res.setState("请求参数非法");
					return res;
				}
				
				Config en = new Config();
				en.setName(name);
				en.setEntry(entry);
				if (id == null) {
					if (en.getEntry() == null) {
						res.setState("请求参数非法");
						return res;
					}
					
					en.setTacit("null");
					en.setFkAccount(online.id);
					if (configService.save(en)) {
						res.put("id", en.getId());
						res.setState(OK);
					} else {
						res.setState("保存参数失败");
					}
				} else {
					en.setId(id);
					en.setSqlUpdateNull(en.setClazz(null));
					en.setSqlUpdateNull(en.setField(null));
					res.setState(configService.update(en) ? OK : "更新参数失败");
				}
			} else if (type.equals("file")) {
				if (octet == null || octet.getBytes().length < 1) {
					res.setState("请求参数非法");
					return res;
				}
				
				Config en = new Config();
				en.setName("-");
				en.setTacit("null");
				en.setEntry(Base64.encodeBase64String(octet.getBytes()));
				en.setOctet(octet.getOriginalFilename());
				en.setFkAccount(online.id);
				if (en.getEntry().length() > 65535) {
					res.setState("上传文件过大");
					return res;
				}
				if (en.getOctet().length() > 80) {
					en.setOctet(en.getOctet().substring(en.getOctet().length() - 80));
				}
				
				if (configService.save(en)) {
					res.put("id", en.getId());
					res.put("octet", en.getOctet());
					res.setState(OK);
				} else {
					res.setState("上传文件失败");
				}
			} else if (type.equals("drop")) {
				if (id == null || id < 1) {
					res.setState("请求参数非法");
					return res;
				}
				
				Config en = new Config();
				en.setId(id);
				en.setFkAccount(online.id);
				res.setState(configService.trash(en) > 0 ? OK : "删除参数失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}
