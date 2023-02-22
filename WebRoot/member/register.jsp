<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%@ page language="java" import="java.io.*"  import="java.util.Calendar,java.util.TimeZone" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>GSA| Register</title>
<link rel="stylesheet" type="text/css" href="/css/member.css" />
<link rel="stylesheet" type="text/css" href="/css/validation.css" />
<link href="/css/errorMsg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.min.js" ></script>
<script  type="text/javascript" src="/js/regjquery.min.js"></script>
<script  type="text/javascript" src="/js/regjquery-ui.min.js"></script>
<script  type="text/javascript" src="/js/scripts.min.js"></script>


<script type="text/javascript" src="/js/jquery.validate.js"></script>
  <script type="text/javascript" src="/js/register.validate.js"></script>
  <script type="text/javascript" language="javascript">
    $(function() {
      var handler = function() {
        $.ajax({
          url: '/sys/ajax/listCountries.action',
          type: 'post',
          dataType: 'json',
          success: processResult
        });
      };
      var processResult = function(data) {
        $("#countries").empty();
        //$("#countries").append("<option></option>");
        $.each(data.countries, refOption);
      };
      var refOption = function(index, value) {
        $("#countries").append("<option value='" + value.countryId + "'>" + value.countryName + "</option>");
      };
      handler();
    });
  </script>
</head>

<body>
<div class="login">
  <div class="login1">
    <div class="login1_1"><img src="/img/login.png" width="673" height="146" /></div>
    <div class="login1_1"><img src="/img/login_1.png" width="673" height="318" /></div>
    <div class="login1_1"><img src="/img/login_2.png" width="673" height="265" /></div>
  </div>
  <div class="login2">
    <div class="login2_1">
      <div class="login2_2"><a href="/"><img src="/img/in_logo2.png"/></a></div>
      <div class="login4">
        <div id="phizzForm" class="form">
          <div class="journeyProgress">
            <ul>
                <li class="currentStep"><i class="icon-user"></i><img src="/img/reg003.png" width="14" height="14"> Login</li>
                <li><i class="icon-lock"></i><img src="/img/reg002.png" width="14" height="14"> Personal</li>
                <li><i class="icon-comment-alt"></i><img src="/img/reg005.png" width="15" height="14"> Institutional</li>
            </ul>
        </div>
            <s:form  id="form_register" method="post" action="register" namespace="/account" theme="simple">
             	<s:token></s:token>
             	<input type="hidden" name="userId" value="<s:property value='#session.currentUser.userId' />" />
                <div class="formPanel">
                    <h2>Register Form Note:<span>*</span>means must needed field </h2>
                    <p>Account Login Information</p>
                    <div class="errors"><i class="icon-exclamation-sign"></i>
						Oops! You have entered some incorrect details.</div>
                    <fieldset>
                        <legend>Your details</legend>
                        <div class="formRow">
                            <div class="reg_left" style="width:120px;">Email<span>*</span></div>
                            <input type="text" id="email" name="email" style="width: 225px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:120px;">Password<span>*</span></div>
                            <input type="password" id="password" name="password" style="width: 225px;border: 1px solid #ccc;"/>
                            <div class="tooltip" style=" margin-left: 130px;">Password must consist of uppercase, lowercase and numbers, and with a length of 8 to 15.<i class="icon-caret-down"></i></div>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:120px;">Confirm password<span>*</span></div>
                            <input  type="password" id="confirmPassword" name="confirmPassword"  style="width: 225px;border: 1px solid #ccc;"/>
                            <div class="reg_bottom"><button class="buttonNext">Next</button></div>
                        </div>
                        <div class="formRow" style="color:red;">
                        	            <s:if test="emailFlag ==1"> Email cannot be empty.<br/>
            </s:if>
            <s:if test="emailFlag ==2"> This email is registered, please check.<br/>
            </s:if>
            
                        </div>
                    </fieldset>
                </div>
                <div class="formPanel">
                    <h2>Register Form Note:<span>*</span>means must needed field </h2>
                    <p>Personal Information </p>
                    <div class="errors"><i class="icon-exclamation-sign"></i>
						Oops! You have entered some incorrect details.</div>
                    <fieldset>
                        <legend>Account details</legend>
                        <div class="formRow">
                            <div class="reg_left" style="width:100px;">First Name<span>*</span></div>
                            <input type="text" id="firstName" name="firstName" style="width: 255px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:100px;">Middle Name</div>
                            <input type="text" id="middleName" name="middleName"  style="width: 255px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:100px;">Last Name<span>*</span></div>
                            <input  type="text" id="lastName" name="lastName"  style="width: 255px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:100px;">Street Address<span>*</span></div>
                            <input type="text" id="street" name="street" style="width: 255px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:100px;">City<span>*</span></div>
                            <input type="text" id="city" name="city" style="width: 255px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:100px;">State/Province</div>
                            <input type="text" id="state" name="state" style="width: 255px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:100px;">Postal Code<span>*</span></div>
                            <input type="text" id="postalCode" name="postalCode"  style="width: 255px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:100px;">Country<span>*</span></div>
                            <select id="countries" name="country.countryId" style="width:265px; height:28px; border: 1px solid #ccc;">
                                <option value="56" selected="selected">China</option>
                        		<option value="297">America</option>
                            </select>
                        </div>
                        <button class="buttonPrev">Previous</button>
                        <button class="buttonNext">Next</button>
                    </fieldset>
                </div>
                <div class="formPanel">
                    <h2>Register Form Note:<span>*</span>means must needed field </h2>
                    <p>Institutional Information </p>
                    <div class="errors"><i class="icon-exclamation-sign"></i>
						Oops! You have entered some incorrect details.</div>
                    <fieldset>
                        <legend>Other information</legend>
                        <div class="formRow">
                            <div class="reg_left" style="width:140px;">Institute/Oganization<span>*</span></div>
                            <input type="text" id="organization" name="organization" style="width: 215px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:140px;">Department<span>*</span></div>
                            <input type="text" id="department" name="department" style="width: 215px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:140px;">Lab</div>
                            <input type="text" id="lab" name="lab" style="width: 215px; border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:140px;">Title/Position</div>
                            <input type="text" id="title" name="title" style="width: 215px;border: 1px solid #ccc;"/>
                        </div>
                        <div class="formRow">
                            <div class="reg_left" style="width:140px;">Research area</div>
                            <input type="text" id="researchArea" name="researchArea" style="width: 215px;border: 1px solid #ccc;"/>
                            <div class="reg_bottom"><button class="buttonPrev">Previous</button>
                        <button class="buttonSubmit" type="submit">Submit</button></div>
                        </div>  
                                              
                    </fieldset>
                    <s:fielderror />
                    <div id="myErrorMsg"></div>
                    <div id="errorMsg"></div>
                </div>
            </s:form> 
        </div>
      </div>

     <script type="text/javascript" language="javascript">
       $('body').phizzForms({
       });
	   
	   function checkEmail(){
		var params = {
					email : $("#email").val()
						};
		$.ajax({
          url: '/sys/ajax/checkEmail.action',
          type: 'post',
          dataType: 'json',
          data: params,
          success: checkEmailResult
        });
	}
	function checkEmailResult(data) {
        //$("#countries").empty();
        //$("#countries").append("<option></option>");
        //$.each(data.countries, refOption);
        if(data.emailRegistered){
        	alert("This email has been registered already! Please try another one.");
        }else if(data.message!=null){
        	alert(data.message);
        }
      }
      
      function subForm(){
      	//alert("submit form.");
		$("#form_register").submit();
	  }
     </script>
    </div>
  </div>
</div>
<!-- header | end -->
<!-- manager1-->

<!-- manager1-end  -->
<div style="clear:both"></div>
<div class="login_foot">©BIG 2014-2015, Beijing Institute of Genomics, Chinese Academy of Sciences<br />
NO.1 Beichen West Road, Chaoyang District, Beijing 100101, China.</div>
</body>
</html>
