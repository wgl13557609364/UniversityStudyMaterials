package cn.fuchsine.dao.order;

import cn.fuchsine.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/13 16:02
 * @since 1.0.0
 */
public interface OrderMapper {
    List<Order> getOrderByUserId(Integer userid);
    int geIdrByOrderCode(String ordercode);
    Order geIdrByOrderCode1(String ordercode);
    int addOrder(Order order);

    int getOrderId(String orderCode);

    List<Order> getAllOrderByUserId();

    int addrimestatus(@Param("ordercode") String ordercode);

}
