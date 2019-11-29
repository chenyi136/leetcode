package com.chen.houseweb.controller;

import com.chen.housecommon.model.User;
import com.chen.housecommon.result.ResultMsg;
import org.apache.commons.lang3.StringUtils;

public class UserHelper {
   public static ResultMsg validate(User accout){
       if (StringUtils.isBlank(accout.getEmail())) {
           return ResultMsg.errorMsg("Email 有误");
       }
       if (StringUtils.isBlank(accout.getName())) {
           return ResultMsg.errorMsg("Name 有误");
       }
       if (StringUtils.isBlank(accout.getConfirmPasswd()) || StringUtils.isBlank(accout.getPasswd())
               || !accout.getPasswd().equals(accout.getConfirmPasswd())) {
           return ResultMsg.errorMsg("Email 有误");
       }
       if (accout.getPasswd().length() < 6) {
           return ResultMsg.errorMsg("密码大于6位");
       }
       return ResultMsg.successMsg("");
   }
}
