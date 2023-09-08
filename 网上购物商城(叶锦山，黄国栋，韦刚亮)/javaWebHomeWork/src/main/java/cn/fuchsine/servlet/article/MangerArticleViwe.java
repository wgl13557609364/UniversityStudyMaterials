package cn.fuchsine.servlet.article;

import cn.fuchsine.dao.article.ArticleMapperDAo;
import cn.fuchsine.dao.article.articleMapperDapImpl;
import cn.fuchsine.dao.articleType.ArticleTypeImpl;
import cn.fuchsine.pojo.Article;
import cn.fuchsine.pojo.ArticleType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/12 21:42
 * @since 1.0.0
 */
@WebServlet("/mangerArticle")
public class MangerArticleViwe extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArticleMapperDAo articleMapperDap = new articleMapperDapImpl();
        List<Article> listArticle = articleMapperDap.getListArticle();
        req.getSession().setAttribute("Article",listArticle);

        ArticleTypeImpl articleType = new ArticleTypeImpl();
        List<ArticleType> listArticleType = articleType.getListArticleType();
        req.getSession().setAttribute("listArticleType",listArticleType);

        resp.sendRedirect("jsp/manger.jsp");
    }
}
