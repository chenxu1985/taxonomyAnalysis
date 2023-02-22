<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="jumbotron" style="background-color: #f9f9f9; padding: 30px 15px 0 15px">
    <form class="form-horizontal" action="https://ngdc.cncb.ac.cn:80/search" method="get">
        <div class="form-group">
            <div class="row">
                <div class="col-md-3 col-md-offset-1" style="margin-right: 0;padding-right: 0;padding-left: 0">
                    <select class="form-control" name="dbId">
                        <option value="">All Databases</option>
                        <option value="BIGD People">NGDC People</option>
                        <option value="biocode">BioCode</option>
                        <option value="bioproject">BioProject</option>
                        <option value="biosample">BioSample</option>
                        <option value="DBCommons">Database Commons</option>
                        <option value="dbpaf">dbPAF</option>
                        <option value="deg">DEG</option>
                        <option value="doric">DoriC</option>
                        <option value="GEN">GEN</option>
                        <option value="gsa">GSA</option>
                        <option value="gvm">GVM</option>
                        <option value="gwh">GWH</option>
                        <option value="ic4r">IC4R</option>
                        <option value="lncrnadisease">LncRNADisease</option>
                        <option value="methbank">MethBank</option>
                        <option value="mmdb">MMDB</option>
                        <option value="plmd">PLMD</option>
                    </select>
                </div>
                <div class="col-md-6" style="margin-right: 0;margin-left: 0; padding-left: 0;padding-right: 0">
                    <input name="q" class="form-control" value=""  placeholder="Find a bioproject, biosample, gene, protein, tool, database or person">
                </div>

                <div class="col-md-1" style="margin-right: 0;margin-left: 0; padding-left: 0;padding-right: 0">
                    <button class="btn btn-info" type="submit" style="padding: 9px 15px"><span class="glyphicon glyphicon-search"></span></button>
                </div>
            </div>
            <span class="help-block text-center">e.g., <a
                    href="https://ngdc.cncb.ac.cn:80/search?dbId=&amp;q=PRJCA000126">PRJCA000126</a>;<a
                    href="https://ngdc.cncb.ac.cn:80/search?dbId=&amp;q=SAMC000385">SAMC000385</a>;<a
                    href="https://ngdc.cncb.ac.cn:80/search?dbId=&amp;q=tp53">tp53</a>;<a
                    href="https://ngdc.cncb.ac.cn:80/search?dbId=&amp;q=EGFR">EGFR</a>; <a
                    href="https://ngdc.cncb.ac.cn:80/search?dbId=&amp;q=human">human</a>; <a
                    href="https://ngdc.cncb.ac.cn:80/search?dbId=&amp;q=KaKs_Calculator">KaKs_Calculator</a>; <a
                    href="https://ngdc.cncb.ac.cn:80/search?dbId=&amp;q=GenBank">GenBank</a>; <a
                    href="https://ngdc.cncb.ac.cn:80/search?dbId=&amp;q=Zhang">Zhang</a>;

                </span>
        </div>
    </form>
</div>