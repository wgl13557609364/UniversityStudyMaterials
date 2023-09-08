package cn.fuchsine.servlet.article;

import cn.fuchsine.dao.article.articleMapperDapImpl;
import cn.fuchsine.pojo.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author fuchsine
 * @date 2022/10/6 20:13
 * @since 1.0.0
 */
@WebServlet("/mainshop")
public class MainShopServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        articleMapperDapImpl articleMapperDap = new articleMapperDapImpl();
        Article article = articleMapperDap.getArticleById(id);
        HttpSession session = req.getSession();
        session.setAttribute("article",article);
        resp.sendRedirect("jsp/mainshop.jsp");
    }
}
