package com.chen.housebiz.service;

import com.chen.housecommon.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
     boolean addAccount(User account);

     boolean enable(String key);

     User auth(String username,String password);

     List<User>getUserByQuery(User user);

     void updateUser(User updateUser,String email);

    User getUserById(Long id);

    User getUserByEmail(String email);



}
