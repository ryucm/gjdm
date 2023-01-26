package egovframework.gjdm.vo;

import java.util.Date;

public class DimCalendarVO {
	private int dateId;
	private String yyyymmdd;
	private String yyyyMm;
	private String hy;
	private String qt;
	private String mm;
	private String wk;
	private String dd;
	private String dayNM;
	private Date rgtrDt;
	private String rgtrId;
	private Date updtDt;
	private String updtId;
	
	public int getDateId() {
		return dateId;
	}
	public void setDate_id(int dateId) {
		this.dateId = dateId;
	}
	public String getYyyymmdd() {
		return yyyymmdd;
	}
	public void setYyyymmdd(String yyyymmdd) {
		this.yyyymmdd = yyyymmdd;
	}
	public String getYyyyMm() {
		return yyyyMm;
	}
	public void setYyyymm(String yyyyMm) {
		this.yyyyMm = yyyyMm;
	}
	public String getHy() {
		return hy;
	}
	public void setHy(String hy) {
		this.hy = hy;
	}
	public String getQt() {
		return qt;
	}
	public void setQt(String qt) {
		this.qt = qt;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	public String getWk() {
		return wk;
	}
	public void setWk(String wk) {
		this.wk = wk;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public String getDayNM() {
		return dayNM;
	}
	public void setDayNM(String dayNM) {
		this.dayNM = dayNM;
	}
	public Date getRgtrDt() {
		return rgtrDt;
	}
	public void setRgtrDt(Date rgtrDt) {
		this.rgtrDt = rgtrDt;
	}
	public String getRgtrId() {
		return rgtrId;
	}
	public void setRgtrId(String rgtrId) {
		this.rgtrId = rgtrId;
	}
	public Date getUpdtDt() {
		return updtDt;
	}
	public void setUpdtDt(Date updtDt) {
		this.updtDt = updtDt;
	}
	public String getUpdtId() {
		return updtId;
	}
	public void setUpdtId(String updtId) {
		this.updtId = updtId;
	}
}