package io;

import java.io.File;
import java.io.FilenameFilter;
import java.net.FileNameMap;
import java.util.regex.Pattern;

public class DirList {
    public static void main(String[] args) {
        File path=new File(".");
        String[] list;
        if(args.length==0) list=path.list();
        else list=path.list(new DirFilter(args[0]));
    }
}

class DirFilter implements FilenameFilter{
    private Pattern pattern;
    public DirFilter(String regex){
        pattern=Pattern.compile(regex);
    }
    @Override
    public boolean accept(File dir, String name) {
        return pattern.matcher(name).matches();
    }
}
