package data;
import java.io.File;
import java.util.List;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.TimeTool;
public class 短视检测 {
	public static void main1(String[] args) throws Exception {
		final String LOGO = "http://puui.qpic.cn/qqvideo/0/";
		final String TIME = "\"c_tx c_tx3 goDetail\" title=\"";
		System.out.println("http://imgcache.qq.com/tencentvideo_v1/player/TPQzone.swf?vid=");
		for (int i = 1; i <= 1; i++) {
			StringBuffer data = new StringBuffer();
			List<String> lines = FileTool.read(null, new File("E:/page/陈翔六点半 [http___2513883391.qzone.qq.com]-" + i + "_files/index.html"));
			for (String line : lines) {
				data.append(line);
			}
			int open = data.indexOf(LOGO);
			while (open != -1) {
				int stop = data.indexOf("\"", open + LOGO.length());
				String temp = data.substring(open + LOGO.length(), stop).replace("/0", "");
				open = data.indexOf(TIME, stop + 1);
				stop = data.indexOf("\"", open + 29);
				try {
					System.out.println(TimeTool.getTime(TimeTool.getTime(data.substring(open + 29, stop), "yyyy年M月d日 HH:mm"), "yyyyMMdd_HHmm") + "：" + temp);
				} catch (Exception e) {
					System.out.println(TimeTool.getTime(TimeTool.getTime(data.substring(open + 29, stop), "yyyy年MM月dd日"), "yyyyMMdd_HHmm") + "：" + temp);
				}
				open = data.indexOf(LOGO, stop + 1);
			}
			System.out.println();
		}
	}
}