package cn.fuchsine.service.registerservice;

import cn.fuchsine.dao.register.RegisterMapperImpl;
import cn.fuchsine.pojo.User;

public class RegisterServiceImpl implements RegisterService{
    @Override
    public User getUserByUser(String username) {
        RegisterMapperImpl registerMapper = new RegisterMapperImpl();
        User user = registerMapper.getUser(username);
        return user;
    }

    @Override
    public int NewUserAdd(String loginname, User user) {

        User user1 = getUserByUser(loginname);
        if(user1==null){
            //用户在数据库中不存在，可以录入
            RegisterMapperImpl registerMapper = new RegisterMapperImpl();
            int addsuer = registerMapper.addsuer(user);
            return 1;
        }else {
            //用户在数据库中存在，直接返回2；
            return 2;
        }
    }
}
