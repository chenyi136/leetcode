package data;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.web.client.RestTemplate;
import com.mc.core.tool.CryptoTool;
public class 医生网签 {
	public static void main1(String[] args) throws Exception {
		RestTemplate template = new RestTemplate();
		String clientId = "2018041016524072";
		String appSecret = "2018041016524018";
		String accessToken = "8a2081a7f1434aa7a48b4aaf86d3c113";
		System.out.println(template.getForObject("http://test.yiwangqian.com/device/server/oauth/getAccessToken?clientId=" + clientId + "&appSecret=" + appSecret, String.class));
		Map<String, String> head = new HashMap<String, String>();
		head.put("serviceId", "100");
		head.put("clientId", clientId);
		head.put("accessToken", accessToken);
		head.put("bodySign", "");
	}
	public static void main2(String[] args) throws Exception {
		Map<String, String> body = new HashMap<String, String>();
		body.put("process", "0");
		body.put("phoneNum", "13333333333");
		body.put("openId", "bfabde89520ef008q4b34w923fy543f6209");
		body.put("time", "2017-07-24 11:15:37");
		System.out.println(sign(body, "111111"));
	}
	public static String sign(Map<String, String> body, String appSecret) throws Exception {
		StringBuffer param = new StringBuffer();
		if (body != null && body.size() > 0) {
			List<String> keys = new ArrayList<String>(body.keySet());
			Collections.sort(keys);
			for (String key : keys) {
				String value = String.valueOf(body.get(key));
				if (value != null && !"".equals(value)) {
					param.append("&" + key);
					param.append("=" + value);
				}
			}
			param.deleteCharAt(0);
		}
		return CryptoTool.MD5.encode(param + "#" + appSecret);
	}
}