package cn.fuchsine.service.registerservice;

import cn.fuchsine.pojo.User;

public interface RegisterService {
    //注册页面得到的登录名和库中比对是否存在有该用户
    User getUserByUser(String username);

    //注册页面得到数据进行比对，看是否存在，然后录入数据库
    int NewUserAdd(String loginname,User user);
}
