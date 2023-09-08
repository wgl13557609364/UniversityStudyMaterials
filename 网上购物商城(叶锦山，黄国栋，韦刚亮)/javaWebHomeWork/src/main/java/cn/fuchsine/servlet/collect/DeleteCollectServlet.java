package cn.fuchsine.servlet.collect;

import cn.fuchsine.dao.collect.CollectMapperImpl;
import cn.fuchsine.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author fuchsine
 * @date 2022/10/18 5:11
 * @since 1.0.0
 */
@WebServlet("/deletecollect")
public class DeleteCollectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        int articleid = Integer.parseInt(req.getParameter("articleid"));
        User user = (User) req.getSession().getAttribute("user");
        CollectMapperImpl collectMapper = new CollectMapperImpl();
        int i = collectMapper.deletecollect(articleid, user.getId());
        if(i==1){
            resp.getWriter().write("true");
        }else {
            resp.getWriter().write("false");
        }
    }
}
