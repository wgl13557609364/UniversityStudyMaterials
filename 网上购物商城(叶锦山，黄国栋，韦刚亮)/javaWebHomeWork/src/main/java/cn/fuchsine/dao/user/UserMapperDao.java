package cn.fuchsine.dao.user;

import cn.fuchsine.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapperDao {

    User getUserById( int id);

    User getUserNameAndPasswordByUserName(@Param("name") String name,@Param("password") String password);

    int UpdataUserMsg(@Param("name") String name,@Param("address") String address,@Param("phone") String phone,@Param("email") String email,@Param("userid") Integer userid);




}
