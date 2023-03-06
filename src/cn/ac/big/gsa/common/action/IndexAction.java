package cn.ac.big.gsa.common.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class IndexAction extends ActionSupport {
    private String gsaAcc;
    private String runAcc;
    public String index() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        gsaAcc = (String) session.getAttribute("gsaAcc");
        runAcc = (String) session.getAttribute("runAcc");
        if(gsaAcc==null){
            return "index";
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
}
