package cn.fuchsine.servlet.shopcar;

import cn.fuchsine.dao.shopcar.shopCarMapperImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author fuchsine
 * @date 2022/10/12 1:45
 * @since 1.0.0
 */
@WebServlet("/lowerone")
public class loweraone extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userid = Integer.parseInt(req.getParameter("userid"));
        int articleid = Integer.parseInt(req.getParameter("articleid"));
        shopCarMapperImpl shopCarMapper = new shopCarMapperImpl();
        int lowerone = shopCarMapper.lowerone(userid, articleid);
    }
}
