package main.com.chenyi.dao;

import main.com.chenyi.entity.Picture;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PictureDao {
    /**
     * @return 返回所有图片
     */
    List<Picture> getAllPictures();

    /**上传图片，并且将图片名，图片描述信息插入数据库
     * @param picName
     * @param content
     * @return插入成功返回1，失败0
     */
    int InsertPicture(@Param("picName") String picName, @Param("content") String content);

}
