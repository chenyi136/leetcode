package Mianjing;

public class TestIp {
    public boolean test_ip(String str) {
        if (str.length() < 7 || str.length() > 15) return false;
        // 2 尝试按.符号进行拆分     拆分结果应该是4段
        String[] arr = str.split(".");
        if (arr.length != 4) return false;
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < arr[i].length(); j++) {
                char temp = arr[i].charAt(j);
                if (!(temp > '0' && temp < '9')) return false;
            }
        }
        for (int i = 0; i < 4; i++) {
            int temp = Integer.parseInt(arr[i]);
            if (temp < 0 || temp > 255) return false;
        }
        return true;
    }
}
