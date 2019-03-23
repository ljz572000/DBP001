package entity;

public class CheckIn {
    private String idCard;
    private String hotelId;
    private String rno;
    private String checkIntime;
    private String leftTime;
    private int totalday;

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getHotelId() {
        return hotelId;
    }

    public void setHotelId(String hotelId) {
        this.hotelId = hotelId;
    }

    public String getRno() {
        return rno;
    }

    public void setRno(String rno) {
        this.rno = rno;
    }

    public String getCheckIntime() {
        return checkIntime;
    }

    public void setCheckIntime(String checkIntime) {
        this.checkIntime = checkIntime;
    }

    public String getLeftTime() {
        return leftTime;
    }

    public void setLeftTime(String leftTime) {
        this.leftTime = leftTime;
    }

    public int getTotalday() {
        return totalday;
    }

    public void setTotalday(int totalday) {
        this.totalday = totalday;
    }
}
