package cn.fuchsine.service.userservice;

import cn.fuchsine.pojo.User;

public interface UserService {
    User Login(String loginName,String password);
}
