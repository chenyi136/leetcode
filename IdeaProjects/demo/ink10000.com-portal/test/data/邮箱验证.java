package data;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.xbill.DNS.Lookup;
import org.xbill.DNS.MXRecord;
import org.xbill.DNS.Record;
import org.xbill.DNS.Type;
public class 邮箱验证 {
	public static String host(String domain) throws Exception {
		Record[] temp = new Lookup(domain, Type.MX).run();
		if (temp == null || temp.length < 1) {
			return null;
		}
		
		List<Record> records = new ArrayList<Record>();
		Collections.addAll(records, temp);
		Collections.sort(records, new Comparator<Record>() {
			public int compare(Record o1, Record o2) {
				return ((MXRecord) o1).getPriority() > ((MXRecord) o1).getPriority() ? -1 : 1;
			}
		});
		
		for (Record record : records) {
			if (record != null) {
				return ((MXRecord) record).getTarget().toString();
			}
		}
		return null;
	}
	public static boolean verify(String host, String email) throws Exception {
		if (host == null || email == null) {
			return false;
		}
		Socket socket = new Socket();
		try {
			socket.connect(new InetSocketAddress(host, 25));
			BufferedReader reader = new BufferedReader(new InputStreamReader(new BufferedInputStream(socket.getInputStream())));
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
			if (verify(reader) != 220) {
				return false;
			}
			
			writer.write("HELO WORLD\r\n");
			writer.flush();
			if (verify(reader) != 250) {
				return false;
			}
			
			writer.write("MAIL FROM: <check@baidu.com>\r\n");
			writer.flush();
			if (verify(reader) != 250) {
				return false;
			}
			
			writer.write("RCPT TO: <" + email + ">\r\n");
			writer.flush();
			if (verify(reader) != 250) {
				return false;
			}
			
			writer.write("QUIT\r\n");
			writer.flush();
			socket.close();
		} finally {
			socket.close();
		}
		return true;
	}
	private static int verify(BufferedReader reader) throws Exception {
		for (long i = 1; i <= 10; i++) {
			Thread.sleep(50);
			if (reader.ready()) {
				String line = reader.readLine();
				System.out.println(line);
				return Integer.parseInt(line.substring(0, 3));
			}
		}
		return -1;
	}
}