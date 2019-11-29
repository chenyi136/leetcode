import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class CourseSchedule {
    public static boolean canFinish(int numCourses, int[][] prerequisites) {
        ArrayList[] graph = new ArrayList[numCourses];
//       用邻接表构建图
        for(int i=0;i<numCourses;i++){
            graph[i]=new ArrayList();
        }
        boolean[] marked=new boolean[numCourses];
        for(int i=0;i<prerequisites.length;i++){
            graph[prerequisites[i][0]].add(prerequisites[i][1]);
        }
//  寻找有向环

        for(int v=0;v<numCourses;v++){
             if(!dfs(graph,v,marked))
                    return false;
        }
//        return dfs(graph,0,marked);
        return true;

    }

    private static boolean dfs(ArrayList[] graph, int v,boolean[] marked) {
        if(marked[v]) return false;
        marked[v]=true;
        for(int i=0;i<graph[v].size();i++){
//            if(!marked[(int)graph[v].get(i)]) dfs(graph,(int)graph[v].get(i),marked);
//            else return false;
            if(!dfs(graph,(int)graph[v].get(i),marked)) return false;
        }
        marked[v]=false;
        return true;

    }
    public static void main(String[] args) {
        int numCourses=4;
        int[][] pre=new int[][]{{2,0},{1,0},{3,1},{3,2},{1,3}};
        System.out.println(canFinish(numCourses,pre));
    }


}
