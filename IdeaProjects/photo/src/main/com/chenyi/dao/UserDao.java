package main.com.chenyi.dao;

import main.com.chenyi.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    /**如果查询到该用户就会返回1
     * @param username,pwd
     * @return数据库被修改的行数
     */
    User getUserByName(@Param("username") String username, @Param("pwd") String pwd);
}
