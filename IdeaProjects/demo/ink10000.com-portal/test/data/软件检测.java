package data;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.file.EntryService;
import com.mc.core.tool.CryptoTool;
public class 软件检测 {
	private static final ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
	public static void main1(String[] args) throws Exception {
		File file = new File("E:/jdk-8u172-windows-x64.exe");
		Entry en = new Entry();
		en.setId(CryptoTool.MD5.encode(file, false).MD5);
		en.setName("jdk-8u172-windows-x64.exe");
		en.setAddress("C:/软件库/开发/java/jdk8/jdk-8u172-windows-x64.exe");
		en.setLength(file.length());
		en.setCreated(new Date(file.lastModified()));
		System.out.println(en.getId());
		System.out.println(en.getLength());
		System.out.println(context.getBean(EntryService.class).save(en));
	}
	public static void main2(String[] args) throws Exception {
		List<Entry> datas = new ArrayList<Entry>();
		EntryService service = context.getBean(EntryService.class);
		Entry en = new Entry();
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setAddress(null), en.setLength(null));
		en.setSqlQueryTerm(true, en.setName(null), Entry.Operation.Like, "jdk%");
		en.setSqlLeafTotal(service.count(en));
		en.setSqlLeafSize(500L);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Entry> temp = service.list(en);
			if (temp != null && temp.size() > 0) {
				datas.addAll(temp);
			}
		}
		Collections.sort(datas, new Comparator<Entry>() {
			public int compare(Entry o1, Entry o2) {
				String[] name1 = o1.getName().replace("_", "-").replace("jdk-6-", "jdk-6u0-").replace("jdk-7-", "jdk-7u0-").replace("jdk-8-", "jdk-8u0-").replace("jdk-9-", "jdk-9u0-").split("-")[1].split("u");
				String[] name2 = o2.getName().replace("_", "-").replace("jdk-6-", "jdk-6u0-").replace("jdk-7-", "jdk-7u0-").replace("jdk-8-", "jdk-8u0-").replace("jdk-9-", "jdk-9u0-").split("-")[1].split("u");
				int index1 = Integer.parseInt(name1[0]) * 1000 + Integer.parseInt(name1[1]);
				int index2 = Integer.parseInt(name2[0]) * 1000 + Integer.parseInt(name2[1]);
				if (index1 > index2) {
					return 1;
				} else if (index1 < index2){
					return -1;
				}
				return o1.getName().compareTo(o2.getName());
			}
		});
		for (Entry data : datas) {
			System.out.println(data.getName());
		}
	}
}