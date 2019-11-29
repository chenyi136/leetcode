import java.util.*;

public class Wordladdle {
    public boolean canTransform(String word1, String word2){
        for(int i = 0, count=0 ; i<word1.length() ; i++){
            if(word1.charAt(i)!=word2.charAt(i) && ++count>1) return false;
        }
        return true;
    }

    public int ladderLength(String beginWord, String endWord, List<String> wordList){
        Queue<String> q = new LinkedList<String>();
        q.add(beginWord);
        int steps = 0;
        while(!q.isEmpty()){
            int size = q.size();
            for(int i = 0 ;i<size ; i++){
                String temp = q.poll();
                if(temp.equals(endWord)){return steps+1;}

//                for(String str:wordList){
//                    if(canTransform(str,temp)){
//                        wordList.remove(str);
//                        q.offer(str);
//                    }
//                }
                for(Iterator<String> iterator = wordList.iterator() ; iterator.hasNext();){
                    String current = iterator.next();
                    if(canTransform(current, temp)){
                        iterator.remove();
                        q.offer(current);
                    }
                }
            }
            steps++;

        }
        return 0;
    }
}
