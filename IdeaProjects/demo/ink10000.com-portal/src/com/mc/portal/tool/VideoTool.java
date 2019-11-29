package com.mc.portal.tool;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;
import it.sauronsoftware.jave.VideoSize;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import com.mc.core.tool.FileTool;
/**
 * 工具层-视频操作
 * @author 1138789752@qq.com
 * @version 2017-10-30 13:16:31
 * */
public final class VideoTool {
	/**
	 * 视频检查
	 * @param root 视频路径
	 * @param prefix 路径前缀
	 * @param line 返回结果
	 * */
	public static void verify(File root, String prefix, StringBuffer line) throws Exception {
		if (root == null || !root.exists()) {
			line.append("[null]请求参数非法\n");
			return;
		}
		File[] temp;
		if (root.isDirectory()) {
			temp = root.listFiles();
			if (temp == null || temp.length < 1) {
				line.append("[" + root.getAbsolutePath().replace("\\", "/").replace(prefix, "") + "]请求参数非法\n");
				return;
			}
		} else {
			temp = new File[] { root };
		}
		List<File> files = Arrays.asList(temp);
		Collections.sort(files, new Comparator<File>() {
			public int compare(File o1, File o2) {
				if (o1.getName().compareTo(o1.getName()) > 0) {
					return -1;
				} else if (o1.getName().compareTo(o1.getName()) < 0) {
					return 1;
				}
				return 0;
			}
		});
		if (files.get(0).isFile()) {
			String[] start = null;
			line.append(prefix + "\n");
			for (File file : files) {
				String[] code = verify(file, prefix, start, line);
				if (start == null) {
					start = code;
				}
			}
			Thread.sleep(5000);
		} else {
			for (File file : files) {
				if (!file.isDirectory()) {
					line.append("[" + root.getAbsolutePath().replace("\\", "/").replace(prefix, "") + "]文件夹下要么全是文件夹，要么全是文件");
					return;
				}
				verify(file, prefix, line);
			}
		}
	}
	private static String[] verify(File file, String prefix, String[] start, StringBuffer line) {
		String name = file.getAbsolutePath().replace("\\", "/").replace(prefix, "");
		try {
			MultimediaInfo info = new Encoder().getInfo(file);
			VideoSize video = info.getVideo().getSize();
			long length = FileTool.length(null, file);
			String[] res = new String[] { FileTool.suffix(name)[1], String.valueOf(video.getWidth()), String.valueOf(video.getHeight()), FileTool.volume(length), new Long(length / info.getDuration()).toString(), new Long(info.getDuration() / (60 * 1000L)).toString() };
			line.append((start != null && (!res[0].equals(start[0]) || !res[1].equals(start[1]) || !res[2].equals(start[2])) ? "---" : "") + "[" + name + "]width=" + res[1] + ",height=" + res[2] + ",length=" + res[3] + ",rate=" + res[4] + ",track=" + res[5] + "\n");
			return res;
		} catch (Exception e) {
			line.append("---" + name + "\n");
			return new String[] { "", "", "" };
		}
	}
}