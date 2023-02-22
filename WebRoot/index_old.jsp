<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>BioProject</title>
    <jsp:include page="/inc/css_js.jsp"/>
    <script src="js/cra/highcharts.js"></script>
	<script src="js/cra/exporting.js"></script>
  </head>
  <body>
    <jsp:include page="/inc/header_project.jsp"/>
    <div class="container" style="padding-top:20px;">
    	<div class="row">
    		<div class="col-md-8">
    			<div class="panel panel-default">
				  <div class="panel-heading">
				    <div class="panel-title">Wlecome to BioProject</div>
				  </div>
				  <div class="panel-body">
				    <p>A BioProject is a collection of biological data related to a single initiative, originating from a single organization or from a consortium. A BioProject record provides users a single place to find links to the diverse data types generated for that project.</p>
				    <p><a style="font-size:16px;font-style:italic" href="https://ngdc.cncb.ac.cn/gdsd" target="_blank">China Genomic Data Sharing Initiative</a></p>
				    
				    <div class="row" style="margin-top:30px;margin-bottom:10px;">
				    	<a class="block-a col-md-3 col-sm-6 col-xs-12" href="/submit/project/list">
				    	<h4>Submit</h4>
				    	<p>Deposit meta-information into BIGD databases</p>
				    	<img class="gray-light" src="img/cra/submit-1.png">
				    	</a>
				    	<a class="block-a col-md-3 col-sm-6 col-xs-12" href="ftp://download.big.ac.cn/gsa/">
				    	<h4>Download</h4>
				    	<p>Transfer GSA data to your computer</p>
				    	<img class="gray-light" src="img/cra/download-1.png" >
				    	</a>
				    	<a class="block-a col-md-3 col-sm-6 col-xs-12" href="browse">
				    	<h4>Browse</h4>
				    	<p>View meta-informations about the released data</p>
				    	<img class="gray-light" src="img/cra/browse-1.png" >
				    	</a>
				    	<a class="block-a col-md-3 col-sm-6 col-xs-12" href="document/start_here.jsp">
				    	<h4>Documents</h4>
				    	<p>Find help documents to learn about the database</p>
				    	<img class="gray-light" src="img/cra/documents-1.png" >
				    	</a>
				    </div>

				  </div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
				    	<div class="panel-title">BioProject Growth</div>
				  	</div>
				  	<div class="panel-body">
					  	<div class="col-md-12 col-sm-12 col-xs-12">
					  		<div id="chartP"></div>
					  	</div>
				  	</div>
				</div>
    		</div>
    		
    		<div class="col-md-4">
    			
    			<div class="panel panel-info">
				  <div class="panel-heading">
				    <div class="panel-title"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span>&nbsp;&nbsp;Related Databases</div>
				  </div>
				  <div class="panel-body">
			    	<div style="margin:10px 0;"><a href="/index_s.jsp">BioSample</a></div>
			    	<div style="margin:10px 0;"><a href="/index.jsp">GSA</a></div>
				  </div>
				</div>
    			
    			<div class="panel panel-info">
				  <div class="panel-heading">
				    <div class="panel-title"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;Approval Degree</div>
				  </div>
				  <div class="panel-body"  style="padding-right:10px;">
				    <ul>
				    	<li>Data submissions to GSA have been reported by multiple high-profile journals, including PNAS, AJHG, Cell Research, etc.</li>
				    	<li><a target="_blank" href="http://dx.doi.org/10.1038/cr.2015.150"><img alt="gsa" src="img/journal/Cell Research.png" style="width:110px;height:30px;"></a>
				    		<a target="_blank" href="http://genome.cshlp.org/content/early/2016/11/14/gr.204925.116"><img alt="gsa" src="img/journal/genome_research.png" style="width:110px;height:30px;"></a>
				    		<a target="_blank" href="https://academic.oup.com/mbe/article-lookup/doi/10.1093/molbev/msw280"><img alt="gsa" src="img/journal/mbe.png" style="width:110px;height:30px;"></a>
				    	</li>
				    	<li><a target="_blank" href="http://dx.doi.org/10.1016/j.cub.2016.05.012"><img alt="gsa" src="img/journal/Current Biology.png" style="width:110px;height:30px;"></a>
				    		<a target="_blank" href="http://dx.doi.org/10.1073/pnas.1519556112"><img alt="gsa" src="img/journal/PNAS.png" style="width:110px;height:30px;"></a>
				    		<a target="_blank" href="http://dx.doi.org/10.1016/j.stemcr.2016.04.013"><img alt="gsa" src="img/journal/STEM CELL REPORTS.png" style="width:110px;height:30px;"></a>
				    	</li>
				    	<li><a target="_blank" href="http://dx.doi.org/10.1242/jcs.182261"><img alt="gsa" src="img/journal/Journal of Cell Science.png" style="width:110px;height:30px;"></a>
				    		<a target="_blank" href="http://dx.doi.org/10.1016/j.ajhg.2016.07.002"><img alt="gsa" src="img/journal/AJHG.png" style="width:110px;height:30px;"></a>
				    	</li>
				    </ul>
				  </div>
				</div>				
				<div class="panel panel-info">
				  <div class="panel-heading">
				    <div class="panel-title"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>&nbsp;&nbsp;Problems or Questions?</div>
				  </div>
				  <div class="panel-body">
				    <p>As birthed on May 2015, GSA is still at its infant stage. If you have any question or would like to give us any suggestion/comment or report a bug, please feel free to contact us. </p>
				    <p>Email: <a href="mailto:gsa@big.ac.cn">gsa@big.ac.cn</a></p>
				    <p>QQ group: <a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=61f3fb4bf0de81ee451a6684c2444d23763685bf9d91accab744bb7d97e77c58">548170081</a></p>
				    <p>We highly appreciate your comments and suggestions for further improving its functionalities and providing better services. </p>
				  </div>
				</div>
    		</div>
    	</div>
    </div>
<script type="text/javascript">
$(function () {    
    chartP = new Highcharts.chart('chartP',{
        title: { text: 'BioProject Growth',style: { color: '#800040',  fontSize: '15px' }},
        xAxis: [{
        	lineColor: '#000',
            lineWidth: 2,
        	type: 'category',
        	labels: { 
                style: { color: '#000',}
            },
        }],
        yAxis: [{ // Primary yAxis
            labels: { format: '{value}',
                	style: { color: '#000',}
            },
            title: { text: '',
                	style: { color: '#000', }
            }
        }],
        tooltip: { shared: true },
        legend: {
            //layout: 'vertical',
            align: 'left',
            x: 100,
            verticalAlign: 'top',
            y: 50,
            floating: true,
        },
        series: [{
            name: 'BioProject',
            
            color:'#0100C7',
            tooltip: {
                valueSuffix: ' '
            }
        }]
    });
    chaxun();
});
    function chaxun(){
        $.ajax({
            type:'post',
            url:'browse/chart/ajax/listChartData',
			async : false,
			dataType : 'json',
            success: function(data){
              	chartP.xAxis[0].setCategories(data.monthX);
              	chartP.series[0].setData(data.proN);
            },
            error:function(e){alert("对不起，查询出错了。");} 
        });
	};

</script> 
  </body>
</html>
