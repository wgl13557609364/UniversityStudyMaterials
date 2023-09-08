package cn.fuchsine.servlet.user;

import cn.fuchsine.dao.user.UserImpl;
import cn.fuchsine.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author fuchsine
 * @date 2022/10/19 9:02
 * @since 1.0.0
 */
@WebServlet("/updatauser")
public class UpdataUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        UserImpl mapper = new UserImpl();
        int i = mapper.UpdataUserMsg(name, address, phone, email, user.getId());
        if(i==1){
            resp.getWriter().write("ture");
        }else {
            resp.getWriter().write("false");
        }
    }
}
