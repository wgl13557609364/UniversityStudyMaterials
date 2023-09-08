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
 * @date 2022/10/18 8:44
 * @since 1.0.0
 */
@WebServlet("/selectremark")
public class SelectFindyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String type = req.getParameter("text");
        articleMapperDapImpl articleMapperDap = new articleMapperDapImpl();
        ArticleTypeImpl ArticleTypemapper = new ArticleTypeImpl();
        if(type.equals("全部")){
            List<Article> listArticle = articleMapperDap.getListArticle();
            Object toJSON = JSON.toJSON(listArticle);
            resp.getWriter().write(toJSON.toString());
        }else {
            ArticleType articleType = ArticleTypemapper.findyByremark(type);
            List<Article> list = articleMapperDap.findyArticleByType(articleType.getCode());
            Object toJSON = JSON.toJSON(list);
            resp.getWriter().write(toJSON.toString());
        }

    }
}
