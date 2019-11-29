package data;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.client.RestTemplate;
import com.ziniu.service.core.AnalyzeService;
import com.ziniu.service.core.HyperService;
import com.ziniu.template.HyperCrawler;
import com.ziniu.tool.JsonTool;
public class 单元测试 {
	private static final ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
	public static void main(String[] args) throws Exception {
		String agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36";
		HyperCrawler crawler = new com.ziniu.template.impl.NewsBaiduCrawler();
		crawler.init(context.getBean(RestTemplate.class), context.getBean(HyperService.class), context.getBean(AnalyzeService.class));
		//System.out.println(context.getBean(com.ziniu.service.core.MediaService.class).save(crawler.info()));
		System.out.println(JsonTool.write(crawler.work(10, 1, 1, agent, "你好")));
	}
}