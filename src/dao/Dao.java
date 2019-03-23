package dao;

import entity.*;
import dbutil.SQLHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Dao {
    //用户登录验证
    public boolean Verification(String account, String password, String user_type, String hotel_city) throws Exception {
        String sql = "OPEN SYMMETRIC KEY duichengmiyao DECRYPTION BY CERTIFICATE ZhengShu;\n" +
                "select * from " + user_type + " where id = '" + account + "' and CAST(DecryptByKey(password) as varchar(100)) = '"
                + password + "' and hotelId = '" + hotel_city + "'\n" +
                "CLOSE SYMMETRIC KEY duichengmiyao;";
        ResultSet rs = SQLHelper.executeQuery(sql);
        if (rs.next()) {
            return false;
        } else
            return true;
    }

    public ArrayList<Room> queryEmpetyroom
            (String hotelId, String rTypeno, String check_inTime, String leftTime) {
        ArrayList<Room> list = new ArrayList<>();
        String sql = "execute emptyRoom '" + hotelId + "','" + rTypeno + "','" + check_inTime + "','" + leftTime + "'";
        ResultSet rs = SQLHelper.executeQuery(sql);
        try {
            while (rs.next()) {
                Room room = new Room();
                room.setRno(rs.getString(1));
                room.setrTypeName(rs.getString(2));
                room.setrTypePrice(rs.getString(3));
                list.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SQLHelper.closeConnection();
        return list;
    }

    public boolean searchIdCard(String idCard) throws SQLException {
        //查询账户
        String sql = "execute searchByIdCard '" + idCard + "'";
        ResultSet rs = SQLHelper.executeQuery(sql);
        if (rs.next()) {
            return true;
        } else
            return false;
    }


    public void predict(String idCard, String hotelId, String rno, String check_inTime, String leftTime) {
        //预约服务
        String sql = "execute predict_p '" + idCard + "','" + hotelId + "','" + rno + "','" + check_inTime + "','" + leftTime + "'";
        SQLHelper.executeUpdate(sql);
    }

    public boolean vip(String idCard) {
        String sql = "select vip from customers where idCard = '" + idCard + "';";
        ResultSet rs = SQLHelper.executeQuery(sql);
        boolean vip = false;
        try {
            if (rs.next()) {
                if (rs.getBoolean(1) == true)
                    vip = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vip;
    }

    public ArrayList<Predict> searchPredict(String idCard) {//搜索预约情况
        ArrayList<Predict> list = new ArrayList<>();
        String sql = "execute searchPredict '" + idCard + "' ";
        ResultSet rs = SQLHelper.executeQuery(sql);
        try {
            while (rs.next()) {
                Predict predict = new Predict();
                predict.setIdCard(rs.getString(2));
                predict.setHotelId(rs.getString(3));
                predict.setRno(rs.getString(4));
                predict.setPre_time(rs.getString(5));
                predict.setPre_leftTime(rs.getString(6));
                predict.setPredict_day(rs.getInt(7));
                list.add(predict);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SQLHelper.closeConnection();
        return list;
    }

    public void checkIn(String hotelId, String rno, String idCard, String check_inTime, String leftTime) {
        String sql = "INSERT INTO check_in(idCard,hotelId,rno,check_inTime,leftTime)\n" +
                "VALUES ('" + idCard + "','" + hotelId + "','" + rno + "','" + check_inTime + "','" + leftTime + "');";
        SQLHelper.executeUpdate(sql);
    }

    public void customerInfor(Customer customer) {
        String sql = "insert into customers(cusName,idCard,age,addr,workplace,comefrom,vip) VALUES " +
                "('" + customer.getCusName() + "','" + customer.getIdCard() + "'," + customer.getAge()
                + ",'" + customer.getAddr() + "','" + customer.getWorkplace() + "','" + customer.getComefrom()
                + "'," + customer.getVip()
                + ");";
        SQLHelper.executeUpdate(sql);
    }

    public ArrayList<CheckIn> searchCheckIn(String idCard) {
        ArrayList<CheckIn> list = new ArrayList<>();
        String sql = "select idCard,hotelId,rno,check_inTime,leftTime,totalDay from check_in where idCard = '"+idCard+"'\n" +
                "intersect select idCard,hotelId,rno,pre_time,pre_leftTime,predict_day from predict ;  ";
        ResultSet rs = SQLHelper.executeQuery(sql);
        try {
            while (rs.next()) {
                CheckIn checkIn = new CheckIn();
                checkIn.setIdCard(rs.getString(1));
                checkIn.setHotelId(rs.getString(2));
                checkIn.setRno(rs.getString(3));
                checkIn.setCheckIntime(rs.getString(4));
                checkIn.setLeftTime(rs.getString(5));
                checkIn.setTotalday(rs.getInt(6));
                list.add(checkIn);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SQLHelper.closeConnection();
        return list;
    }

    public int checkOut(String idCard, String hotelId, String rno) {
        int r = 0;
        String sql = "DELETE FROM predict WHERE hotelId = '" + hotelId + "' and rno = '" + rno + "' and idCard = '" + idCard + "' ;";
        r = SQLHelper.executeUpdate(sql);
        return r;
    }

    public boolean searchRePredict(String idCard, String hotelId, String rno) throws SQLException {
        String sql = "select * from predict where idCard = '" + idCard + "' and hotelId = '" + hotelId + "' and rno = '" + rno + "';";
        ResultSet rs = SQLHelper.executeQuery(sql);
        if (rs.next()) {
            return true;
        } else
            return false;
    }

    public ArrayList<Customer> searchCus(String parameter, String switch_par) {
        ArrayList<Customer> list = new ArrayList<>();
        String sql = "execute searchCus '" + parameter + "' , '" + switch_par + "'";
        ResultSet rs = SQLHelper.executeQuery(sql);
        try {
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setIdCard(rs.getString(1));
                customer.setCusName(rs.getString(2));
                customer.setAge(rs.getInt(3));
                customer.setAddr(rs.getString(4));
                customer.setWorkplace(rs.getString(5));
                customer.setComefrom(rs.getString(6));
                customer.setDeposit(rs.getDouble(7));
                customer.setFee(rs.getDouble(8));
                customer.setHotelId(rs.getString(9));
                customer.setRno(rs.getString(10));
                list.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SQLHelper.closeConnection();
        return list;
    }

    public ArrayList<Customer> searchCusExpire() {
        ArrayList<Customer> list = new ArrayList<>();
        String sql = "select * from CusExpire";
        ResultSet rs = SQLHelper.executeQuery(sql);
        try {
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setIdCard(rs.getString(1));
                customer.setCusName(rs.getString(2));
                customer.setAge(rs.getInt(3));
                customer.setAddr(rs.getString(4));
                customer.setWorkplace(rs.getString(5));
                customer.setComefrom(rs.getString(6));
                customer.setDeposit(rs.getDouble(7));
                customer.setFee(rs.getDouble(8));
                customer.setHotelId(rs.getString(9));
                customer.setRno(rs.getString(10));
                customer.setLeftTime(rs.getString(11));
                list.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SQLHelper.closeConnection();
        return list;
    }

    public boolean searchHotelId(String hotelId) throws SQLException {
        //查询账户
        String sql = "select * from hotels where hotelId = '" + hotelId + "'";
        ResultSet rs = SQLHelper.executeQuery(sql);
        if (rs.next()) {
            return true;
        } else
            return false;
    }

    public ArrayList<RoomType> checkIn_rate(String startTime, String endTime, String hotelId) {
        ArrayList<RoomType> list = new ArrayList<>();
        String sql = "DECLARE\t@return_value int\n" +
                "\n" +
                "EXEC\t@return_value = [dbo].[check_in_P]\n" +
                "\t\t@start_time = N' " + startTime + "',\n" +
                "\t\t@end_time = N' " + endTime + "',\n" +
                "\t\t@hotelId = N' " + hotelId + "'";

        ResultSet rs = SQLHelper.executeQuery(sql);
        try {
            while (rs.next()) {
                RoomType roomType = new RoomType();
                roomType.setrTypeno(rs.getString(1));
                roomType.setrTypename(rs.getString(2));
                roomType.setCheck_In_rate(rs.getDouble(3));
                list.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SQLHelper.closeConnection();
        return list;
    }

    public ArrayList<RoomType> checkIn_status(String startTime, String endTime, String hotelId) {
        ArrayList<RoomType> list = new ArrayList<>();
        String sql = " DECLARE\t@return_value int\n" +
                "\n" +
                "        EXEC\t@return_value = [dbo].[checkIn_status]\n" +
                "        @start_time = N'" + startTime + "',\n" +
                "        @end_time = N'" + endTime + "',\n" +
                "        @hotelId = N'" + hotelId + "'";

        ResultSet rs = SQLHelper.executeQuery(sql);
        try {
            while (rs.next()) {
                RoomType roomType = new RoomType();
                roomType.setrTypeno(rs.getString(1));
                roomType.setrTypename(rs.getString(2));
                roomType.setTotalCheckInRoom(rs.getInt(3));
                sql = "select COUNT(rooms.rno) from rooms where rooms.rTypeno = '"+rs.getString(1)+"'";
                ResultSet rs2 = SQLHelper.executeQuery(sql);
                if (rs2.next()){
                    roomType.setTotalRoom(rs2.getInt(1));
                }
                list.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SQLHelper.closeConnection();
        return list;
    }

    public ArrayList<RoomType> InCome(String startTime, String endTime, String hotelId) {
        ArrayList<RoomType> list = new ArrayList<>();
        String sql = "DECLARE\t@return_value int\n" +
                "\n" +
                "EXEC\t@return_value = [dbo].[InCome]\n" +
                "\t\t@start_time = N'" + startTime + "',\n" +
                "\t\t@end_time = N'" + endTime + "',\n" +
                "\t\t@hotelId = N'" + hotelId + "'";
        ResultSet rs = SQLHelper.executeQuery(sql);
        try {
            while (rs.next()) {
                RoomType roomType = new RoomType();
                roomType.setrTypeno(rs.getString(1));
                roomType.setrTypename(rs.getString(2));
                roomType.setTotalIncome(rs.getDouble(3));
                list.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SQLHelper.closeConnection();
        return list;
    }

    public double searchDeposit(String idCard) {
        String sql = "select deposit from customers where idCard = '" + idCard + "'";
        ResultSet rs = SQLHelper.executeQuery(sql);
        double deposit = 0;
        try {
            while (rs.next()) {
                deposit = rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SQLHelper.closeConnection();
        return deposit;
    }
}

