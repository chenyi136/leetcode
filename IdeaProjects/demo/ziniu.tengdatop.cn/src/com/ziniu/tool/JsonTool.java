package com.ziniu.tool;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.mc.core.crux.Core;
/**
 * 工具层-JSON操作
 * @author 1138789752@qq.com
 * @version 2017-09-12 13:20:26
 * */
public final class JsonTool {
	/**
	 * 写入对象
	 * @param data 实体对象
	 * */
	public static String write(Object data) throws Exception {
		if (data == null) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		init(mapper);
		return mapper.writeValueAsString(data);
	}
	/**
	 * 写入对象
	 * @param data 实体对象
	 * @param os 出字节流
	 * */
	public static void write(Object data, OutputStream os) throws Exception {
		if (data == null || os == null) {
			return;
		}
		ObjectMapper mapper = new ObjectMapper();
		init(mapper);
		mapper.writeValue(os, data);
	}
	/**
	 * 写入对象
	 * @param data 实体对象
	 * @param file 目标文件
	 * */
	public static void write(Object data, File file) throws Exception {
		if (data == null || file == null) {
			return;
		}
		ObjectMapper mapper = new ObjectMapper();
		init(mapper);
		mapper.writeValue(file, data);
	}
	/**
	 * 读取对象
	 * @param json 对象数据
	 * @param clazz 对象类型
	 * */
	public static <T> T read(String json, Class<T> clazz) throws Exception {
		if (json == null || json.equals("") || clazz == null) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		init(mapper);
		return mapper.readValue(json, clazz);
	}
	/**
	 * 读取对象
	 * @param json 对象数据
	 * @param clazz 对象类型
	 * @param param 对象参数
	 * */
	public static Object read(String json, Class<?> clazz, Class<?>... param) throws Exception {
		if (json == null || json.equals("") || clazz == null || param == null || param.length < 1) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		init(mapper);
		return mapper.readValue(json, mapper.getTypeFactory().constructParametricType(clazz, param));
	}
	/**
	 * 读取对象
	 * @param is 入字节流
	 * @param type 对象类型
	 * */
	@SuppressWarnings("unchecked")
	public static <T> T read(InputStream is, JavaType type) throws Exception {
		if (is == null || type == null) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		init(mapper);
		return (T) mapper.readValue(is, type);
	}
	/**
	 * 读取对象
	 * @param is 入字节流
	 * @param clazz 对象类型
	 * */
	public static <T> T read(InputStream is, Class<T> clazz) throws Exception {
		if (is == null || clazz == null) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		init(mapper);
		return mapper.readValue(is, clazz);
	}
	/**
	 * 列出对象
	 * @param json 对象数据
	 * @param clazz 对象类型
	 * */
	public static <T> List<T> list(String json, Class<T> clazz) throws Exception {
		if (json == null || json.equals("") || !json.startsWith("[") || !json.endsWith("]")) {
			return new ArrayList<T>();
		}
		List<T> res = new ArrayList<T>();
		ObjectMapper mapper = new ObjectMapper();
		init(mapper);
		JsonNode root = mapper.readTree(json);
		for (int i = 0; i < root.size(); i++) {
			res.add(mapper.readValue(root.get(i).toString(), clazz));
		}
		return res;
	}
	/**
	 * 列出对象
	 * @param json 对象数据
	 * @param clazz 对象类型
	 * */
	public static <T> List<T> list(File file, Class<T> clazz) throws Exception {
		if (file == null || !file.exists() || !file.isFile() || !file.canRead()) {
			return new ArrayList<T>();
		}
		List<T> res = new ArrayList<T>();
		ObjectMapper mapper = new ObjectMapper();
		init(mapper);
		JsonNode root = mapper.readTree(file);
		for (int i = 0; i < root.size(); i++) {
			res.add(mapper.readValue(root.get(i).toString(), clazz));
		}
		return res;
	}
	/**
	 * 输出对象
	 * @param data 实体对象
	 * */
	public static String toString(Object data) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(SerializationFeature.INDENT_OUTPUT, true);
		return mapper.writeValueAsString(data);
	}
	/**
	 * 初始参数
	 * @param mapper 操作节点
	 * */
	private static void init(ObjectMapper mapper) {
		//未知属性
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		//空的对象
		mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
		//是否缩排
		mapper.configure(SerializationFeature.INDENT_OUTPUT, false);
		//日期处理
		mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
		//枚举处理
		mapper.configure(SerializationFeature.WRITE_ENUMS_USING_TO_STRING, false);
		//枚举顺序
		mapper.configure(SerializationFeature.WRITE_ENUMS_USING_INDEX, false);
		//字符数组
		mapper.configure(SerializationFeature.WRITE_CHAR_ARRAYS_AS_JSON_ARRAYS, true);
		//空的属性
		mapper.setSerializationInclusion(Include.NON_NULL);
		//空字符串
		mapper.setSerializationInclusion(Include.NON_EMPTY);
		//日期格式
		mapper.setDateFormat(new SimpleDateFormat(Core.SIMPLE_DATE_FORMAT));
		//空值处理
		/*mapper.getSerializerProvider().setNullValueSerializer(new JsonSerializer<Object>() {
			public void serialize(Object data, JsonGenerator generator, SerializerProvider provider) throws IOException, JsonProcessingException {
				generator.writeString("");
			}
		});*/
	}
}