package cn.fuchsine.servlet.loginservlet;

import cn.fuchsine.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/loginout")
public class LoginOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.getSession().removeAttribute("user");
        User user = (User) req.getSession().getAttribute("user");
        System.out.println("推出后的session为：" + user);
        System.out.println(req.getContextPath()+"/index.jsp");
        resp.sendRedirect(req.getContextPath()+"/index.jsp");
    }
}
