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
 * @date 2022/10/16 4:10
 * @since 1.0.0
 */
@WebServlet("/addcollect")
public class AddCollertServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int articleid = Integer.parseInt(req.getParameter("articleid"));
        CollectMapperImpl collectMapper = new CollectMapperImpl();
        int i = collectMapper.addCollect(articleid, user.getId());
        if(i==1){
            //添加成功！
            resp.getWriter().write("true");
        }else {
            //添加失败
            resp.getWriter().write("false");
        }
    }
}
