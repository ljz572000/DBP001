package com.company.ljz;

import dao.Dao;
import entity.RoomType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ManagerServlet")
public class ManagerServlet extends HttpServlet {
    private Dao dao = new Dao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String opttype = request.getParameter("opttype");
        String hotelId = null;
        String startTime = null;
        String endTime = null;
        switch (opttype) {
            case "checkIn_rate":
                hotelId =request.getParameter("hotelId");
                startTime =request.getParameter("startTime");
                endTime = request.getParameter("endTime");
                try {
                    if (dao.searchHotelId(hotelId)){
                        ArrayList<RoomType> rTypeList = dao.checkIn_rate(startTime,endTime,hotelId);
                        if (rTypeList.isEmpty()){
                            out.print("<script language='javascript'>window.location.href='manager/checkIn_rate.jsp';alert('当前时间段内没有客房被入住');</script>");
                        }else{
                            request.getSession().setAttribute("rTypeList", rTypeList);
                            response.sendRedirect("manager/Show_checkInRate.jsp");
                        }
                    }else
                        out.print("<script language='javascript'>window.location.href='manager/checkIn_rate.jsp';alert('酒店号输入错误!!!');</script>");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "checkIn_status":
                hotelId =request.getParameter("hotelId");
                startTime =request.getParameter("startTime");
                endTime = request.getParameter("endTime");
                try {
                    if (dao.searchHotelId(hotelId)){
                        ArrayList<RoomType> rTypeList = dao.checkIn_status(startTime,endTime,hotelId);
                        if (rTypeList.isEmpty()){
                            out.print("<script language='javascript'>window.location.href='manager/checkIn_rate.jsp';alert('当前时间段内没有客房被入住');</script>");
                        }else{
                            request.getSession().setAttribute("rTypeList", rTypeList);
                            response.sendRedirect("manager/Show_checkIn_status.jsp");
                        }
                    }else
                        out.print("<script language='javascript'>window.location.href='manager/checkIn_rate.jsp';alert('酒店号输入错误!!!');</script>");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "InCome":
                hotelId =request.getParameter("hotelId");
                startTime =request.getParameter("startTime");
                endTime = request.getParameter("endTime");
                try {
                    if (dao.searchHotelId(hotelId)){
                        ArrayList<RoomType> rTypeList = dao.InCome(startTime,endTime,hotelId);
                        if (rTypeList.isEmpty()){
                            out.print("<script language='javascript'>window.location.href='manager/checkIn_rate.jsp';alert('当前时间段内没有客房被入住');</script>");
                        }else{
                            request.getSession().setAttribute("rTypeList", rTypeList);
                            response.sendRedirect("manager/Show_HotelInCome.jsp");
                        }
                    }else
                        out.print("<script language='javascript'>window.location.href='manager/InCome.jsp';alert('酒店号输入错误!!!');</script>");
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
