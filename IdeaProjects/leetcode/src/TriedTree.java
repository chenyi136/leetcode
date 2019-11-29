public class TriedTree {
    private TriedNode root;
    public TriedTree(){
        root=new TriedNode();
        root.val=' ';
    }

    public void insert (String word){
        TriedNode ws=root;
        for(int i=0;i<word.length();i++){
            char c=word.charAt(i);
            if(ws.children[c-'a']==null){
                ws.children[c-'a']=new TriedNode(c);
            }
            ws=ws.children[c-'a'];
        }
        ws.isWord=true;
    }

    public boolean search(String word){
        TriedNode ws=root;
        for(int i=0;i<word.length();i++){
            char c=word.charAt(i);
            if(ws.children[c-'a']==null) return false;
            ws=ws.children[c-'a'];
        }
        return ws.isWord;
    }

    public boolean startWith(String prefix){
        TriedNode ws=root;
        for(int i=0;i<prefix.length();i++){
            char c=prefix.charAt(i);
            if(ws.children[c-'a']==null) return false;
            ws=ws.children[c-'a'];
        }
        return true;
    }


}

class TriedNode{
    public char val;
    public boolean isWord;
    public TriedNode[] children=new TriedNode[26];

    public TriedNode(){}
    TriedNode(char c){
        TriedNode node=new TriedNode();
        node.val=c;
    }
}
