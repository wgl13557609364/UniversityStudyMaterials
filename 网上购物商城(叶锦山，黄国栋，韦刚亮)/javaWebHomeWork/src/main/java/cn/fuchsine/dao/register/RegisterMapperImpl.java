package cn.fuchsine.dao.register;

import cn.fuchsine.pojo.User;
import cn.fuchsine.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;


public class RegisterMapperImpl implements RegisterMapperDao {
    @Override
    public User getUser(String username) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        RegisterMapperDao mapper = sqlSession.getMapper(RegisterMapperDao.class);
        User user = mapper.getUser(username);
        sqlSession.close();
        return user;
    }

    @Override
    public int addsuer(User user) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        RegisterMapperDao mapper = sqlSession.getMapper(RegisterMapperDao.class);
        int addsuer = mapper.addsuer(user);
        sqlSession.commit();
        return addsuer;
    }

    @Test
    public void test(){
        User admin = getUser("admin");
        System.out.println(admin);
    }
    @Test
    public void test2(){
        User user = new User();
        user.setLoginName("tegwadaeftqq@qq.com");
        user.setPassword("1234567");
        user.setSex(1);
        user.setPhone("2312141243");
        user.setAddress("北海市桂林电子科技大学北海校区");
        user.setEmail("fwfw");
        int addsuer = addsuer(user);
        if(addsuer==1){
            System.out.println("录入成功！");
        }else {
            System.out.println("录入失败！");
        }
    }
}
