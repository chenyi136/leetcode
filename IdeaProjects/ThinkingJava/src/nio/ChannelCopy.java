package nio;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

//利用Buffer读写数据，通常遵循四个步骤：
//        1．把数据写入buffer；
//
//        ２．调用flip；
//
//        ３．从Buffer中读取数据；
//
//        ４．调用buffer.clear()或者buffer.compact()

public class ChannelCopy {
    private static final int BSIZE=1024;

    public static void main(String[] args) throws Exception {
        if(args.length!=2){
            System.out.println("arguments: sourcefile destfile");
            System.exit(1);
        }
        FileChannel in=new FileInputStream(args[0]).getChannel(),
                out=new FileOutputStream(args[1]).getChannel();

        ByteBuffer buff=ByteBuffer.allocate(BSIZE);

        while(in.read(buff)!=-1){
            buff.flip();
            out.write(buff);
            buff.clear();
        }
    }
}
