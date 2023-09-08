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

/**
 * @author fuchsine
 * @date 2022/10/16 4:25
 * @since 1.0.0
 */
@WebServlet("/selectCollect")
public class selectCollectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int articleid = Integer.parseInt(req.getParameter("articleid"));
        CollectMapperImpl collectMapper = new CollectMapperImpl();
        Collect collect = collectMapper.finyCollectByMsg(articleid, user.getId());
        if(collect!=null){
            resp.getWriter().write("false");
        }else {
            resp.getWriter().write("true");
        }
    }
}

