package nio;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class GetChannel {
    private static final int BSIZE=1024;

    public static void main(String[] args) throws IOException {
        FileChannel fc=new FileOutputStream("data.txt").getChannel();
//        通过Wrap 方法将数据存入ByteBuffer 中
        fc.write(ByteBuffer.wrap("Some text".getBytes()));
        fc.close();

//        add to the end of the file
        fc=new RandomAccessFile("data.txt","rw").getChannel();
        fc.position(fc.size());
        fc.write(ByteBuffer.wrap("some more".getBytes()));
        fc.close();

//        read the file

        fc=new FileInputStream("data.txt").getChannel();
        ByteBuffer buff=ByteBuffer.allocate(BSIZE);
//        通过read 向ByteBuffer 存储字节
        fc.read(buff);
        buff.flip();
        while(buff.hasRemaining())
            System.out.println((char)buff.get());


        }


}
