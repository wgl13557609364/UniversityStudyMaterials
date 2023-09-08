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
 * @date 2022/10/20 9:57
 * @since 1.0.0
 */
@WebServlet("/RecoverArticle")
public class ArticleRecoverServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        Integer id = Integer.valueOf(req.getParameter("id"));
        articleMapperDapImpl articleMapperDap = new articleMapperDapImpl();
        int i = articleMapperDap.RecoverArticle(id);
        if(i==1){
            resp.getWriter().write("ture");
        }else {
            resp.getWriter().write("false");
        }
    }
}
