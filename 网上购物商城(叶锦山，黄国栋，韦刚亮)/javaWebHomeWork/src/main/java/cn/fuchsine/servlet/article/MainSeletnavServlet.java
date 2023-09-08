package cn.fuchsine.servlet.article;

import cn.fuchsine.dao.article.articleMapperDapImpl;
import cn.fuchsine.dao.articleType.ArticleTypeImpl;
import cn.fuchsine.pojo.Article;
import cn.fuchsine.pojo.ArticleType;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/21 1:17
 * @since 1.0.0
 */
@WebServlet("/seletnavtit")
public class MainSeletnavServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("tit");
        System.out.println(type);
        articleMapperDapImpl articleMapperDap = new articleMapperDapImpl();
        ArticleTypeImpl ArticleTypemapper = new ArticleTypeImpl();
            ArticleType articleType = ArticleTypemapper.findyByremark(type);
            List<Article> listArticle = articleMapperDap.findyArticleByType(articleType.getCode());
        req.getSession().setAttribute("Article",listArticle);
        resp.sendRedirect("jsp/succeed.jsp");
    }
}
