package cn.fuchsine.servlet.orderItem;

import cn.fuchsine.pojo.OrderItem;
import cn.fuchsine.service.orderitem.OrderItemServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/14 5:07
 * @since 1.0.0
 */
@WebServlet("/orderitem")
public class OrderItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String ordercode = req.getParameter("ordercode");
        OrderItemServiceImpl orderItemService = new OrderItemServiceImpl();
        List<OrderItem> orderList = orderItemService.getOrderListByCode(ordercode);
        req.getSession().setAttribute("orderList",orderList);
        resp.sendRedirect("jsp/orderItem.jsp");
    }
}
