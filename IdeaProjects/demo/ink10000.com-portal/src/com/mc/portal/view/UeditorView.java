package com.mc.portal.view;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/ueditor/")
public class UeditorView extends Global {
	@DailyPoint(refer = true, forbid = true)
	@RequestMapping(value = "config", method = RequestMethod.GET)
	public void config(HttpServletRequest request, HttpServletResponse response, String action) throws Exception {
		if ("config".equals(action)) {
			InputStream is = super.getClass().getResourceAsStream("/config/ueditor.json");
			List<String> lines = FileTool.read(is, null);
			is.close();
			StringBuffer res = new StringBuffer();
			for (String line : lines) {
				res.append(line);
			}
			super.out(response, res.toString(), null);
		} else if (Arrays.asList("listimage", "listfile").contains(action)) {
			List<File> files = new ArrayList<File>();
			FileTool.list(new File(ServletTool.getPath(request, null, "/data/")), action.equals("listimage") ? new String[] { ".bmp", ".gif", ".jpg", ".jpeg", ".png" } : null, files);
			List<Map<String, String>> items = new ArrayList<Map<String, String>>();
			for (File file : files) {
				Map<String, String>item = new HashMap<String, String>();
				item.put("url", super.file(file.getName()));
				items.add(item);
			}
			Map<String, Object>res = new HashMap<String, Object>();
			res.put("total", items.size());
			res.put("start", 0);
			res.put("list", items);
			res.put(STATE, "SUCCESS");
			super.out(response, JsonTool.write(res), null);
		}
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "config", method = RequestMethod.POST)
	public Map<String, String> config(HttpServletRequest request, HttpServletResponse response, String action, @RequestParam(value = "upfile", required = false) MultipartFile doc) {
		Map<String, String> res = new HashMap<String, String>();
		try {
			String root = ServletTool.getPath(request, null, "/data/");
			if (Arrays.asList("uploadimage", "uploadvideo", "uploadfile").contains(action)) {
				Map<String, String> temp = ShareView.upload(root, doc);
				String state = temp.get(STATE);
				if (OK.equals(state)) {
					String id = temp.get("id");
					res.put("original", temp.get("name"));
					res.put("type", FileTool.suffix(id)[1]);
					res.put("size", temp.get("size"));
					res.put("title", temp.get("name"));
					res.put("url", super.file(id));
					res.put(STATE, "SUCCESS");
				} else {
					res.put(STATE, state);
				}
			} else if ("uploadscrawl".equals(action)) {
				String content = request.getParameter("upscrawl");
				if (content != null && !content.equals("")) {
					byte[] data = Base64.decodeBase64(content);
					String id = CryptoTool.MD5.encode(data);
					File target = new File(root, id.substring(0, 2) + "/" + id + ".jpg");
					File parent = target.getParentFile();
					if (!parent.exists() || !parent.isDirectory()) {
						if (!parent.mkdirs()) {
							throw new Exception("创建存储目录失败");
						}
					}
					
					BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(target));
					bos.write(data);
					bos.flush();
					bos.close();
					id = ShareView.upload(id, ".jpg", target.getName(), data);
					
					res.put("original", "");
					res.put("type", ".jpg");
					res.put("size", String.valueOf(target.length()));
					res.put("title", target.getName());
					res.put("url", super.file(id));
					res.put(STATE, "SUCCESS");
				}
			}
			if (!res.containsKey(STATE)) {
				res.put(STATE, "请求参数非法");
			}
		} catch (Exception e) {
			res.put(STATE, e.getMessage() != null ? e.getMessage() : "未知错误");
			e.printStackTrace();
		}
		return res;
	}
}