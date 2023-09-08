package cn.fuchsine.dao.user;

import cn.fuchsine.pojo.User;
import cn.fuchsine.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

/**
 * @author fuchsine
 * @date 2022/10/8 5:03
 * @since 1.0.0
 */
public class UserImpl implements UserMapperDao{
    @Override
    public User getUserById(int id) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        UserMapperDao mapper = sqlSession.getMapper(UserMapperDao.class);
        User user = mapper.getUserById(id);
        sqlSession.close();
        return user;
    }
    @Test
    public void test(){
        User user = getUserById(1);
        System.out.println(user);
    }

    @Override
    public User getUserNameAndPasswordByUserName(String name, String password) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        UserMapperDao mapper = sqlSession.getMapper(UserMapperDao.class);
        User user = mapper.getUserNameAndPasswordByUserName(name,password);
        sqlSession.close();
        return user;
    }

    @Override
    public int UpdataUserMsg(String name, String address, String phone, String email, Integer userid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        UserMapperDao mapper = sqlSession.getMapper(UserMapperDao.class);
        int i = mapper.UpdataUserMsg(name, address, phone, email, userid);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }
    @Test
    public void er(){
        int i = UpdataUserMsg("管理员admin", "桂林电北海校区", "153000001", "123232@qq.com", 1);
        System.out.println(i);
    }
}
