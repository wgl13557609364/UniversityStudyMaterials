package cn.fuchsine.servlet;

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
 * @date 2022/10/17 1:33
 * @since 1.0.0
 */
@WebServlet("/getjson")
public class JsonTestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        articleMapperDapImpl articleMapperDao = new articleMapperDapImpl();
        List<Article> listArticle = articleMapperDao.getListArticle();
        Object toJSON = JSON.toJSON(listArticle);
        String json = toJSON.toString();
        resp.getWriter().write(json);
    }
}
