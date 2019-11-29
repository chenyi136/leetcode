package nio;

import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class FileChannelTxt {
    public static void main(String[] args) throws IOException {
        RandomAccessFile raf = new RandomAccessFile("niodata.txt", "rw");
        FileChannel inChannel = raf.getChannel();
//　　　　创建一个读数据缓冲区
        ByteBuffer buf = ByteBuffer.allocate(48);

        int bytesRead = inChannel.read(buf);
//        创建一个一个写数据缓冲区
        ByteBuffer buf2 = ByteBuffer.allocate(48);
//        写入数据
        buf2.put("filechannel test".getBytes());

        buf2.flip();
        inChannel.write(buf);
        while (bytesRead != -1) {
            System.out.println("read" + bytesRead);
            buf.flip();

            while (buf.hasRemaining()) {
                System.out.print((char) buf.get());

            }

            //清空缓存区
            buf.clear();
            bytesRead = inChannel.read(buf);
        }
        raf.close();
    }
}
