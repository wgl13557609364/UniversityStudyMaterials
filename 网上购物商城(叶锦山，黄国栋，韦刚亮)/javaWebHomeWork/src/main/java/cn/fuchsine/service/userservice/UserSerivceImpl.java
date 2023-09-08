package cn.fuchsine.service.userservice;

import cn.fuchsine.dao.user.UserImpl;
import cn.fuchsine.pojo.User;
import org.junit.Test;

public class UserSerivceImpl implements UserService{
    @Override
    public User Login(String loginName,String password) {
        UserImpl user1 = new UserImpl();
        User user = user1.getUserNameAndPasswordByUserName(loginName, password);
        return user;
    }
    @Test
    public void test(){
        User user = Login("admin", "123456");
        System.out.println(user);
    }
}
