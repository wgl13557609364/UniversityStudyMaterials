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
 * @date 2022/10/20 6:13
 * @since 1.0.0
 */
@WebServlet("/Articleupdata")
public class UpdataArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Double price = Double.parseDouble(req.getParameter("price"));
        Double discount = Double.valueOf(req.getParameter("discount"));
        Integer storage = Integer.valueOf(req.getParameter("storage"));
        articleMapperDapImpl articleMapperDap = new articleMapperDapImpl();
        int updatasell = articleMapperDap.updatasell(id, price, discount, storage);
        System.out.println("进入方法！管理员修改信息");
        if(updatasell==1){
            resp.getWriter().write("ture");
        }else {
            resp.getWriter().write("false");
        }
        System.out.println(updatasell);
    }
}
