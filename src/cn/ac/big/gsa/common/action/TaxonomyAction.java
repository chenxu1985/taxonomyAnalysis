package cn.ac.big.gsa.common.action;

import cn.ac.big.gsa.common.pojo.RunTaxon;
import cn.ac.big.gsa.common.service.TaxonService;
import cn.ac.big.gsa.sys.pojo.User;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;

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
            } else{
                RunTaxon runTaxon = this.taxonService.selectRunTaxon(runAcc);
                if(runTaxon!=null){
                    //int publicRoot = runTaxon.getPublicRoot();
                    String dir = runTaxon.getArchivedFileDir();
                    int length = dir.split("/").length;
                    dir = dir.replace(dir.split("/")[length-1],"");
                    jsonPath = "treePath"+dir+runAcc+".json";
                    //kronaPath = "treePath"+dir+runAcc+".html";
                } else {
                    flag=1;
                }
            }
        } else {
            flag=1;
        }
        return SUCCESS;
    }

    public String openKrona(){

        RunTaxon runTaxon = this.taxonService.selectRunTaxon(runAcc);
        if(runTaxon!=null){
            String dir = runTaxon.getArchivedFileDir();
            int length = dir.split("/").length;
            dir = dir.replace(dir.split("/")[length-1],"");
            kronaPath = "treePath"+dir+runAcc+".html";
            String textPath = "/gsa_taxonomy"+dir+runAcc+".txt";
            String htmlPath = "/gsa_taxonomy"+dir+runAcc+".html";
            Process p =null;
            String[] arr = new String[]{"/home/gsagroup/software/krona/bin/ktImportText",textPath,"-o",htmlPath};
            for(String a:arr){
                System.out.println(a);
            }
            try {
                p = Runtime.getRuntime().exec(arr);
                p.waitFor();
            } catch (Exception e) {
                e.printStackTrace();
            }

            return SUCCESS;
        } else {
            return ERROR;
        }

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
