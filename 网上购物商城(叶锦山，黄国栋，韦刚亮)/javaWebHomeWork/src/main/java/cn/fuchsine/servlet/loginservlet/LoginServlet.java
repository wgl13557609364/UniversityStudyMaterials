package cn.fuchsine.servlet.loginservlet;


import cn.fuchsine.pojo.User;
import cn.fuchsine.service.userservice.UserSerivceImpl;
import cn.fuchsine.service.userservice.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String loginName = req.getParameter("loginName");
        String password = req.getParameter("password");
        System.out.println("usname:" + loginName + "   password:" + password);
        System.out.println(loginName);
        UserService userService = new UserSerivceImpl();
        User user = userService.Login(loginName,password);
        System.out.println(user);
        HttpSession session = req.getSession();
        if(user!=null){
            session.setAttribute("user",user);
            resp.sendRedirect(req.getContextPath()+"/Article");


        }else {
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
