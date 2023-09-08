package cn.fuchsine.servlet.registerservlet;
/*
前端注册页面，
 */
import cn.fuchsine.pojo.User;
import cn.fuchsine.service.registerservice.RegisterServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/newUserAdd")
public class NewUserRefister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String loginname = req.getParameter("loginname");
        String password = req.getParameter("password");
        String trunname = req.getParameter("trunname");
        int sex = Integer.parseInt(req.getParameter("sex"));
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");

        User user = new User();
        user.setLoginName(loginname);
        user.setPassword(password);
        user.setName(trunname);
        user.setSex(sex);
        user.setPhone(phone);
        user.setAddress(address);
        user.setEmail(email);
        System.out.println(user);
        System.out.println("信息输出"+"=========================");

        RegisterServiceImpl rsgister = new RegisterServiceImpl();
        int ADDNUM = rsgister.NewUserAdd(loginname, user);
        if(ADDNUM==1){
            //注册成功
            System.out.println("用户注册成功！");
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }else {
            System.out.println("注册失败！");
        }



    }
}
