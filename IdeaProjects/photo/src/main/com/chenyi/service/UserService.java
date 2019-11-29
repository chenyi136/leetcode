package main.com.chenyi.service;

import main.com.chenyi.entity.User;

public interface UserService {

    /**
     * Created by Elric on 2017/3/24.
     */

        /**本次中我们只需要对用户身份做出判断然后给予url
         * @return 数据库查询到为1
         */
        User CheckUser(String username, String pwd);
}
