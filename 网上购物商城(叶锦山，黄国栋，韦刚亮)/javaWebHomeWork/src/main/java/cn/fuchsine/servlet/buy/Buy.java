package cn.fuchsine.servlet.buy;

import cn.fuchsine.dao.shopcar.shopCarMapperImpl;
import cn.fuchsine.pojo.ShopCar;
import cn.fuchsine.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/13 5:28
 * @since 1.0.0
 */
@WebServlet("/buything")
public class Buy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        User user = (User) req.getSession().getAttribute("user");
        String str = req.getParameter("buythingstr");
        ArrayList<ShopCar> shopCarList = new ArrayList<>();
        shopCarMapperImpl shopCarMapper = new shopCarMapperImpl();
        String[] split = str.split(":");
        double turepricr = 0;
        for (String s : split) {
            int length = s.length();
            if(length!=0){
                ShopCar shopCar = shopCarMapper.selectByname(user.getId(), Integer.valueOf(s));
                shopCarList.add(shopCar);
                turepricr += (shopCar.getArticle().getPrice() * shopCar.getArticle().getDiscount() * shopCar.getBuyNum());
            }
        }
        System.out.println("金额为：" + turepricr);
        req.getSession().setAttribute("turepricr",turepricr);
        req.getSession().setAttribute("shopCarList",shopCarList);
        resp.sendRedirect("jsp/buy.jsp");
    }

}
