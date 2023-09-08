package cn.fuchsine.servlet.buy;

import cn.fuchsine.pojo.User;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author fuchsine
 * @date 2022/10/19 2:12
 * @since 1.0.0
 */
@WebServlet("/WrtierUserServlet")
public class WrtierUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        User user = (User) req.getSession().getAttribute("user");
        Object toJSON = JSON.toJSON(user);
        resp.getWriter().write(toJSON.toString());
        System.out.println("进入了方法！");
    }
}
