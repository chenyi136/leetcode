package com.chen.houseweb.controller;

import com.chen.housebiz.service.UserService;
import com.chen.housecommon.model.User;
import com.chen.housecommon.result.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
    @Autowired
    private UserService userService;


    /**
     *  注册提交：１．注册验证　２发送邮件　３验证失败重定向注册界面
     *  注册页获取：根据account 对象为依据判断是否注册页获取请求
     *
     *
     *
     */

    @RequestMapping("accounts/register")
    public String accountsRegister(User account, ModelMap map){
        if(account==null||account.getName()==null){
            return "user/accounts/register";

        }
        //用户验证
        ResultMsg resultMsg=UserHelper.validate(account);
        if (resultMsg.isSuccess() && userService.addAccount(account)) {
            map.put("email", account.getEmail());
            return "/user/accounts/registerSubmit";
        } else {
            return "redirect:/accounts/register?" + resultMsg.asUrlParams();
        }
    }

}
