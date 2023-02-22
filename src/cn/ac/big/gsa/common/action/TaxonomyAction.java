package cn.ac.big.gsa.common.action;

import cn.ac.big.gsa.common.service.TaxonService;

import javax.annotation.Resource;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;

public class TaxonomyAction {
    private String gsaAcc;
    private String runAcc;
    private String jsonPath;
    private String kronaPath;
    private int flag;
    @Resource
    private TaxonService taxonService;
    public String detail() {
        flag=0;
        if(gsaAcc!=null&&runAcc!=null){
            int count =  this.taxonService.selectCraCount(gsaAcc,runAcc);
            if(count<=0){
                flag=1;
            }
        } else {
            flag=1;
        }
        return SUCCESS;
    }

    public String getGsaAcc() {
        return gsaAcc;
    }

    public void setGsaAcc(String gsaAcc) {
        this.gsaAcc = gsaAcc;
    }

    public String getRunAcc() {
        return runAcc;
    }

    public void setRunAcc(String runAcc) {
        this.runAcc = runAcc;
    }

    public String getJsonPath() {
        return jsonPath;
    }

    public void setJsonPath(String jsonPath) {
        this.jsonPath = jsonPath;
    }

    public String getKronaPath() {
        return kronaPath;
    }

    public void setKronaPath(String kronaPath) {
        this.kronaPath = kronaPath;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }
}
