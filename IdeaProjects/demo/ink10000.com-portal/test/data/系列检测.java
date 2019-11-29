package data;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.mc.core.entity.blog.Catena;
import com.mc.core.entity.blog.Movie;
import com.mc.core.entity.blog.Player;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.blog.CatenaService;
import com.mc.core.service.blog.MovieService;
import com.mc.core.service.blog.PlayerService;
import com.mc.core.service.file.EntryService;
import com.mc.core.tool.JsonTool;
import com.mc.portal.crux.Global;
public class 系列检测 {
	public static void main1(String[] args) {
		String[] keys = new String[] { "电视", "动画", "纪录", "综艺" };
		for (String key : keys) {
			File[] parants = new File("F:/视频库/" + key + "/").listFiles();
			for (File parant : parants) {
				File[] files = parant.listFiles();
				if (files.length == 1 && files[0].isDirectory()) {
					System.out.println("只有一部" + key + "：" + parant.getName());
				}
			}
			
			int count = 0;
			for (File parant : parants) {
				File[] files = parant.listFiles();
				int temp = 0;
				for (File file : files) {
					if (file.isDirectory()) {
						temp++;
					}
				}
				count += temp > 0 ? temp : 1;
			}
			System.out.println(key + "总共部数：" + count + "\n");
		}
	}
	public static void main(String[] args) {
		File[] areas = new File("F:/视频库/外剧/").listFiles();
		for (File area : areas) {
			File[] parants = area.listFiles();
			for (File parant : parants) {
				File[] files = parant.listFiles();
				if (files.length == 1 && files[0].isDirectory()) {
					System.out.println("只有一部外剧：" + parant.getName());
				}
			}
		}
		
		int count = 0;
		for (File area : areas) {
			File[] parants = area.listFiles();
			for (File parant : parants) {
				File[] files = parant.listFiles();
				int temp = 0;
				for (File file : files) {
					if (file.isDirectory()) {
						temp++;
					}
				}
				count += temp > 0 ? temp : 1;
			}
		}
		System.out.println("外剧总共部数：" + count);
	}
	public static void brief(CatenaService service) throws Exception {
		StringBuffer state = new StringBuffer();
		Catena en = new Catena();
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setBrief(null));
		en.setSqlQueryTerm(true, en.setBrief(null), Catena.Operation.Like, "%\n%");
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		List<Catena> datas = service.list(en);
		for (Catena data : datas) {
			String[] items = data.getBrief().split("\n");
			for (String item : items) {
				if (!item.startsWith("　　")) {
					state.append("\n" + data.getName());
					break;
				}
			}
		}
		System.out.println(state);
	}
	public static void image(CatenaService catenaService) throws Exception {
		StringBuffer state = new StringBuffer("【系列海报检测】");
		Catena en = new Catena();
		en.setFinish(true);
		en.setSqlQueryField(en.setId(null), en.setName(null));
		en.setSqlQueryTerm(true, en.setType(null), Catena.Operation.NotEqualTo, "CINE");
		en.setSqlLeafTotal(catenaService.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		
		List<String> cache = new ArrayList<String>();
		String root = "C:/Users/Administrator/Workspaces/MyEclipse 2016/ink10000.com-portal/WebRoot/data/player/poster/";
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Catena> datas = catenaService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Catena data : datas) {
					if (new File(root + data.getId() + ".jpg").exists()) {
						cache.add(data.getId() + ".jpg");
					} else {
						state.append("\n缺少：" + data.getName());
					}
				}
			}
		}
		
		String[] files = new File(root).list();
		for (String file : files) {
			if (!cache.contains(file)) {
				state.append("\n删除：" + file);
			}
		}
		System.out.println(state);
	}
	public static void title(EntryService entryService, PlayerService playerService) throws Exception {
		//SELECT * FROM `file_entry` WHERE address NOT LIKE CONCAT('%/', name)
		StringBuffer state = new StringBuffer();
		Player en = new Player();
		en.setSqlQueryField(en.setId(null), en.setName(null));
		en.setSqlLeafTotal(playerService.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			Map<String, String> cache = new HashMap<String, String>();
			List<Player> datas = playerService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Player data : datas) {
					cache.put(data.getId(), data.getName());
				}
				
				Entry entry = new Entry();
				entry.setSqlQueryField(entry.setId(null), entry.setName(null));
				entry.setSqlQueryIn(true, entry.setId(null), true, cache.keySet().toArray(new String[] {}));
				entry.setSqlLeafSize(new Long(cache.size()));
				List<Entry> entrys = entryService.list(entry);
				if (entrys != null && entrys.size() > 0) {
					for (Entry data : entrys) {
						String name = cache.get(data.getId());
						if (!data.getName().equals(name)) {
							state.append(",'" + data.getId() + "'");
						}
					}
				}
			}
		}
		System.out.println(state);
	}
	public static void total(EntryService entryService, CatenaService catenaService, MovieService movieService, PlayerService playerService, String type) throws Exception {
		final String ROOT = Arrays.asList("TELE", "TRUE", "WARD").contains(type) ? "F:" : "G:";
		final Map<Integer, Long> OFFER = new HashMap<Integer, Long>(){
			private static final long serialVersionUID = 1L;
			{
				super.put(231, 1L);
				super.put(256, 16L);
				super.put(293, 1L);
				super.put(309, 1L);
				super.put(336, 1L);
				super.put(337, 1L);
				super.put(483, 1L);
			}
		};
		
		StringBuffer state = new StringBuffer("【系列总数检测】物理文件、系列信息、视频信息");
		long[] total = new long[] { 0, 0, 0, 0, 0 };
		Catena en = new Catena();
		en.setType(type);
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setAddress(null), en.setTotal(null));
		en.setSqlLeafTotal(catenaService.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Catena> datas = catenaService.list(en);
			if (datas != null && datas.size() > 0) {
				if (type.equals("CINE")) {
					for (Catena data : datas) {
						Movie movie = new Movie();
						movie.setFkCatena(data.getId());
						long temp = movieService.count(movie);
						if (temp != data.getTotal()) {
							state.append("\n" + data.getName() + "：NULL、" + data.getTotal() + "、" + temp);
						}
						total[1] += data.getTotal();
						total[2] += temp;
					}
					continue;
				}
				
				for (Catena data : datas) {
					long file = 0;
					long fake = 0;
					if (type.equals("REST")) {
						if (!data.getAddress().endsWith("/") && !data.getAddress().endsWith(".zip")) {
							state.append("\n路径格式错误：" + data.getName());
							continue;
						}
						
						File parent = new File(ROOT + data.getAddress().replace(".zip", "/"));
						if (parent.exists() && parent.isDirectory()) {
							file = parent.list().length;
						}
					} else {
						if (!data.getAddress().endsWith("/")) {
							state.append("\n路径格式错误：" + data.getName());
							continue;
						}
						
						File parent = new File(ROOT + data.getAddress());
						if (parent.exists() && parent.isDirectory()) {
							File[] files = parent.listFiles();
							String name = files[0].getName();
							if (name.startsWith("虚拟硬盘=")) {
								int key = Integer.parseInt(files[0].getName().replace("虚拟硬盘=", ""));
								if (key != data.getId()) {
									state.append("\n文件名称错误：" + name + "、" + data.getName());
									continue;
								}
								String path = new String(Files.readAllBytes(Paths.get(files[0].toURI())), "UTF-8");
								if (!data.getAddress().equals(path)) {
									state.append("\n存储路径错误：" + name + "、" + data.getName());
									continue;
								}
								Entry entry = new Entry();
								entry.setTray("A:");
								entry.setSqlQueryTerm(true, entry.setAddress(null), Entry.Operation.Like, path + "%");
								if (entryService.count(entry) != data.getTotal()) {
									state.append("\n虚拟个数错误：" + name + "、" + data.getName());
									continue;
								}
								file = 1;
								fake = data.getTotal() - 1;
							} else {
								file = files.length;
							}
						}
					}
					
					Long offer = OFFER.get(data.getId());
					if (offer == null) {
						offer = 0L;
					}
					Player player = new Player();
					player.setFkCatena(data.getId());
					long temp = playerService.count(player);
					if (file + fake != temp || file + fake != data.getTotal() - offer) {
						state.append("\n" + data.getName() + "：" + file + (fake > 0 ? "+" + fake : "") + "、" + data.getTotal() + (offer > 0 ? "-" + offer : "") + "、" + temp);
					}
					total[0] += file;
					total[1] += data.getTotal();
					total[2] += temp;
					total[3] += fake;
					total[4] += offer;
				}
			}
		}
		state.append("\n总数：" + total[0] + (total[3] > 0 ? "+" + total[3] : "") + "、" + total[1] + (total[4] > 0 ? "-" + total[4] : "") + "、" + total[2]);
		System.out.println(state);
	}
	public static void word(CatenaService catenaService) throws Exception {
		StringBuffer state = new StringBuffer();
		Catena en = new Catena();
		en.setSqlQueryField(en.setStyle(null));
		en.setSqlQueryTerm(true, en.setStyle(null), Catena.Operation.NotEqualTo, "");
		en.setSqlQueryNull(true, en.setStyle(null), true);
		en.setSqlLeafTotal(catenaService.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Catena> datas = catenaService.list(en);
			for (Catena data : datas) {
				String[] items = JsonTool.read(data.getStyle(), String[].class);
				for (String item : items) {
					if (state.indexOf("," + item) == -1) {
						state.append("," + item);
					}
				}
			}
		}
		
		state.append("\n");
		en = new Catena();
		en.setSqlQueryField(en.setZone(null));
		en.setSqlQueryTerm(true, en.setZone(null), Catena.Operation.NotEqualTo, "");
		en.setSqlQueryNull(true, en.setZone(null), true);
		en.setSqlLeafTotal(catenaService.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Catena> datas = catenaService.list(en);
			for (Catena data : datas) {
				String[] items = JsonTool.read(data.getZone(), String[].class);
				for (String item : items) {
					if (state.indexOf("," + item) == -1) {
						state.append("," + item);
					}
				}
			}
		}
		System.out.println(state);
	}
}