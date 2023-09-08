package cn.fuchsine.service.orderitem;

import cn.fuchsine.dao.order.OrderMapperImpl;
import cn.fuchsine.dao.orderltem.OrderItemMapperImpl;
import cn.fuchsine.pojo.OrderItem;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/14 5:03
 * @since 1.0.0
 */
public class OrderItemServiceImpl implements OrderItemService{
    @Override
    public List<OrderItem> getOrderListByCode(String ordercode) {
        OrderMapperImpl orderMapper = new OrderMapperImpl();
        OrderItemMapperImpl orderItemMapper = new OrderItemMapperImpl();
        int i = orderMapper.geIdrByOrderCode(ordercode);
        return orderItemMapper.getOrderItem(i);
    }
}
