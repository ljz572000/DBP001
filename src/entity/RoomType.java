package entity;

public class RoomType {
    private String rTypeno ;
    private String rTypename ;
    private double check_In_rate;
    private int totalCheckInRoom;
    private int totalRoom;
    private double totalIncome;

    public double getTotalIncome() {
        return totalIncome;
    }

    public void setTotalIncome(double totalIncome) {
        this.totalIncome = totalIncome;
    }

    public int getTotalCheckInRoom() {
        return totalCheckInRoom;
    }

    public void setTotalCheckInRoom(int totalCheckInRoom) {
        this.totalCheckInRoom = totalCheckInRoom;
    }

    public int getTotalRoom() {
        return totalRoom;
    }

    public void setTotalRoom(int totalRoom) {
        this.totalRoom = totalRoom;
    }



    public String getrTypeno() {
        return rTypeno;
    }

    public void setrTypeno(String rTypeno) {
        this.rTypeno = rTypeno;
    }

    public String getrTypename() {
        return rTypename;
    }

    public void setrTypename(String rTypename) {
        this.rTypename = rTypename;
    }

    public double getCheck_In_rate() {
        return check_In_rate;
    }

    public void setCheck_In_rate(double check_In_rate) {
        this.check_In_rate = check_In_rate;
    }
}
