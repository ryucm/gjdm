package egovframework.gjdm.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DimDistrictVO {
	private int districtId;
	private int nationId;
	private String distLvl1;
	private String distLvl1Cd;
	private String distLvl1CdSync;
	private String distLvl2;
	private String distLvl2Cd;
	private String distLvl2CdSync;
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
	public String getDistLvl1Cd() {
		return distLvl1Cd;
	}
	public void setDistLvl1Cd(String distLvl1Cd) {
		this.distLvl1Cd = distLvl1Cd;
	}
	public String getDistLvl1CdSync() {
		return distLvl1CdSync;
	}
	public void setDistLvl1CdSync(String distLvl1CdSync) {
		this.distLvl1CdSync = distLvl1CdSync;
	}
	public String getDistLvl2() {
		return distLvl2;
	}
	public void setDistLvl2(String distLvl2) {
		this.distLvl2 = distLvl2;
	}
	public String getDistLvl2Cd() {
		return distLvl2Cd;
	}
	public void setDistLvl2Cd(String distLvl2Cd) {
		this.distLvl2Cd = distLvl2Cd;
	}
	public String getDistLvl2CdSync() {
		return distLvl2CdSync;
	}
	public void setDistLvl2CdSync(String distLvl2CdSync) {
		this.distLvl2CdSync = distLvl2CdSync;
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