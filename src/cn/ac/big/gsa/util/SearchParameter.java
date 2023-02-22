package cn.ac.big.gsa.util;


public class SearchParameter
{	
	private String term;
	private int offset;
	private int limit;

	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public SearchParameter(String term, int offset, int limit) {
		super();
		this.term = term;
		this.offset = offset;
		this.limit = limit;
	}
	public SearchParameter() {
		super();
	}
	
}
