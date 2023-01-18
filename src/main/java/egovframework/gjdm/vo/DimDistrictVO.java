package egovframework.gjdm.vo;

import java.util.Date;

public class DimDistrictVO {
	private int districtId;
	private int nationId;
	private String distLvl1;
	private String distLvl2;
	private String distLvl3;
	private Date rgtrDt;
	private String rgtrId;
	private Date updtDt;
	private String updtId;
	
	public int getDistrictId() {
		return districtId;
	}
	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}
	public int getNationId() {
		return nationId;
	}
	public void setNationId(int nationId) {
		this.nationId = nationId;
	}
	public String getDistLvl1() {
		return distLvl1;
	}
	public void setDistLvl1(String distLvl1) {
		this.distLvl1 = distLvl1;
	}
	public String getDistLvl2() {
		return distLvl2;
	}
	public void setDistLvl2(String distLvl2) {
		this.distLvl2 = distLvl2;
	}
	public String getDistLvl3() {
		return distLvl3;
	}
	public void setDistLvl3(String distLvl3) {
		this.distLvl3 = distLvl3;
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
