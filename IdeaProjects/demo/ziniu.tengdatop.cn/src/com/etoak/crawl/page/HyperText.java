package com.etoak.crawl.page;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.mozilla.universalchardet.UniversalDetector;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.client.ResponseExtractor;
import org.springframework.web.client.RestTemplate;
public class HyperText {
	private String link;
	private byte[] data;
	private String body;
	private String media;
	private String encode;
	private Document root;
	/**
	 * 构造方法
	 * */
	public HyperText() {}
	/**
	 * 构造方法
	 * @param link 请求地址
	 * @param data 原始数据
	 * */
	public HyperText(String link, byte[] data) throws Exception {
		this.link = link;
		this.data = data;
		this.body = new String(data, encode);
		this.encode = this.guess(data);
	}
	/**
	 * 构造方法
	 * @param link 请求地址
	 * @param body 文本数据
	 * @param encode 数据编码
	 * */
	public HyperText(String link, String body, String encode) throws Exception {
		this.link = link;
		this.data = body.getBytes(encode);
		this.body = body;
		this.encode = encode;
	}
	/**
	 * 构造方法
	 * @param link 请求地址
	 * @param data 原始数据
	 * @param body 文本数据
	 * @param media 媒体类型
	 * @param encode 数据编码
	 * */
	public HyperText(String link, byte[] data, String body, String media, String encode) throws Exception {
		if (data == null && body == null) {
			throw new Exception("Request parameter unlawfully.");
		}
		if (data != null && body == null) {
			body = new String(data, encode);
		}
		this.link = link;
		this.data = data != null ? data : body.getBytes(encode);
		this.body = body;
		this.media = media;
		this.encode = encode;
	}
	/**
	 * 构造方法
	 * @param template 远调接口
	 * @param link 请求地址
	 * */
	public HyperText(RestTemplate template, final String link) throws Exception {
		this(template, link, new Filter() {
			public boolean accept(String link, String media) {
				return true;
			}
		});
	}
	/**
	 * 构造方法
	 * @param template 远调接口
	 * @param link 请求地址
	 * @param filter 过滤回调
	 * */
	public HyperText(RestTemplate template, final String link, final Filter filter) throws Exception {
		template.execute(link, HttpMethod.GET, null, new ResponseExtractor<byte[]>() {
			public byte[] extractData(ClientHttpResponse response) throws IOException {
				MediaType media = response.getHeaders().getContentType();
				HyperText.this.link = link;
				HyperText.this.media = media.toString();
				if (!filter.accept(HyperText.this.link, HyperText.this.media)) {
					return null;
				}
				InputStream is = response.getBody();
				byte[] data = new byte[is.available()];
				is.read(data);
				is.close();
				HyperText.this.encode = media.getCharset() != null ? media.getCharset().name() : HyperText.this.guess(data);
				HyperText.this.data = data;
				HyperText.this.body = new String(HyperText.this.data, HyperText.this.encode);
				return data;
			}
		});
	}
	/**
	 * 构造方法
	 * @param template 远调接口
	 * @param link 请求地址
	 * @param encode 数据编码
	 * */
	public HyperText(RestTemplate template, String link, String encode) throws Exception {
		this.link = link;
		this.data = template.getForObject(link, byte[].class);
		this.body = new String(this.data, encode);
		this.encode = encode;
	}
	/**
	 * 请求地址
	 * */
	public String getLink() {
		return link;
	}
	/**
	 * 原始数据
	 * */
	public byte[] getData() {
		return data;
	}
	/**
	 * 文本数据
	 * */
	public String getBody() {
		return body;
	}
	/**
	 * 媒体类型
	 * */
	public String getMedia() {
		return media;
	}
	/**
	 * 数据编码
	 * */
	public String getEncode() {
		return encode;
	}
	/**
	 * 解析节点
	 * */
	public Document getRoot() {
		if (root == null) {
			root = Jsoup.parse(body, link);
		}
		return root;
	}
	/**
	 * 本地存储
	 * @param parent 父级目录
	 * */
	public File store(File parent) throws Exception {
		if (parent == null) {
			parent = new File(Class.class.getClass().getResource("/").getPath(), "temp");
			if (!parent.exists() || !parent.isDirectory()) {
				parent.mkdirs();
			}
		}
		String name = link.replace("https://", "http://").substring(7);
		if (media == null) {
			name = name.replaceAll("[\\?/:*|<>\"]", "_") + ".html";
		} else {
			if (media.indexOf("html") != -1) {
				name = name.replaceAll("[\\?/:*|<>\"]", "_") + ".html";
			} else {
				name = name.replaceAll("[\\?/:*|<>\"]", "_") + "." + media.substring(media.lastIndexOf("/") + 1);
			}
		}
		File res = new File(parent, name);
		FileOutputStream fis = new FileOutputStream(res);
		fis.write(data);
		fis.flush();
		fis.close();
		return res;
	}
	private String guess(byte[] data) {
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
	public static interface Filter {
		public boolean accept(String link, String media);
	}
}