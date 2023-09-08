package cn.fuchsine.servlet.shopcar;

import cn.fuchsine.dao.shopcar.shopCarMapperImpl;
import cn.fuchsine.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author fuchsine
 * @date 2022/10/12 1:48
 * @since 1.0.0
 */
@WebServlet("/delete")
public class Deleteone extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int articleid = Integer.parseInt(req.getParameter("articleid"));
        shopCarMapperImpl shopCarMapper = new shopCarMapperImpl();
        int test = shopCarMapper.deelete(user.getId(),articleid);

    }
}
