package cn.fuchsine.servlet.registerservlet;
/*
注册页面ajax请求页面！
在用户输入账号时校验是否存在！
 */
import cn.fuchsine.pojo.User;
import cn.fuchsine.service.registerservice.RegisterService;
import cn.fuchsine.service.registerservice.RegisterServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/selectUserServlet")
public class SelectUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        RegisterService registerService = new RegisterServiceImpl();
        User userByUser = registerService.getUserByUser(username);
        System.out.println(userByUser);
        if(userByUser!=null){
            //用户存在，返回true，前端显示存在
            resp.getWriter().write("" + true);
        }else {
            resp.getWriter().write("" + false);
        }

    }
}
