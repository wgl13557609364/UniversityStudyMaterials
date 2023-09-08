package cn.fuchsine.dao.orderltem;

import cn.fuchsine.pojo.OrderItem;
import cn.fuchsine.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/13 16:47
 * @since 1.0.0
 */
public class OrderItemMapperImpl implements OrderItemMapper{
    @Override
    public List<OrderItem> getOrderItem(Integer orderid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderItemMapper mapper = sqlSession.getMapper(OrderItemMapper.class);
        List<OrderItem> orderItem = mapper.getOrderItem(orderid);
        sqlSession.close();
        return orderItem;
    }

    @Override
    public int addOrderItem(Integer orderid, Integer articleid, Integer orderNum) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderItemMapper mapper = sqlSession.getMapper(OrderItemMapper.class);
        int i = mapper.addOrderItem(orderid, articleid, orderNum);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Test
    public void t(){
        List<OrderItem> orderItem = getOrderItem(3);
        for (OrderItem item : orderItem) {
            System.out.println(item);
        }

    }
}
