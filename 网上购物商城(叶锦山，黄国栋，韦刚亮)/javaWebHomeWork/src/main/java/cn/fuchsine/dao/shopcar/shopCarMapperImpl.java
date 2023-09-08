package cn.fuchsine.dao.shopcar;

import cn.fuchsine.pojo.ShopCar;
import cn.fuchsine.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/8 4:51
 * @since 1.0.0
 */

public class shopCarMapperImpl implements ShopCarMapper {
    @Override
    public List<ShopCar> findShopCar(Integer id) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ShopCarMapper mapper = sqlSession.getMapper(ShopCarMapper.class);
        List<ShopCar> shopCar = mapper.findShopCar(id);
        sqlSession.close();
        return shopCar;
    }


    @Test
    public void er(){
        List<ShopCar> shopCar = findShopCar(1);
        for (ShopCar car : shopCar) {
            System.out.println(car);
        }
    }

    @Override
    public int addone(Integer userid, Integer articleid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ShopCarMapper mapper = sqlSession.getMapper(ShopCarMapper.class);
        int addone = mapper.addone(userid, articleid);
        sqlSession.commit();
        sqlSession.close();
        return addone;
    }

    @Override
    public int lowerone(Integer userid, Integer articleid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ShopCarMapper mapper = sqlSession.getMapper(ShopCarMapper.class);
        int lowerone = mapper.lowerone(userid,articleid);
        sqlSession.commit();
        sqlSession.close();
        return lowerone;
    }

    @Override
    public int deelete(Integer userid, Integer articleid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ShopCarMapper mapper = sqlSession.getMapper(ShopCarMapper.class);
        int deelete = mapper.deelete(userid, articleid);
        sqlSession.commit();
        sqlSession.close();
        return deelete;
    }
    @Test
    public void de(){
        int deelete = deelete(2, 5);
        System.out.println(deelete);
    }

    @Override
    public ShopCar selectByname(Integer userid, Integer articleid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ShopCarMapper mapper = sqlSession.getMapper(ShopCarMapper.class);
        ShopCar shopCar = mapper.selectByname(userid, articleid);
        sqlSession.close();
        return shopCar;
    }

    @Override
    public int addshopcar(ShopCar shopCar) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ShopCarMapper mapper = sqlSession.getMapper(ShopCarMapper.class);
        int addshopcar = mapper.addshopcar(shopCar);
        sqlSession.commit();
        sqlSession.close();
        return addshopcar;
    }

    @Override
    public int upData(Integer userid, Integer newByNum,Integer articleid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ShopCarMapper mapper = sqlSession.getMapper(ShopCarMapper.class);
        int i = mapper.upData(userid, newByNum,articleid);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Override
    public int deleteshopcar(Integer id) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ShopCarMapper mapper = sqlSession.getMapper(ShopCarMapper.class);
        int deleteshipcar = mapper.deleteshopcar(id);
        sqlSession.commit();
        sqlSession.close();
        return deleteshipcar;
    }


    @Test
    public void test(){
        ShopCar i = selectByname(1, 2);
        System.out.println(i);
    }
}
