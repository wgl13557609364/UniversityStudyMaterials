package cn.fuchsine.servlet.buy;

import cn.fuchsine.pojo.ShopCar;
import cn.fuchsine.pojo.User;
import cn.fuchsine.service.SettlementService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/14 21:27
 * @since 1.0.0
 */
@WebServlet("/play")
public class SettlementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        double turepricr = (double) req.getSession().getAttribute("turepricr");
        List<ShopCar> shopCarList = (List<ShopCar>) req.getSession().getAttribute("shopCarList");
        SettlementService settlementService = new SettlementService();
        settlementService.settlementshop(shopCarList,turepricr,user.getId());
        resp.sendRedirect(req.getContextPath()+"/Article");
    }
}

