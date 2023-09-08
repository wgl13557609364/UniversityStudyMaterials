package cn.fuchsine.util;

import cn.fuchsine.pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/jsp/*")
public class UserFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response= (HttpServletResponse) resp;

        //令牌页面放行
        String[] urls = {"/Register.html","/newUserAdd","/succeed.jsp"};
        String url = request.getRequestURL().toString();
        System.out.println(url);
        for(String u : urls){
            filterChain.doFilter(req,resp);
            return;
        }


        User user = (User) request.getSession().getAttribute("user");
        System.out.println("进入了过滤方法："+ user);
        if(user!=null){
            filterChain.doFilter(req,resp);
        }else {
            response.sendRedirect(((HttpServletRequest) req).getContextPath()+ "/index.jsp");
        }
    }


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }



    @Override
    public void destroy() {

    }
}
