package cn.ac.big.gsa.sys.pojo;
/*****************************************************
 * accroding to the tb_module
 * @author sweeter
 *
 */
public class Module {
private int moduleId;
private String moudleName;
private int pmoduleId;
private int moduleNumber;
private String moudleDesc;
private int grade;
private String createTime;
public int getModuleId() {
	return moduleId;
}
public String getMoudleName() {
	return moudleName;
}

public int getPmoduleId() {
	return pmoduleId;
}
public int getModuleNumber() {
	return moduleNumber;
}
public String getMoudleDesc() {
	return moudleDesc;
}
public int getGrade() {
	return grade;
}

public void setModuleId(int moduleId) {
	this.moduleId = moduleId;
}
public void setMoudleName(String moudleName) {
	this.moudleName = moudleName;
}

public void setPmoduleId(int pmoduleId) {
	this.pmoduleId = pmoduleId;
}
public void setModuleNumber(int moduleNumber) {
	this.moduleNumber = moduleNumber;
}
public void setMoudleDesc(String moudleDesc) {
	this.moudleDesc = moudleDesc;
}
public void setGrade(int grade) {
	this.grade = grade;
}
public String getCreateTime() {
	return createTime;
}
public void setCreateTime(String createTime) {
	this.createTime = createTime;
}

	
}
