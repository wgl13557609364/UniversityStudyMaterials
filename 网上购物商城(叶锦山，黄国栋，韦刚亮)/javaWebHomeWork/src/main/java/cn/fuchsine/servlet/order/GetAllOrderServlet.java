package cn.fuchsine.servlet.order;

import cn.fuchsine.dao.order.OrderMapperImpl;
import cn.fuchsine.pojo.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/20 15:28
 * @since 1.0.0
 */
@WebServlet("/getallservlet")
public class GetAllOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderMapperImpl orderMapper = new OrderMapperImpl();
        List<Order> AllOrderList = orderMapper.getAllOrderByUserId();
        req.getSession().setAttribute("AllOrderList",AllOrderList);
        System.out.println(AllOrderList);
        resp.sendRedirect("jsp/mangerorder.jsp");
    }
}
