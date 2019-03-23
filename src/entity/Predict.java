package entity;

public class Predict {
    private String idCard;
    private String hotelId;
    private String rno;
    private String pre_time;
    private String pre_leftTime;
    private int predict_day;

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

    public String getPre_time() {
        return pre_time;
    }

    public void setPre_time(String pre_time) {
        this.pre_time = pre_time;
    }

    public String getPre_leftTime() {
        return pre_leftTime;
    }

    public void setPre_leftTime(String pre_leftTime) {
        this.pre_leftTime = pre_leftTime;
    }

    public int getPredict_day() {
        return predict_day;
    }

    public void setPredict_day(int predict_day) {
        this.predict_day = predict_day;
    }
}
