package com.ziniu.view;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.ziniu.crux.Global;
import com.ziniu.entity.core.Keyword;
import com.ziniu.entity.core.Media;
import com.ziniu.entity.core.Program;
import com.ziniu.pojo.ProgramInfo;
import com.ziniu.service.core.KeywordService;
import com.ziniu.service.core.ProgramService;
import com.ziniu.tool.JsonTool;
import com.ziniu.tool.ServletTool;
public abstract class SuperView extends Global {
	public final String[] grab(Date now) {
		GregorianCalendar ggc = new GregorianCalendar();
		ggc.setTime(now != null ? now : new Date());
		int index = ggc.get(GregorianCalendar.DAY_OF_YEAR);
		String[] res = new String[7];
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 6);
		res[0] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 5);
		res[1] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 4);
		res[2] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 3);
		res[3] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 2);
		res[4] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 1);
		res[5] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 0);
		res[6] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		return res;
	}
	@SuppressWarnings("unchecked")
	public final Map<Integer, ProgramInfo> program(HttpServletRequest request, ProgramService programService, KeywordService keywordService, String account, Long words) throws Exception {
		Map<Integer, ProgramInfo> res = ServletTool.getAttribute(request, KEY_SESSION_PROGRAM, Map.class);
		if (res != null && res.size() > 0) {
			return res;
		}
		
		res = new LinkedHashMap<Integer, ProgramInfo>();
		Program en = new Program();
		en.setFkAccount(account);
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setQueue(null));
		en.setSqlQueryOrder(en.setQueue(null), true);
		en.setSqlLeafSize(words);
		List<Program> datas = programService.list(en);
		int queue = 0;
		if (datas != null && datas.size() > 0) {
			for (Program data : datas) {
				queue++;
				if (data.getQueue() != queue) {
					Program temp = new Program();
					temp.setId(data.getId());
					temp.setQueue(queue);
					programService.update(temp);
					data.setQueue(queue);
				}
				
				ProgramInfo value = res.get(data.getId());
				if (value == null) {
					value = new ProgramInfo();
					value.id = data.getId();
					value.name = data.getName();
					value.queue = data.getQueue();
					value.keywords = new LinkedHashMap<Integer, String>();
					res.put(data.getId(), value);
				}
				
				Keyword keyword = new Keyword();
				keyword.setFkProgram(data.getId());
				keyword.setSqlQueryField(keyword.setId(null), keyword.setName(null));
				keyword.setSqlQueryOrder(keyword.setCreated(null), false);
				keyword.setSqlLeafSize(words);
				List<Keyword> keywords = keywordService.list(keyword);
				if (keywords != null && keywords.size() > 0) {
					for (Keyword temp : keywords) {
						value.keywords.put(temp.getId(), temp.getName());
					}
				}
			}
		}
		ServletTool.setAttribute(request, KEY_SESSION_PROGRAM, res);
		return res;
	}
	@SuppressWarnings("unchecked")
	public static final Map<String, Map<Integer, Media>> media(HttpServletRequest request, ProgramService programService, String account) throws Exception {
		if (request != null) {
			Map<String, Map<Integer, Media>> res = ServletTool.getAttribute(request, KEY_SESSION_MEDIA, Map.class);
			if (res != null && res.size() > 0) {
				return res;
			}
		}
		Map<String, Map<Integer, Media>> map = new LinkedHashMap<String, Map<Integer, Media>>();
		for (Map.Entry<String, String> data : HYPER_MEDIA_TYPE.entrySet()) {
			map.put(data.getKey(), new LinkedHashMap<Integer, Media>());
		}
		
		Program en = new Program();
		en.setFkAccount(account);
		en.setSqlQueryField(en.setMedia(null));
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Program> datas = programService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Program data : datas) {
				Map<String, String> engine = JsonTool.read(data.getMedia(), Map.class);
				for (String key : engine.keySet()) {
					Media media = HYPER_MEDIA_ENGINE.get(Integer.parseInt(key));
					if (media == null) {
						continue;
					}
					Map<Integer, Media> value = map.get(media.getEngine());
					if (value == null) {
						continue;
					}
					if (!value.containsKey(media.getId())) {
						value.put(media.getId(), media);
					}
				}
			}
		}
		
		Map<String, Map<Integer, Media>> res = new LinkedHashMap<String, Map<Integer, Media>>();
		for (Map.Entry<String, Map<Integer, Media>> data : map.entrySet()) {
			if (data.getValue().size() > 0) {
				res.put(data.getKey(), data.getValue());
			}
		}
		if (request != null) {
			ServletTool.setAttribute(request, KEY_SESSION_MEDIA, res);
		}
		return map;
	}
}