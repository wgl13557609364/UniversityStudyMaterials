package cn.fuchsine.servlet.order;

import cn.fuchsine.dao.order.OrderMapperImpl;
import cn.fuchsine.dao.orderltem.OrderItemMapperImpl;
import cn.fuchsine.pojo.Order;
import cn.fuchsine.pojo.OrderItem;
import cn.fuchsine.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/13 19:55
 * @since 1.0.0
 */
@WebServlet("/orderselect")
public class OrderSelect extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        OrderMapperImpl orderMapper = new OrderMapperImpl();
        OrderItemMapperImpl orderItemMapper = new OrderItemMapperImpl();
        List<Order> orderList = orderMapper.getOrderByUserId(user.getId());
        for (Order order : orderList) {
            List<OrderItem> orderItemList = orderItemMapper.getOrderItem(order.getId());
            order.setItems(orderItemList);
        }
        req.getSession().setAttribute("orderList",orderList);
        System.out.println(orderList.size());
        resp.sendRedirect("jsp/order.jsp");

    }
}
