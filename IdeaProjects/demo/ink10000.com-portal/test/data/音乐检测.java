package data;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.mc.core.entity.blog.Music;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.blog.MusicService;
import com.mc.core.service.file.EntryService;
import com.mc.portal.crux.Global;
public class 音乐检测 {
	public static void title(EntryService entryService, MusicService musicService) throws Exception {
		StringBuffer state = new StringBuffer();
		Music en = new Music();
		en.setSqlQueryField(en.setId(null), en.setName(null));
		en.setSqlLeafTotal(musicService.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			Map<String, String> cache = new HashMap<String, String>();
			List<Music> datas = musicService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Music data : datas) {
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
						if (!data.getName().startsWith(name)) {
							state.append(",'" + data.getId() + "'");
						}
					}
				}
			}
		}
		System.out.println(state);
	}
}