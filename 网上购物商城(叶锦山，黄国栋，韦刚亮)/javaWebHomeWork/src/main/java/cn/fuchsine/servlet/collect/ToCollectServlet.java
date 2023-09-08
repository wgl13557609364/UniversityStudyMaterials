package cn.fuchsine.servlet.collect;

import cn.fuchsine.dao.collect.CollectMapperImpl;
import cn.fuchsine.pojo.Collect;
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
 * @date 2022/10/16 5:55
 * @since 1.0.0
 */
@WebServlet("/tocollect")
public class ToCollectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        CollectMapperImpl collectMapper = new CollectMapperImpl();
        List<Collect> collectList = collectMapper.getCollectByUserId(user.getId());
        for (Collect collect : collectList) {
            System.out.println(collect);
        }
        req.getSession().setAttribute("collectList",collectList);
        resp.sendRedirect("jsp/collect.jsp");
    }
}
