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
 * @date 2022/9/29 17:59
 * @since 1.0.0
 * 首页中商品信息展示
 * 从数据库中获取商品信息
 * 不需要做特殊处理
 */

@WebServlet("/Article")
public class showAllArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArticleMapperDAo articleMapperDap = new articleMapperDapImpl();
        List<Article> listArticle = articleMapperDap.getListArticle();
        ArticleTypeImpl articleType = new ArticleTypeImpl();
        List<ArticleType> listArticleType = articleType.getListArticleType();
        req.getSession().setAttribute("listArticleType",listArticleType);
        req.getSession().setAttribute("Article",listArticle);
        resp.sendRedirect("jsp/succeed.jsp");
    }
}
