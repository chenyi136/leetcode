package data;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.Base64;

public class Temp22 {
	public static void main(String[] args) throws Exception {
		List<String> lines = read(null, new File("E:/下载.json"));
		System.out.println(lines.size());
		System.out.println(lines.get(0));
		System.out.println(new String(Base64.decodeBase64(lines.get(0)), "UTF-8"));
	}
	
	public static List<String> read(InputStream is, File source) {
		if (is == null && (source == null || !source.exists() || !source.isFile() || !source.canRead())) {
			return null;
		}
		BufferedReader reader = null;
		boolean flag = false;
		try {
			if (is == null) {
				is = new FileInputStream(source);
				flag = true;
			}
			reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			List<String> res = new ArrayList<String>();
			String line;
			while ((line = reader.readLine()) != null) {
				res.add(line);
			}
			if (res.size() > 0) {
				return res;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (flag && reader != null) {
					reader.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
