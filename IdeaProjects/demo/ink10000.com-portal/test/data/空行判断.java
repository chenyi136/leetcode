package data;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import com.mc.core.tool.FileTool;
public class 空行判断 {
	private static final String[] ROOT = new String[] {
		"D:/work/myeclipse-2014/ink10000.com/src/",
		"D:/work/myeclipse-2014/ink10000.com-admin/src/",
		"D:/work/myeclipse-2014/ink10000.com-demo/src/",
		"D:/work/myeclipse-2014/ink10000.com-home/src/",
		"D:/work/myeclipse-2014/ink10000.com-portal/src/",
		"D:/work/myeclipse-2014/ink10000.com-portal/test/",
		"D:/work/myeclipse-2014/yifeijiankang.com-client/src/",
		
		/*"C:/Users/Administrator/Workspaces/MyEclipse 2016/ink10000.com-home/src/",
		"C:/Users/Administrator/Workspaces/MyEclipse 2016/ink10000.com-portal/src/",*/
	};
	public static void main(String[] args) {
		for (String root : ROOT) {
			int count = 0;
			List<File> files = new ArrayList<File>();
			FileTool.list(new File(root), new String[] { ".java" }, files);
			for (File file : files) {
				List<String> lines = FileTool.read(null, file);
				for (String line : lines) {
					if (line.equals("")) {
						System.out.println(file.getAbsolutePath().replace("\\", "/"));
						break;
					}
					count++;
				}
			}
			System.out.println(root + "->" + count);
		}
	}
}