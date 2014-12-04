<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Cover</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!--mobile version-->
	<meta name="viewpoint" content="width=device-width, initial-scale=1.0">
	<link href = "css/bootstrap.min.css" rel="stylesheet">
	<link href = "css/styles.css" rel="stylesheet">
	<!-- search css -->
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	
</head>

<body>
	<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
      <div class="container">

        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="search">Railway Trading System</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
	        	
          <form class="navbar-form navbar-right" role="form" action="<c:url value='j_spring_security_check'/>" method="POST" id="login-form">

            <div class="form-group">
              <input type="text" name="j_username" id="j_username" placeholder="Username" class="form-control"/>
            </div>

            <div class="form-group">
              <input type="password" name="j_password" id="j_password" placeholder="Password" class="form-control"/>
            </div>
            
			<button id="signin" type="submit" class="btn btn-success">Sign In</button>
          </form>
        </div><!--/.navbar-collapse -->

      </div><!--container-->
    </nav>

	<!-- wrong info -->
	    <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
	      <font color="red">
	        Invalid Id or Password <br/><br/>
	      </font>
    	</c:if>
			
    <div class="jumbotron">
      <div class="container">
        <h1>Hello, world!</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a class="btn btn-primary btn-lg" href="http://localhost:8080/RTSProject/registration.html" role="button">Sign up &raquo;</a></p>
      </div>
    </div>

	    <!--search-->
    <div class="Search">
		<div class="row">
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="onewayRadio" type="radio" ng-model="tripType" value="One Way"><label for="onewayRadio">One Way</label>
			</div>
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="roundtripRadio" type="radio" ng-model="tripType" value="Round Trip" /><label for="roundtripRadio">Round Trip</label>
			</div>		 
		</div>
		<div>
			<p>&nbsp; &nbsp; Selected trip:{{tripType}}</p>   
		</div>
		
		<div>
			&nbsp; &nbsp; <label for="departureStationSel">From:</label>
			<select id="departureStationSel" ng-model="departureStationValue" ng-options="departureStation for departureStation in departureStationArray">
			</select>
		</div>
		<div>
			&nbsp; &nbsp; <label for="arrivalStationSel">To:</label>
			<select id="arrivalStationSel" ng-model="arrivalStationValue" ng-options="arrivalStation for arrivalStation in arrivalStationArray">
			</select>
		</div>
		
		<div>
			<p>&nbsp; &nbsp; Selected Departure: {{departureStationValue}}</p>
			<p>&nbsp; &nbsp; Selected Arrival: {{arrivalStationValue}}</p>
		</div>
		<form name="timepickerForm" class="form-inline" role="form">
			<!-- Datetime example -->
			<div class="form-group">
				&nbsp; &nbsp; <label class="control-label"><i class="fa fa-calendar"></i> Departure Time:</label><br>
				<div class="form-group">
					&nbsp; &nbsp; <input type="text" size="10" class="form-control" ng-model="sharedDate" data-autoclose="1" placeholder="Date" bs-datepicker>
				</div>
				<div class="form-group" class="col-md-2">
					<input type="text" size="8" class="form-control" ng-model="sharedDate" data-autoclose="1" placeholder="Time" bs-timepicker>
				</div>
			</div>
		</form>
		
		<form name="timepickerForm" class="form-inline" role="form" ng-show="tripType == 'Round Trip'">
			<!-- Datetime example -->
			<div class="form-group">
				&nbsp; &nbsp; <label class="control-label"><i class="fa fa-calendar"></i> Return Time:</label><br>
				<div class="form-group">
					&nbsp; &nbsp; <input type="text" size="10" class="form-control" ng-model="sharedDate" data-autoclose="1" placeholder="Date" bs-datepicker>
				</div>
				<div class="form-group" class="col-md-2">
					<input type="text" size="8" class="form-control" ng-model="sharedDate" data-autoclose="1" placeholder="Time" bs-timepicker>
				</div>
			</div>
		</form>
		
		<br />
		<div class="row">
			<div class="col-md-1">&nbsp; &nbsp;<strong>Adults:</strong></div>
			<div class="col-md-1"><strong>Seniors:</strong></div>
			<div class="col-md-1"><strong>Children:</strong></div>
		</div>
		<div class="row">
			<div class="col-md-1">&nbsp; &nbsp;<input type="number" min="0" max="10" value="{{adultsValue}}" ng-model="adultsValue"/></div>
			<div class="col-md-1"><input type="number" min="0" max="10" value="{{seniorsValue}}" ng-model="seniorsValue"/></div>
			<div class="col-md-1"><input type="number" min="0" max="10" value="{{childrenValue}}" ng-model="childrenValue"/></div>
		</div>
		
		<br />
		<div class="row">
			<div class="col-md-2">&nbsp; &nbsp;<button type="button" class="btn btn-warning" ng-click="resetForm()">Reset</button></div>
			<div class="col-md-2"><button type="submit" class="btn btn-success"ng-disabled="userForm.$invalid">Search</button></div>
		</div>

		<br />

		<footer>
        	<p style="color:white">&copy; Jack, Andy, Charlie 2014</p>
      	</footer>

	</div>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/login.js"></script>
	
	<!-- search js -->
	<script src="js/search.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.tpl.min.js"></script>


</body>
</html>