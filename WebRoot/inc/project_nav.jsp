<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java"  pageEncoding="UTF-8"%>

<div id="projectSubmissionPart1" class="container" style="background-color:#ebeef3;">
	<ol class="breadcrumb">
	  <li><a href="/">Home</a></li>
	  <li><a>Gsub</a></li>
	  <li><a href="/submit/project/list">BioProject</a></li>
	  <li class="active">New BioProject</li>
	</ol>
</div>

<div id="projectSubmissionPart2" class="container" style="background-color:#ebeef3;height:auto">
	<div id="submitNav1" class="row">
		<!-- <div class="col-md-1 col-sm-12 col-xs-12"></div> -->
		<div class="col-md-2 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:1px"><a class="badge-active" href='submitter'>01<br/><span class="txt-span">Submitter</span></a></div>
		<div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom:1px"><a class="badge-active" href='general'>02<br/><span class="txt-span">General Information</span></a></div>
		<div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom:1px"><a class="badge-active" href='type'>03<br/><span class="txt-span">Project Type</span></a></div>
		<div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom:1px"><a class="badge-active" href="publication">04<br/><span class="txt-span">Publication</span></a></div>
		<div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom:1px"><a class="badge-active" href="overview">05<br/><span class="txt-span">Overview</span></a></div>
		<!-- <div class="col-md-1 col-sm-12 col-xs-12"></div> -->
	</div>
  	<%-- <div id="submitNav2" class="row">
		<div class="col-md-1 col-sm-1 col-xs-1" style="width:11%"><a class="pull-right" href="submitter"><span>Submitter</span></a></div>
		<div class="col-md-2 col-sm-2 col-xs-2" style="width:24%"><a class="pull-right" href="general"><span>General Information</span></a></div>
		<div class="col-md-2 col-sm-2 col-xs-2" style="width:20%"><a class="pull-right" href="type"><span>Project Type</span></a></div>
		<!-- <div class="col-md-2 col-sm-2" style="width:15%"><a class="pull-right" href="target"><span>Target</span></a></div> -->
		<div class="col-md-2 col-sm-2 col-xs-2" style="width:21%"><a class="pull-right" href="publication"><span>Publication</span></a></div>
		<div class="col-md-1 col-sm-1 col-xs-1" style="width:21%"><a class="pull-right" href="overview"><span>Overview</span></a></div>
	</div> --%>
</div>

<!-- 
<div class="row" id="submitNav">
    <div class="col-md-12">
        <ul class="nav nav-pills nav-justified thumbnail">
            <li class="">
            	<a href="submitter"> <h4 class="list-group-item-heading">Step 1</h4> <p class="list-group-item-text">Submitter</p> </a>
            </li>
            <li class="">
            	<a href="general">  <h4 class="list-group-item-heading">Step 2</h4>  <p class="list-group-item-text">General Info</p> </a>
            </li>
            <li class="active">
            	<a href="type">   <h4 class="list-group-item-heading">Step 3</h4>   <p class="list-group-item-text">Project Type</p>  </a>
            </li>
            <li class="disabled">
            	<a href="publication">  <h4 class="list-group-item-heading">Step 4</h4> <p class="list-group-item-text">Publication</p> </a>
            </li>
            <li class="disabled">
            	<a href="overview">  <h4 class="list-group-item-heading">Step 5</h4> <p class="list-group-item-text">Overview</p> </a>
           	</li>
        </ul>
    </div>
</div> -->
