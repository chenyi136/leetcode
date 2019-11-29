package com.ziniu.template;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.mozilla.universalchardet.UniversalDetector;
import com.ziniu.crux.Global;
import com.ziniu.entity.core.Analyze;
import com.ziniu.tool.JsonTool;
public class HyperHelper {
	public static String china(String data) {
		if (data == null || data.equals("")) {
			return null;
		}
		data = data.replaceAll("[^\u4E00-\u9FA5]", "");
		if (!data.equals("")) {
			return data;
		}
		return null;
	}
	public static String guess(byte[] data) {
		try {
			String body = new String(data, "ascii");
			Matcher matcher = Pattern.compile("<meta\\s+([^>]*http-equiv=(\"|')?content-type(\"|')?[^>]*)>", Pattern.CASE_INSENSITIVE).matcher(body);
			if (matcher.find()) {
				matcher = Pattern.compile("charset=\\s*([a-z][_\\-0-9a-z]*)", Pattern.CASE_INSENSITIVE).matcher(matcher.group(1));
				if (matcher.find()) {
					return matcher.group(1);
				}
			}
			matcher = Pattern.compile("<meta\\s+charset\\s*=\\s*[\"']?([a-z][_\\-0-9a-z]*)[^>]*>", Pattern.CASE_INSENSITIVE).matcher(body);
			if (matcher.find()) {
				return matcher.group(1);
			}
			int prefix = Math.min(data.length, 2048);
			if (prefix >= 3 && data[0] == (byte) 0xEF && data[1] == (byte) 0xBB && data[2] == (byte) 0xBF) {
				return "UTF-8";
			} else if (prefix >= 2) {
				if (data[0] == (byte) 0xFF && data[1] == (byte) 0xFE) {
					return "UTF-16LE";
				} else if (data[0] == (byte) 0xFE && data[1] == (byte) 0xFF) {
					return "UTF-16BE";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		UniversalDetector detector = new UniversalDetector(null);
		detector.handleData(data, 0, data.length);
		detector.dataEnd();
		String res = detector.getDetectedCharset();
		detector.reset();
		if (res != null) {
			return res;
		}
		return "UTF-8";
	}
	public static Date time(String date, String pattern) throws Exception {
		if (date == null || date.equals("")) {
			return null;
		}
		return new SimpleDateFormat(pattern != null ? pattern : Global.SIMPLE_DATE_FORMAT).parse(date);
	}
	public static String time(Date date, String pattern) {
		return new SimpleDateFormat(pattern != null ? pattern : Global.SIMPLE_DATE_FORMAT).format(date != null ? date : new Date());
	}
	public static void trend(String data, Analyze res) throws Exception {
		Map<Integer, Integer> detail = new LinkedHashMap<Integer, Integer>();
		int[] trend = new int[] { 0, 0 };
		for (Map.Entry<Integer, String> temp : Global.HYPER_SPIRIT_NEGATIVE.entrySet()) {
			String value = temp.getValue();
			int length = value.length();
			int index = -1 * length;
			int count = 0;
			while ((index = data.indexOf(value, index + length)) != -1) {
				count--;
			}
			if (count > 0) {
				detail.put(temp.getKey(), count);
				trend[0] += count;
			}
		}
		for (Map.Entry<Integer, String> temp : Global.HYPER_SPIRIT_POSITIVE.entrySet()) {
			String value = temp.getValue();
			int length = value.length();
			int index = -1 * length;
			int count = 0;
			while ((index = data.indexOf(value, index + length)) != -1) {
				count++;
			}
			if (count > 0) {
				detail.put(temp.getKey(), count);
				trend[1] += count;
			}
		}
		res.setDetail(JsonTool.write(detail));
		trend[0] = Math.abs(trend[0]);
		if (trend[0] >= 3) {
			res.setTrend("FUMIAN");
		} else {
			res.setTrend(trend[0] == 0 && trend[1] > 0 || trend[0] > 0 && trend[1] / trend[0] >= 3 ? "ZHENGMIAN" : "ZHONGLI");
		}
	}
}