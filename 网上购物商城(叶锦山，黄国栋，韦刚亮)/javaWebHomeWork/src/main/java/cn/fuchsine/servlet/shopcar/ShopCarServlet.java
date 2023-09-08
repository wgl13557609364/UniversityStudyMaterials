package cn.fuchsine.servlet.shopcar;

import cn.fuchsine.dao.shopcar.shopCarMapperImpl;
import cn.fuchsine.pojo.ShopCar;
import cn.fuchsine.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/8 4:54
 * @since 1.0.0
 */
@WebServlet("/shopcar")
public class ShopCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        shopCarMapperImpl shopCarMapper = new shopCarMapperImpl();
        User user = (User) req.getSession().getAttribute("user");
        HttpSession session = req.getSession();
        if(user!=null){
            List<ShopCar> shopCarList = shopCarMapper.findShopCar(user.getId());
            session.setAttribute("shopCarList",shopCarList);
            resp.sendRedirect("jsp/shopcar.jsp");
        }else {
            req.getRequestDispatcher("/succeed.jsp").forward(req,resp);
        }
    }
}
