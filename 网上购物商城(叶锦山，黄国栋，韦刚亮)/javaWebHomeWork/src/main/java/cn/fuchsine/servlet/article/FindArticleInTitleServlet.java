package cn.fuchsine.servlet.article;

import cn.fuchsine.dao.article.articleMapperDapImpl;
import cn.fuchsine.pojo.Article;
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
 * @date 2022/10/17 7:12
 * @since 1.0.0
 */
@WebServlet("/selectbytitle")
public class FindArticleInTitleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String title = req.getParameter("title");
        articleMapperDapImpl articleMapperDap = new articleMapperDapImpl();
        List<Article> articleList = articleMapperDap.findArticlesLikeTitle(title);
        Object toJSON = JSON.toJSON(articleList);
        String json = toJSON.toString();
        resp.getWriter().write(json);
    }
}
