package cn.fuchsine.dao.orderltem;

import cn.fuchsine.pojo.OrderItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/13 16:47
 * @since 1.0.0
 */
public interface OrderItemMapper {
    List<OrderItem> getOrderItem(Integer orderid);
    int addOrderItem(@Param("orderid") Integer orderid, @Param("articleid") Integer articleid, @Param("orderNum") Integer orderNum);
}
