package data;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
public class Temp {
	public static void main1(String[] args) {
		String root = "E:/ckxx/";
		File[] files = new File(root).listFiles();
		for (File file : files) {
			if (file.getName().indexOf("2017062") != -1) {
				file.renameTo(new File(root + file.getName().replace("2017062", "2018062")));
			}
		}
	}
	public static void main2(String[] args) throws Exception {
		//System.out.println(new RestTemplate().getForObject("http://www.baidu.com/s?tn=ichuner&lm=-1&word="+URLEncoder.encode("你好","gb2312")+"&rn=100", String.class));
		//System.out.println(new RestTemplate().getForObject("http://www.baidu.com/s?wd=%E7%99%BE%E5%BA%A6%E6%90%9C%E7%B4%A2%E6%8E%A5%E5%8F%A3&rsv_spt=1&rsv_iqid=0xec809d0e000138f8&issp=1&f=8&rsv_bp=0&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_enter=1&rsv_sug3=3&rsv_sug1=3&rsv_sug7=100&rsv_t=f9f0RqKlS0VbcWzMgYa%2BJaBXoPD11pWsHOKVP2j%2F1KF89aST7wHq3q7FUr2YX1z6zB9P&rsv_sug2=0&inputT=33825&rsv_sug4=33825", String.class));
		System.out.println(new RestTemplate().getForObject("http://news.baidu.com/ns?tn=news&word=43人中国旅行团护照在瑞典被抢", String.class));
	}
	public static void main3(String[] args) throws Exception {
		String key = "你好";
		StringBuilder sb=new StringBuilder();  
		//String path="http://news.baidu.com/ns?word=你好&tn=newsrss&sr=0&cl=2&rn=20&ct=0";  
		String path="http://news.baidu.com/";  
		URL url=new URL(path);  
		BufferedReader breader=new BufferedReader(new InputStreamReader(url.openStream()));  
		String line=null;  
		while((line=breader.readLine())!=null) {
			sb.append(line);
		}
		System.out.println("抓取结果：");
		System.out.println(sb.toString());
	}
	public static void main(String[] args) {
		//:
		String agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36";
		String link = "http://news.baidu.com/ns?word=你好&tn=news&from=news&cl=undefined&rn=20&ct=1&oq=nih&f=3&rsp=0";
		HttpHeaders header = new HttpHeaders();
		header.add("User-Agent", agent);
		HttpEntity<String> requestEntity = new HttpEntity<String>(null, header);
		ResponseEntity<String> response = new RestTemplate().exchange(link, HttpMethod.GET, requestEntity, String.class);
		System.out.println(response.getBody());
	}
}