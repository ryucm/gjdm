package egovframework.gjdm.vo;

import java.util.Date;

public class EtlBatchVO {
	private int etlId;
	private String jobType;
	private String etlName;
	private String etlDesc;
	private String frqBase;
	private String frqNum;
	private String etlParam;
	private String srcSystem;
	private String tgtSystem;
	private Date rgtrDt;
	private String rgtrId;
	private Date updtDt;
	private String updtId;
	
	public int getEtlId() {
		return etlId;
	}
	public void setEtlId(int etlId) {
		this.etlId = etlId;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getEtlName() {
		return etlName;
	}
	public void setEtlName(String etlName) {
		this.etlName = etlName;
	}
	public String getEtlDesc() {
		return etlDesc;
	}
	public void setEtlDesc(String etlDesc) {
		this.etlDesc = etlDesc;
	}
	public String getFrqBase() {
		return frqBase;
	}
	public void setFrqBase(String frqBase) {
		this.frqBase = frqBase;
	}
	public String getFrqNum() {
		return frqNum;
	}
	public void setFrqNum(String frqNum) {
		this.frqNum = frqNum;
	}
	public String getEtlParam() {
		return etlParam;
	}
	public void setEtlParam(String etlParam) {
		this.etlParam = etlParam;
	}
	public String getSrcSystem() {
		return srcSystem;
	}
	public void setSrcSystem(String srcSystem) {
		this.srcSystem = srcSystem;
	}
	public String getTgtSystem() {
		return tgtSystem;
	}
	public void setTgtSystem(String tgtSystem) {
		this.tgtSystem = tgtSystem;
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