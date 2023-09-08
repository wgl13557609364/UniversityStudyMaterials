package cn.fuchsine.servlet.order;

import cn.fuchsine.dao.order.OrderMapperImpl;
import cn.fuchsine.pojo.Order;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author fuchsine
 * @date 2022/10/20 22:54
 * @since 1.0.0
 */
@WebServlet("/sendarticle")
public class SendArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderMapperImpl orderMapper = new OrderMapperImpl();
        String code = req.getParameter("code");
        int i = orderMapper.addrimestatus(code);
        if(i==1){
            resp.getWriter().write("ture");
        }else {
            resp.getWriter().write("false");
        }
    }
}
