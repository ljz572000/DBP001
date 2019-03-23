package entity;

public class Room {
    private String hotelId;
    private String rno;
    private String rTypeno;
    private String rTypeName;
    private String rTypePrice;

    public String getrTypeName() {
        return rTypeName;
    }

    public void setrTypeName(String rTypeName) {
        this.rTypeName = rTypeName;
    }

    public String getrTypePrice() {
        return rTypePrice;
    }

    public void setrTypePrice(String rTypePrice) {
        this.rTypePrice = rTypePrice;
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

    public String getrTypeno() {
        return rTypeno;
    }

    public void setrTypeno(String rTypeno) {
        this.rTypeno = rTypeno;
    }
}
