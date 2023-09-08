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
 * @date 2022/10/20 9:28
 * @since 1.0.0
 */
@WebServlet("/GetdeleteArticleServlet")
public class GetdeleteArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        articleMapperDapImpl articleMapperDap = new articleMapperDapImpl();
        List<Article> listArticled = articleMapperDap.getListArticled();
        Object toJSON = JSON.toJSON(listArticled);
        if(toJSON!=null){
            resp.getWriter().write(toJSON.toString());
        }else {
            resp.getWriter().write("tip");
        }
    }
}
