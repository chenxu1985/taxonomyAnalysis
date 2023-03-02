<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ taglib prefix="if" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>NGDC - Taxonomy Analysis</title>
	<jsp:include page="/inc/css_js.jsp"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap-table.min.css" />
	<script type="text/javascript" src="js/bootstrap-table.min.1.14.1.js"></script>
</head>
<body>
<jsp:include page="/inc/header_taxonomy.jsp"/>
<link href="DataTables/SemanticUI-2.2.13/semantic.min.css" type="text/css" rel="stylesheet">
<%--<link href="css/cra/jquery.treeview.css" type="text/css" rel="stylesheet">--%>
<link href="QTableTree/css/reset.css" rel="stylesheet">
<link href="QTableTree/QiangTableTree/jquery.qtt.min.css" rel="stylesheet">
<link href="QTableTree/QiangTableTree/skin/default.css" rel="stylesheet">
<link href="QTableTree/css/worldcupteam.css" rel="stylesheet">
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="https://ngdc.cncb.ac.cn/gsa/">Home</a></li>
			<li><a href="https://ngdc.cncb.ac.cn/gsa/browse/">Browse</a></li>
			<li><a href="https://ngdc.cncb.ac.cn/gsa/browse/<s:property value="gsaAcc" />"><s:property value="gsaAcc" /></a></li>
			<li><a href="https://ngdc.cncb.ac.cn/gsa/browse/<s:property value="gsaAcc" />/<s:property value="runAcc" />"><s:property value="runAcc" /></a></li>
			<li class="active">Taxonomy Analysis</li>
		</ol>
		<s:if test="flag==0">
			<div class="panel panel-info">
				<!-- General info -->
				<div class="panel-heading"><s:text name="gsa.taxonomyDetail.taxonomyAnalysis"/></div>
				<div class="panel-body">
					<div class="ui mini statistics" style="padding:1em 0">
						<div class="ui green statistic">
							<div class="value" id="identified"></div>
							<div class="label" style="font-size: 14px;">Identified reads</div>
						</div>
						<div class="ui red statistic">
							<div class="value" id="unidentified"></div>
							<div class="label" style="font-size: 14px;">Unidentified reads</div>
						</div>
					</div>

					<div id="qiang-table-tree" class="qiang-table-tree" style="margin-top: -100px;margin-bottom: 20px;">
						<div>
							<div class="treeHeaderBox">
								<span class="tLabel"></span>
								<ul class="tValue">
								</ul>
							</div>
						</div>
						<div class="QTTContainer">
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-info">
				<!-- General info -->
				<div class="panel-heading"><s:text name="gsa.taxonomyDetail.useKrona"/></div>
				<div class="panel-body">
					<div style="margin-right: 10px;margin-left: 10px;">
						<span style="color: #21b8ff" onclick="openKrona()" id="option_krona">Show Krona View</span>
						<iframe id="kronaDisplay" class="expand-body" width="100%" height="1200" frameborder="no" src="<s:property value='kronaPath' />" style="display: none"></iframe>
							<%--<iframe id="kronaDisplay" class="expand-body" width="100%" height="1100" frameborder="no" src="http://192.168.164.20:9286/gsa-human/treePath/krona_SRR13402847_dense.html" style="display: none"></iframe>--%>
					</div>
				</div>
			</div>
		</s:if>
		<s:else>
			<div class="panel panel-info">
			<!-- General info -->
			<div class="panel-heading">Taxonomy Analysis</div>
			<div class="panel-body">
				<div>
					The data you are retrieving does not exist in GSA: <s:property value='runAcc'/>
				</div>
			</div>
		</div>
		</s:else>

		<script type="text/javascript" src="QTableTree/QiangTableTree/jquery.qtt.min.js"></script>
		<script type="text/javascript">
			(function($) {
				'use strict';
				$(function() {
					var jsonPath = "<s:property value='jsonPath' />";

					var QTT = window.QTT.qiangTableTree( {
						TreeBox : $('#qiang-table-tree'),
						createNodeIconHTML: function( nodeObj ){
							return '';
						},
						createNodeNameHTML: function( nodeObj ){
							var valueObj = nodeObj.value ;
							var flagName = '' ;
							if(nodeObj.percent=="100%"){
								return '';
							} else {
								return flagName + nodeObj.name+": "+nodeObj.percent ;
							}
						},
						createNodeBarHTML: function( nodeObj ){
							return '' ;
						},
						createNodeValueHTML: function( nodeObj ){
							return '' ;
						}
					});
					$.getJSON(jsonPath, function (data) {
						QTT.updateTree( data );
					});

					// QTT.shrinkAllNode();
					// QTT.expandFirstNode();
					var leafNode = $('.qiang-table-tree .qttLeaf');
					var flagNode = $('.qiang-table-tree .qttLeaf .t-text');

					window.treeNodePosition = [];
					flagNode.each( function( index , domObj ){
						window.treeNodePosition.push( {
							x: $(domObj).offset().left + 20,
							y: $(domObj).offset().top + 10
						} );
					});
					$( window ).resize( function(){
						QTT.resizeFn();
					});

					$('#search-input').keydown(function(e){
						if( e.keyCode===13){
							var keyword = $('#search-input').val();
							if( keyword !== '' ){
								var resultArray = QTT.findNode( keyword );
								if( resultArray.length > 0  ){
									QTT.highlightNode( resultArray );
									QTT.expandToNode( resultArray );
								}
							}
							return ;
						}
					});

				});
			})(jQuery);
			function openKrona(){
				var option_krona = $("#option_krona").html();
				if(option_krona=='Show Krona View'){
					$("#kronaDisplay").css("display","table-row");
					$("#option_krona").html("Hide Krona View");
				} else if(option_krona=='Hide Krona View'){
					$("#kronaDisplay").css("display","none");
					$("#option_krona").html("Show Krona View");
				}
			}
		</script>
</body>
</html>