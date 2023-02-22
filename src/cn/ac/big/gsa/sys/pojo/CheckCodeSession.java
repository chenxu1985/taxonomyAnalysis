package cn.ac.big.gsa.sys.pojo;

public class CheckCodeSession {
	private String checkCode;//验证码
	private long createTime;//创建时间
	private boolean validate = false;//是否有效(默认无效)
	public String getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	public long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}
	public boolean isValidate() {
		return validate;
	}
	public void setValidate(boolean validate) {
		this.validate = validate;
	}
}