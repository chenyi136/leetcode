public class n2 {
    public String replaceSpace(StringBuffer str) {
        int originLength = str.length() - 1;
        int numberOfBlank = 0;
        for (char c : str.toString().toCharArray()) {
            if (c == ' '){
                numberOfBlank++;
            }

        }

        int newLength = originLength + 1 + numberOfBlank * 2;
        str.setLength(newLength);
        newLength = newLength - 1;
        while (originLength >= 0 && newLength > originLength) {
                if (str.charAt(originLength) == ' ') {
                    str.setCharAt(newLength--, '0');
                    str.setCharAt(newLength--, '2');
                    str.setCharAt(newLength--, '%');
                } else {
                    str.setCharAt(newLength--, str.charAt(originLength));
                }
                originLength--;
            }
            return str.toString();
        }
    
}
