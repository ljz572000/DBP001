package com.company.ljz;

import dao.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String user_type = request.getParameter("user_type");
        String hotel_city = request.getParameter("hotelId");
        PrintWriter out = response.getWriter();
        Dao dao = new Dao();

        try {
            if (dao.Verification(account, password, user_type, hotel_city) == false) {
                request.getSession().setAttribute("hotelId", hotel_city);
                if (user_type.equals("reception"))
                    response.sendRedirect("reception/reception_index.jsp");
                else if (user_type.equals("manager"))
                    response.sendRedirect("manager/checkIn_rate.jsp");
            } else
                out.print("<script language='javascript'>window.location.href='login.jsp';alert('您输入账号或密码有误!');</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
