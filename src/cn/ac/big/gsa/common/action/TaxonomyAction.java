package cn.ac.big.gsa.common.action;

import cn.ac.big.gsa.common.pojo.RunTaxon;
import cn.ac.big.gsa.common.pojo.TaxonRun;
import cn.ac.big.gsa.common.service.TaxonService;
import org.apache.struts2.ServletActionContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
@Component
public class TaxonomyAction {
    private String gsaAcc;
    private String runAcc;
    private String jsonPath;
    private String kronaPath;
    private int flag;
    @Resource
    private TaxonService taxonService;
    public String detail() {
        System.out.println("Taxonmy Detail");
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
                    jsonPath = "/treePath"+dir+runAcc+".json";
                    //kronaPath = "treePath"+dir+runAcc+".html";
                } else {
                    flag=1;
                }
            }
        } else {
            flag=1;
        }
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("WW_TRANS_I18N_LOCALE")+"local");
        session.setAttribute("gsaAcc",gsaAcc);
        session.setAttribute("runAcc",runAcc);
        return SUCCESS;
    }

    public String openKrona(){

        RunTaxon runTaxon = this.taxonService.selectRunTaxon(runAcc);
        if(runTaxon!=null){
            String dir = runTaxon.getArchivedFileDir();
            int length = dir.split("/").length;
            dir = dir.replace(dir.split("/")[length-1],"");
            kronaPath = "/treePath"+dir+runAcc+".html";

            String textPath = "/taxonomy/release"+dir+runAcc+".txt";
            String htmlPath = "/taxonomy/release"+dir+runAcc+".html";
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
            }finally {
                if(p!=null){
                    p.destroy();
                }
            }

            return SUCCESS;
        } else {
            return ERROR;
        }

    }
    @Scheduled(cron = "0 0 2 * * ?") //每天2点钟执行
    public void autoDaily(){
        //System.out.println("test");
        List<TaxonRun> taxonRuns = this.taxonService.selectUnTaxonomyRunList();
        if(taxonRuns!=null){
            if(taxonRuns.size()!=0){
                System.out.println(taxonRuns.size());
                //        String outPath = "/Users/laphael/Downloads/";
                String outPath = "/taxonomy/daily/";
                String fileName = "";
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                fileName = "task"+sdf.format(new Date())+".txt";
                outPath = outPath + fileName;

                File toFile = new File(outPath);
                if(toFile.exists()){
                    toFile.delete();
                }
                try {
                    toFile.createNewFile();
                    FileWriter toWriter = new FileWriter(toFile);
                    BufferedWriter toOut = new BufferedWriter(toWriter);
                    if(taxonRuns.size()>0){
                        for(TaxonRun taxonRun:taxonRuns){
                            HashMap hashMap = new HashMap();
                            hashMap.put("accession",taxonRun.getRunAccession());
                            hashMap.put("isTaxonomy",5);
                            this.taxonService.updateRunTaxonomy(hashMap);
                            toOut.write(taxonRun.getCraAccession()+"\t"+taxonRun.getRunAccession()+"\t"+taxonRun.getDir()+"\n");
                        }
                    }
                    toOut.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            System.out.println(new Date()+": is null");
        }

    }

    @Scheduled(cron = "0 10 2 * * ?") //每天2点钟执行
    public void autoFinished(){
        String finishedPath = "/taxonomy/finished";
        String backupPath = "/taxonomy/backup";

//        String finishedPath = "/Users/laphael/Downloads/finished";
//        String backupPath = "/Users/laphael/Downloads/backup";
        //String outPath = "/taxonomy/finished/";
        File folder = new File(finishedPath);
        File[] listOfFiles = folder.listFiles();
        System.out.println(listOfFiles.length);
        ArrayList<String> errList = new ArrayList();
        ArrayList<String> finList = new ArrayList();
        for (File file : listOfFiles) {
            if (file.isFile()) {
                String name = file.getName();
                if(!name.contains(".e")&&!name.contains(".f")){
                    if(name.contains("error")){
                        errList.add(name);
                    } else if(name.contains("finish")){
                        finList.add(name);
                    }
                }
            }
        }
        if(errList!=null){
            Collections.sort(errList);
        }
        if(finList!=null){
            Collections.sort(finList);
        }
        for(String name:errList){
            String errName = finishedPath + "/" + name;
            String backName = backupPath + "/" + name;
            File file = new File(errName);
            InputStreamReader read = null;//考虑到编码格式
            try {
                read = new InputStreamReader(new FileInputStream(file),"GBK");
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                while((lineTxt = bufferedReader.readLine()) != null){
                    //解析文件具体路径
                    String acc =  lineTxt;
                    HashMap hashMap = new HashMap();
                    hashMap.put("accession",acc);
                    hashMap.put("isTaxonomy",2);
                    //System.out.println(acc);
                    this.taxonService.updateRunTaxonomy(hashMap);
                }
                Process p =null;
                String[] arr = new String[]{"mv",errName,backName};
                for(String a:arr){
                    System.out.println(a);
                }
                try {
                    p = Runtime.getRuntime().exec(arr);
                    p.waitFor();
                } catch (Exception e) {
                    e.printStackTrace();
                }finally {
                    if(p!=null){
                        p.destroy();
                    }
                }
                read.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        for(String name:finList){
            String errName = finishedPath + "/" + name;
            String backName = backupPath + "/" + name;
            File file = new File(errName);
            InputStreamReader read = null;//考虑到编码格式
            try {
                read = new InputStreamReader(new FileInputStream(file),"GBK");
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                while((lineTxt = bufferedReader.readLine()) != null){
                    //解析文件具体路径
                    String acc =  lineTxt;
                    HashMap hashMap = new HashMap();
                    hashMap.put("accession",acc);
                    hashMap.put("isTaxonomy",1);
                    //System.out.println(acc);
                    this.taxonService.updateRunTaxonomy(hashMap);
                }
                Process p =null;
                String[] arr = new String[]{"mv",errName,backName};
                for(String a:arr){
                    System.out.println(a);
                }
                try {
                    p = Runtime.getRuntime().exec(arr);
                    p.waitFor();
                } catch (Exception e) {
                    e.printStackTrace();
                }finally {
                    if(p!=null){
                        p.destroy();
                    }
                }
                read.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
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
