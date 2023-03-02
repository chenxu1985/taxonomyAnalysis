package cn.ac.big.gsa.common.pojo;

public class RunTaxon {
	private String accession;
    private int publicRoot;
    private String archivedFileDir;

    public String getAccession() {
        return accession;
    }

    public void setAccession(String accession) {
        this.accession = accession;
    }

    public int getPublicRoot() {
        return publicRoot;
    }

    public void setPublicRoot(int publicRoot) {
        this.publicRoot = publicRoot;
    }

    public String getArchivedFileDir() {
        return archivedFileDir;
    }

    public void setArchivedFileDir(String archivedFileDir) {
        this.archivedFileDir = archivedFileDir;
    }
}
