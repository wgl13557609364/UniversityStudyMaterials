package cn.fuchsine.dao.register;

import cn.fuchsine.pojo.User;
import org.apache.ibatis.annotations.Param;


public interface RegisterMapperDao {
    User getUser(@Param("username") String username);
    int addsuer(User user);
}
