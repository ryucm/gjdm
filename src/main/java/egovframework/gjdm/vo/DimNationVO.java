package egovframework.gjdm.vo;

import java.util.Date;

public class DimNationVO {
	private int nation_id;
	private String nation_nm;
	private String nation_nm_en;
	private String iso_cd;
	private String iso3_cd;
	private String iso_no;
	private String continent;
	private Date rgtr_dt;
	private String rgtr_id;
	private Date updt_dt;
	private String updt_id;
	
	public int getNation_id() {
		return nation_id;
	}
	public void setNation_id(int nation_id) {
		this.nation_id = nation_id;
	}
	public String getNation_nm() {
		return nation_nm;
	}
	public void setNation_nm(String nation_nm) {
		this.nation_nm = nation_nm;
	}
	public String getNation_nm_en() {
		return nation_nm_en;
	}
	public void setNation_nm_en(String nation_nm_en) {
		this.nation_nm_en = nation_nm_en;
	}
	public String getIso_cd() {
		return iso_cd;
	}
	public void setIso_cd(String iso_cd) {
		this.iso_cd = iso_cd;
	}
	public String getIso3_cd() {
		return iso3_cd;
	}
	public void setIso3_cd(String iso3_cd) {
		this.iso3_cd = iso3_cd;
	}
	public String getIso_no() {
		return iso_no;
	}
	public void setIso_no(String iso_no) {
		this.iso_no = iso_no;
	}
	public String getContinent() {
		return continent;
	}
	public void setContinent(String continent) {
		this.continent = continent;
	}
	public Date getRgtr_dt() {
		return rgtr_dt;
	}
	public void setRgtr_dt(Date rgtr_dt) {
		this.rgtr_dt = rgtr_dt;
	}
	public String getRgtr_id() {
		return rgtr_id;
	}
	public void setRgtr_id(String rgtr_id) {
		this.rgtr_id = rgtr_id;
	}
	public Date getUpdt_dt() {
		return updt_dt;
	}
	public void setUpdt_dt(Date updt_dt) {
		this.updt_dt = updt_dt;
	}
	public String getUpdt_id() {
		return updt_id;
	}
	public void setUpdt_id(String updt_id) {
		this.updt_id = updt_id;
	}
	
	
}
