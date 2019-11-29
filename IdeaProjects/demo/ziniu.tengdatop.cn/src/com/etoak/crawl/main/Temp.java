package com.etoak.crawl.main;
import java.io.File;
import org.springframework.web.client.RestTemplate;
import com.etoak.crawl.page.HyperText;
public class Temp {
	public static void main(String[] args) throws Exception {
		RestTemplate template = new RestTemplate();
		HyperText page = new HyperText(template, "http://127.0.0.1:8088/ink10000.com-portal/_/my/i/face.jpg", new HyperText.Filter() {
			public boolean accept(String link, String media) {
				System.out.println(media);
				return true;
			}
		});
		System.out.println(page.store(new File("E:/")));
		System.out.println(HyperTextParser.query(page,"div[style=padding-top:20px;text-align:center;]").size());
	}
}