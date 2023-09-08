package cn.fuchsine.servlet.shopcar;

import cn.fuchsine.dao.shopcar.shopCarMapperImpl;
import cn.fuchsine.pojo.Article;
import cn.fuchsine.pojo.ShopCar;
import cn.fuchsine.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @author fuchsine
 * @date 2022/10/12 14:34
 * @since 1.0.0
 */
@WebServlet("/addshopcarservlet")
public class AddShopcar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        User user = (User) req.getSession().getAttribute("user");

        //商品id
        int articleid = Integer.parseInt(req.getParameter("articleid"));

        //前端获取加入购物车数量
        int sum = Integer.parseInt(req.getParameter("articlesum"));

        //获取其购物车中是否存该商品
        shopCarMapperImpl shopCarMapper = new shopCarMapperImpl();
        Article article1 = new Article();
        //前端无需获取用户 id，可以从Session中获取
        ShopCar shopCar = shopCarMapper.selectByname(user.getId(), articleid);
        if(shopCar!=null){
            resp.getWriter().write("has");
        }else {
           //购物车内不存该商品，可以直接加入
            ShopCar shopCar1 = new ShopCar();
           shopCar1.setArticleId(articleid);
            shopCar1.setBuyNum(sum);
            shopCar1.setUserId(user.getId());
            int addshopcar = shopCarMapper.addshopcar(shopCar1);
            if(addshopcar==1){
                resp.getWriter().write("" + true);
            }else {

                resp.getWriter().write("" + false);

            }
        }
    }
}
