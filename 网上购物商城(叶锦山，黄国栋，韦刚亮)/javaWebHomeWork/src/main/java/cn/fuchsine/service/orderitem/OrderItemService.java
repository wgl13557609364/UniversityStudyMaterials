package cn.fuchsine.service.orderitem;

import cn.fuchsine.pojo.OrderItem;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/14 4:57
 * @since 1.0.0
 */
public interface OrderItemService {
    List<OrderItem> getOrderListByCode(String ordercode);
}
