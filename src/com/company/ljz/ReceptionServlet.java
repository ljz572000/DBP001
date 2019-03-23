package com.company.ljz;

import dao.Dao;
import entity.CheckIn;
import entity.Customer;
import entity.Predict;
import entity.Room;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "ReceptionServlet")
public class ReceptionServlet extends HttpServlet {
    private Dao dao = new Dao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String opttype = request.getParameter("opttype");
        //酒店号
        String hotelId = (String) request.getSession().getAttribute("hotelId");
        String idCard = null;
        String rTypeno = null;
        String rno = null;
        String rTypePrice = null;
        String check_inTime = null;
        String leftTime = null;
        long totalDay = 0;
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        switch (opttype) {
            case "roomStatus":
                check_inTime = request.getParameter("check_inTime") + " 12:00:00";
                leftTime = request.getParameter("leftTime") + " 12:00:00";

                try {
                    Date checkindate = format.parse(check_inTime);
                    Date leftTimedate = format.parse(leftTime);

                    Date date = new Date();
                    Date nowdate = format.parse(format.format(date).substring(0, 10) + " 12:00:00");

                    totalDay = leftTimedate.getTime() - checkindate.getTime();
                    if (checkindate.getTime() < nowdate.getTime() || leftTimedate.getTime() < nowdate.getTime() || leftTimedate.getTime() < checkindate.getTime()) {
                        out.print("<script language='javascript'>window.location.href='reception/reception_index.jsp';alert('时间填写不正确');</script>");
                    } else {
                        rTypeno = (String) request.getSession().getAttribute("rTypeno");
                        ArrayList<Room> emptyRoomList = dao.queryEmpetyroom(hotelId, rTypeno, check_inTime, leftTime);
                        //保存时间
                        request.getSession().setAttribute("check_inTime", check_inTime);
                        request.getSession().setAttribute("leftTime", leftTime);
                        request.getSession().setAttribute("totalDay", totalDay / (1000 * 60 * 60 * 24));
                        if (emptyRoomList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/reception_index.jsp';alert('没有剩余房间!');</script>");
                        else {
                            request.getSession().setAttribute("emptyRoomList", emptyRoomList);
                            response.sendRedirect("reception/roomStatus.jsp");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "redirect":
                rTypeno = request.getParameter("rTypeno");
                request.getSession().setAttribute("rTypeno", rTypeno);
                response.sendRedirect("reception/Date.jsp");
                break;
            case "save":
                rno = request.getParameter("rno");
                rTypePrice = request.getParameter("rTypePrice");
                request.getSession().setAttribute("rno", rno);
                request.getSession().setAttribute("rTypePrice", rTypePrice);
                response.sendRedirect("reception/predict.jsp");
                break;
            case "saveIdCard":
                idCard = request.getParameter("idCard");
                boolean vip = dao.vip(idCard);
                request.getSession().setAttribute("idCard",idCard);
                request.getSession().setAttribute("vip",vip);
                response.sendRedirect("reception/predict_Infor.jsp");
                break;
            case "checkIn":
                idCard = request.getParameter("idCard");
                try {
                    if (dao.searchIdCard(idCard)) {
                        ArrayList<Predict> predictRoomList = dao.searchPredict(idCard);
                        if (predictRoomList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/reception_index.jsp';alert('你尚未预订房间,请先预约房间');</script>");
                        else {
                            request.getSession().setAttribute("predictRoomList", predictRoomList);
                            response.sendRedirect("reception/predictStatus.jsp");
                        }

                    } else {//没有身份信息,就注册用户
                        out.print("<script language='javascript'>window.location.href='reception/customerInfor.jsp';alert('您尚未注册账户,请先注册账户!');</script>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "predict":
                idCard = (String)request.getSession().getAttribute("idCard");
                rno = (String) request.getSession().getAttribute("rno");
                check_inTime = (String) request.getSession().getAttribute("check_inTime");
                leftTime = (String) request.getSession().getAttribute("leftTime");
                try {
                    if (dao.searchIdCard(idCard)) {
                        //同一个人不能预约同一个酒店同一个房间号两次
                        if (dao.searchRePredict(idCard, hotelId, rno))
                            out.print("<script language='javascript'>window.location.href='reception/reception_index.jsp';alert('失败!!!,同一个人不能预约同一个酒店同一个房间号两次');</script>");
                        else {
                            dao.predict(idCard, hotelId, rno, check_inTime, leftTime);
                            out.print("<script language='javascript'>window.location.href='reception/reception_index.jsp';alert('成功');</script>");
                        }
                    } else {//没有身份信息,就注册用户
                        out.print("<script language='javascript'>window.location.href='reception/customerInfor.jsp';alert('您尚未进行注册，请先注册');</script>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "confirmCheckIn":
                rno = request.getParameter("rno");
                idCard = request.getParameter("idCard");
                String pre_time = request.getParameter("pre_time");
                String pre_leftTime = request.getParameter("pre_leftTime");
                format = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
                try {
                    Date pre_timedate = format.parse(pre_time);
                    Date nowdate = new Date();
                    if (nowdate.getTime() < pre_timedate.getTime()) {
                        out.print("<script language='javascript'>window.location.href='reception/predictStatus.jsp';alert('预约时间未到,您不可以办理入住!!!');</script>");
                    } else {
                        dao.checkIn(hotelId, rno, idCard, pre_time, pre_leftTime);
                        out.print("<script language='javascript'>window.location.href='reception/checkIn.jsp';alert('入住办理成功');</script>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "customerInfor":
                try {
                    if (dao.searchIdCard(request.getParameter("idCard"))) {
                        out.print("<script language='javascript'>window.location.href='reception/customerInfor.jsp';alert(\"你已注册本酒店账户无需再注册!\");</script>");
                    } else {
                        Customer customer = new Customer();
                        customer.setIdCard(request.getParameter("idCard"));
                        customer.setCusName(request.getParameter("Name"));
                        customer.setAddr(request.getParameter("addr"));
                        customer.setAge(Integer.parseInt(request.getParameter("age")));
                        customer.setComefrom(request.getParameter("comefrom"));
                        customer.setWorkplace(request.getParameter("workplace"));
                        customer.setVip(Integer.parseInt(request.getParameter("vip")));
                        dao.customerInfor(customer);
                        out.print("<script language='javascript'>window.location.href='reception/customerInfor.jsp';alert(\"成功\");</script>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "check_out":
                idCard = request.getParameter("idCard");
                try {
                    if (dao.searchIdCard(idCard)) {
                        ArrayList<CheckIn> CheckInRoomList = dao.searchCheckIn(idCard);
                        if (CheckInRoomList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/checkIn.jsp';alert('你尚未入住房间,请先办理入住房间');</script>");
                        else {
                            request.getSession().setAttribute("CheckInRoomList", CheckInRoomList);
                            response.sendRedirect("reception/CheckInStatus.jsp");
                        }

                    } else {//没有身份信息,就注册用户
                        out.print("<script language='javascript'>window.location.href='reception/customerInfor.jsp';alert('您尚未注册账户,请先注册账户!');</script>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "confirmCheckOut":
                rno = request.getParameter("rno");
                idCard = request.getParameter("idCard");
                double deposit = dao.searchDeposit(idCard);
                dao.checkOut(idCard, hotelId, rno);
                if (deposit != 0){
                    request.getSession().setAttribute("deposit",deposit);
                    response.sendRedirect("reception/PayDeposit.jsp");
                }
                else
                out.print("<script language='javascript'>window.location.href='reception/check_out.jsp';alert('成功');</script>");
                break;
            case "search":
                String by = request.getParameter("by");
                ArrayList<Customer> CustomerList = null;
                switch(by){
                    case "Name":
                        String name = request.getParameter("name");
                        CustomerList = dao.searchCus(name,"Name");

                        if (CustomerList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/search.jsp';alert('没有姓名为"+name+"的客人信息');</script>");
                        else {
                            request.getSession().setAttribute("CustomerList", CustomerList);
                            response.sendRedirect("reception/CustomerTable.jsp");
                        }
                        break;
                    case "comefrom":
                        String comefrom = request.getParameter("comefrom");
                        CustomerList = dao.searchCus(comefrom, "comefrom");
                        if (CustomerList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/search.jsp';alert('没有来自地为"+comefrom+"的客人信息');</script>");
                        else {
                            request.getSession().setAttribute("CustomerList", CustomerList);
                            response.sendRedirect("reception/CustomerTable.jsp");
                        }
                        break;
                    case "workplace":
                        String workplace = request.getParameter("workplace");
                        CustomerList = dao.searchCus(workplace, "workplace");
                        if (CustomerList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/search.jsp';alert('没有工作单位为"+workplace+"的客人信息');</script>");
                        else {
                            request.getSession().setAttribute("CustomerList", CustomerList);
                            response.sendRedirect("reception/CustomerTable.jsp");
                        }
                        break;
                    case "addr":
                        String addr = request.getParameter("addr");
                        CustomerList = dao.searchCus(addr, "addr");
                        if (CustomerList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/search.jsp';alert('没有家庭地址为"+addr+"的客人信息');</script>");
                        else {
                            request.getSession().setAttribute("CustomerList", CustomerList);
                            response.sendRedirect("reception/CustomerTable.jsp");
                        }
                        break;
                    case "rno":
                        rno = request.getParameter("rno");
                        CustomerList = dao.searchCus(rno, "rno");
                        if (CustomerList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/search.jsp';alert('没有房间号为"+rno+"的客人信息');</script>");
                        else {
                            request.getSession().setAttribute("CustomerList", CustomerList);
                            response.sendRedirect("reception/CustomerTable.jsp");
                        }
                        break;
                    case "idcard":
                        idCard = request.getParameter("idcard");
                        CustomerList = dao.searchCus(idCard, "idcard");
                        if (CustomerList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/search.jsp';alert('没有身份账号为"+idCard+"的客人信息');</script>");
                        else {
                            request.getSession().setAttribute("CustomerList", CustomerList);
                            response.sendRedirect("reception/CustomerTable.jsp");
                        }
                        break;
                    case "deadline":
                        CustomerList = dao.searchCusExpire();
                        if (CustomerList.isEmpty())
                            out.print("<script language='javascript'>window.location.href='reception/search.jsp';alert('没有入住到期的客人');</script>");
                        else {
                            request.getSession().setAttribute("CustomerList", CustomerList);
                            response.sendRedirect("reception/CustomerTable.jsp");
                        }
                        break;
                }
                break;

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
