package data;
import java.io.File;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.portal.tool.VideoTool;
public class 文件检测 {
	public static void main1(String[] args) throws Exception {
		String root = "E:/第08季/";
		File[] files = new File(root).listFiles();
		for (File file : files) {
			if (!file.isFile()) {
				continue;
			}
			String name = root + "行尸走肉" + file.getName().substring(22, 28) + ".mp4";
			System.out.println(name);
			//System.out.println(file.renameTo(new File(name)));
		}
	}
	public static void main(String[] args) throws Exception {
		StringBuffer line = new StringBuffer();
		VideoTool.verify(new File("E:/todo/临时"), "", line);
		System.out.println(line);
	}
	public static void main3(String[] args) throws Exception {
		File file = new File("E:/转码后/68.超级无敌掌门狗：剃刀边缘.mkv");
		String id = CryptoTool.MD5.encode(file, false).MD5;
		System.out.println("file_entry(id,name,address,length)->" + id + "," + file.getName() + "," + FileTool.length(null, file));
		StringBuffer line = new StringBuffer();
		VideoTool.verify(file, "", line);
		System.out.println("blog_movie(id,width,height,track,rate)-->" + id + "," + line);
	}
}