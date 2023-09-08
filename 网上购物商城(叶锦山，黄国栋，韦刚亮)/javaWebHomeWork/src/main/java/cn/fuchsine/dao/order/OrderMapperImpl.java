package cn.fuchsine.dao.order;

import cn.fuchsine.pojo.Order;
import cn.fuchsine.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/13 16:02
 * @since 1.0.0
 */
public class OrderMapperImpl implements OrderMapper{
    @Override
    public List<Order> getOrderByUserId(Integer userid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        List<Order> orderList = mapper.getOrderByUserId(userid);
        sqlSession.close();
        return orderList;
    }

    @Override
    public int geIdrByOrderCode(String ordercode) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        int i = mapper.geIdrByOrderCode(ordercode);
        sqlSession.close();
        return i;
    }

    @Override
    public Order geIdrByOrderCode1(String ordercode) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        Order order = mapper.geIdrByOrderCode1(ordercode);
        sqlSession.close();
        return order;
    }
    @Test
    public void hua(){
        System.out.println(geIdrByOrderCode1("OP-201812141828491"));
    }

    @Override
    public int addOrder(Order order) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        int i = mapper.addOrder(order);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Override
    public int getOrderId(String orderCode) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        int orderId = mapper.getOrderId(orderCode);
        sqlSession.close();
        return orderId;
    }

    @Override
    public List<Order> getAllOrderByUserId() {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        List<Order> allOrder = mapper.getAllOrderByUserId();
        sqlSession.close();
        return allOrder;
    }

    @Override
    public int addrimestatus(String ordercode) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        int addrimestatus = mapper.addrimestatus(ordercode);
        sqlSession.commit();
        sqlSession.close();
        return addrimestatus;
    }
    @Test
    public void yh(){
        int addrimestatus = addrimestatus("OP-201812141828491");
        System.out.println(addrimestatus);
    }


    @Test
    public void t(){
        System.out.println(getOrderId("OP-201812141828491"));
    }
}
