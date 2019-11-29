import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class CourseSchedule2 {
    public static int[] findOrder(int numCourses, int[][] prerequisites) {
        List<List<Integer>> linkGraph=new ArrayList<>(numCourses);
        int[] counts=new int[numCourses];
        initialGraph(prerequisites,linkGraph,counts);
        return BFS( numCourses,linkGraph,counts);
    }


    public static void initialGraph(int[][] prerequisites,List<List<Integer>> linkGraph,int[] counts){
        int n=counts.length;
        while(n-->0){
            linkGraph.add(new ArrayList<>());
        }
        for(int[] adj:prerequisites){
            counts[adj[0]]++;

            linkGraph.get(adj[1]).add(adj[0]);
        }
    }

//    先将一个入度为0的节点存入队列，当队列不为空出队列，读出该点，并将以该点的边的入度减1,当有入度为0 的点，继续入队列
//    拓扑排序就是顶点出队的序列
//    当拓扑序列个数等于课程数则说明能全部修完课程，并输出该拓扑序列，如果不能，则序列清零
    public static int[] BFS(int numsCourses,List<List<Integer>> linkGraph,int[] counts){
        int[] order=new int[numsCourses];
        Queue<Integer> que=new LinkedList<>();
        for(int i=0;i<numsCourses;i++){
            if(counts[i]==0)
                que.offer(i);
        }
        int k=0;
        while(!que.isEmpty()){
            int from=que.poll();
            order[k++]=from;
            for(int to:linkGraph.get(from)){
                counts[to]--;
                if(counts[to]==0){
                    que.offer(to);
                }
            }
        }

        return k==numsCourses?order:new int[0];

    }

    public static void main(String[] args) {
        int[][] nums={{1,0},{0,1}};
        int[]order=findOrder(2, nums);
        for(int i:order){
            System.out.println(i);
        }
    }
}
