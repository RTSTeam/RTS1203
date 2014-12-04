<!doctype html>
<html ng-app="ui.bootstrap.demo">
  <head>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
    <script src="js/main.js"></script>
    <!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet"> -->
	
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.0/angular.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/angular-strap/2.1.2/angular-strap.tpl.min.js"></script>
	
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	
	<!--
    <link rel="stylesheet" href="http://mgcrea.github.io/angular-strap/styles/angular-motion.min.css">
    <link rel="stylesheet" href="http://mgcrea.github.io/angular-strap/styles/bootstrap-additions.min.css">
    <link rel="stylesheet" href="http://mgcrea.github.io/angular-strap/styles/libraries.min.css">
    <link rel="stylesheet" href="http://mgcrea.github.io/angular-strap/styles/main.min.css">
	-->
  </head>
  <body>

<div ng-controller="SearchCtrl">
  <br />
  <div>
  &nbsp; &nbsp; Hello, Guanyi.
  </div>
  <hr />

  <tabset>
    <tab heading="Personal Information">
		<p>Justified content</p>
	</tab>
    <tab heading="Search">
    <form name="userForm" class="css-form" ng-submit="submitData(user, 'ajaxResult')" novalidate>
		<div class="row">
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="onewayRadio" type="radio" ng-model="user.tripType" value="One Way"><label for="onewayRadio">One Way</label>
			</div>
			<div class="col-md-2">
				&nbsp; &nbsp; <input id="roundtripRadio" type="radio" ng-model="user.tripType" value="Round Trip" /><label for="roundtripRadio">Round Trip</label>
			</div>		 
		</div>
		<div>
			<p>&nbsp; &nbsp; Selected trip:{{user.tripType}}</p>   
		</div>
		
		<div>
			&nbsp; &nbsp; <label for="departureStationSel">From:</label>
			<select id="departureStationSel" ng-model="user.departureStationValue" ng-options="departureStation for departureStation in departureStationArray">
			</select>
		</div>
		<div>
			&nbsp; &nbsp; <label for="arrivalStationSel">To:&nbsp; &nbsp; &nbsp;</label>
			<select id="arrivalStationSel" ng-model="user.arrivalStationValue" ng-options="arrivalStation for arrivalStation in arrivalStationArray">
			</select>
		</div>
		
		<div>
			<p>&nbsp; &nbsp; Selected Departure: {{user.departureStationValue}}</p>
			<p>&nbsp; &nbsp; Selected Arrival: {{user.arrivalStationValue}}</p>
		</div>
		
		<div>
			&nbsp; &nbsp; <label class="control-label"><i class="fa fa-calendar"></i> Departure Time:</label><br>
			<div class="form-group">
				&nbsp; &nbsp; <input type="text" size="10" class="form-control" ng-model="user.departureDate" data-autoclose="1" placeholder="Date" bs-datepicker>
			</div>
			<div class="form-group" class="col-md-2">
				<input type="text" size="8" class="form-control" ng-model="user.departureTime" data-autoclose="1" placeholder="Time" bs-timepicker>
			</div>
		</div>
		
		<br />
		<div class="row">
			<div class="col-md-1">&nbsp; &nbsp;<strong>Adults:</strong></div>
			<div class="col-md-1"><strong>Seniors:</strong></div>
			<div class="col-md-1"><strong>Children:</strong></div>
		</div>
		<div class="row">
			<div class="col-md-1">&nbsp; &nbsp;<input type="number" min="0" max="10" value="{{user.adultsValue}}" ng-model="user.adultsValue"/></div>
			<div class="col-md-1"><input type="number" min="0" max="10" value="{{user.seniorsValue}}" ng-model="user.seniorsValue"/></div>
			<div class="col-md-1"><input type="number" min="0" max="10" value="{{user.childrenValue}}" ng-model="user.childrenValue"/></div>
		</div>
		
		<br />
		<div class="row">
			<div class="col-md-2">&nbsp; &nbsp;<button type="button" class="btn btn-warning" ng-click="resetForm()">Reset</button></div>
			<div class="col-md-2"><button type="submit" class="btn btn-success"ng-disabled="userForm.$invalid">Search</button></div>
		</div>
		<pre>form = {{user | json}}</pre>
	</form>
	<div ng-show="canShow">
		<table table class="table table-hover">
			<thead>
        		<tr>
        			<th>Ticket ID</th>
		            <th>From</th>
		            <th>To</th>
		            <th>Departure Time</th>
		            <th>Arrival Time</th>
		            <th>Price</th>
		            <th></th>
        		</tr>
      		</thead>
      		<tbody>
        		<tr ng-repeat="user in users">
        			<td>{{user.ticketID}}</td>
          		    <td>{{user.departureStationName}}</td>
          			<td>{{user.arrivalStationName}}</td>
          			<td>{{user.departureYear}}-{{user.departureMonth}}-{{user.departureDay}}&nbsp;{{user.departureHour}}:{{user.departureMinute}}</td>
          			<td>{{user.arrivalYear}}-{{user.arrivalMonth}}-{{user.arrivalDay}}&nbsp;{{user.arrivalHour}}:{{user.arrivalMinute}}</td>
          			<td>{{user.price}} Dollars</td>
          			<td>
          				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">Buy</button>
					</td>
        		</tr>
      		</tbody>
		</table>
	</div>
	
	<!-- Credit Card Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel">Enter Credit Card Information:</h4>
		      </div>
		      <div class="modal-body">
		      	<form role="form">
				  <div class="form-group">
				    <label for="cardNumber">Card Number</label>
				    <input type="text" class="form-control" ng-model="card.cardNumber" id="cardNumber" placeholder="Enter Card Number">
				  </div>
				  <div class="form-group">
				    <label for="csv">CSV</label>
				    <input type="password" class="form-control" ng-model="card.csv" id="csv" placeholder="CSV">
				  </div>
				  <div class="form-group">
				    <select ng-model="card.month" name="month" data-card-expiration required>
				      <option disabled selected value="">Month</option>
				    </select>
				    <select ng-model="card.year" name="year" required>
				      <option disabled selected value="">Year</option>
				    </select>
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" ng-click="checkout(user, 'ajaxResult')">Confirmed</button>
		      </div>
    		</div>
  		</div>
    </div>
   
	</tab>
    <!-- <tab heading="History" ng-click="getAlert()">  -->
	
	<tab heading="Transaction History" ng-click="getTransactionData('223', 'ajaxResult')">
		<div ng-show="canShow">
		<h2><font color="green" id="welcome">{{welcomeMsg}}</font></h2>
		<table border="1" width="200">
			<thead>
        		<tr>
		          <th>ticketid</th>
        		</tr>
      		</thead>
      		<tbody>
        		<tr ng-repeat="transaction in transactions">
          			<td>{{transaction.userID}}</td>
        		</tr>
      		</tbody>
		</table>
	</div> 
	</tab>
  </tabset>
  
  
  
  
  
</div>


</body>
</html>
