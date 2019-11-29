package data;
import java.io.File;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
public class 开放检测 {
	public static void main1(String[] args) throws Exception {
		for (int i = 0; i < 4; i++) {
			String root = "G:/视频库/temp/开放/" + i + "/";
			File[] files = new File(root).listFiles();
			for (File file : files) {
				System.out.println(file.getName() + "->" + file.renameTo(new File(root, CryptoTool.MD5.encode(file, false).MD5 + FileTool.suffix(file.getName())[1])));
			}
			System.out.println();
		}
	}
	public static void main2(String[] args) throws Exception {
		final String root = "G:/视频库/开放/";
		File[] files = new File("G:/视频库/temp/开放/OK/").listFiles();
		if (files != null && files.length > 0) {
			for (File file : files) {
				String name = file.getName();
				file.renameTo(new File(root + name.substring(0, 1) + "-" + name.substring(1, 2) + "/" + name));
			}
		}
		for (int i = 1; i <= 15; i++) {
			for (int j = 0; j <= 15; j++) {
				String key = Integer.toHexString(i) + "-" + Integer.toHexString(j);
				File[] temp = new File(root + key + "/").listFiles();
				if (temp == null || temp.length < 1) {
					continue;
				}
				key = key.replace("-", "");
				for (File file : temp) {
					if (!file.getName().startsWith(key)) {
						throw new Exception(key);
					}
				}
				System.out.println(key + "：" + temp.length);
			}
		}
	}
}