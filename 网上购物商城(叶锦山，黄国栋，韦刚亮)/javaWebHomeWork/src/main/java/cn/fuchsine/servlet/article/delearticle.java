package cn.fuchsine.servlet.article;

import cn.fuchsine.dao.article.articleMapperDapImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author fuchsine
 * @date 2022/10/15 22:38
 * @since 1.0.0
 */
@WebServlet("/articledisable")
public class delearticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int articleid = Integer.parseInt(req.getParameter("articleid"));
        articleMapperDapImpl articleMapperDap = new articleMapperDapImpl();
        int i = articleMapperDap.upDataDisable(articleid);
        if(i==1){
            //删除成功！
            resp.getWriter().write("true");
        }else {
            //删除失败
            resp.getWriter().write("false");
        }
    }
}
