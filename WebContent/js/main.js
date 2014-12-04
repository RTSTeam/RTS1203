var app = angular.module('ui.bootstrap.demo', ['ui.bootstrap', 'mgcrea.ngStrap']);
app.controller('SearchCtrl', function ($scope, $window, $http) {
	$scope.tabs = [
	               { title:'Dynamic Title 1', content:'Dynamic content 1' },
	               { title:'Dynamic Title 2', content:'Dynamic content 2', disabled: true }
	               ];

	$scope.departureStationArray = [
	                                "Boston, MA - South Station (BOS)", 
	                                "Framingham, MA (FRA)",
	                                "Providence, RI (PVD)",
	                                "Westwood - Route 128, MA", 
	                                "Worcester, MA (WOR)"
	                                ];

	$scope.arrivalStationArray = [
	                              "Boston, MA - South Station (BOS)", 
	                              "Framingham, MA (FRA)",
	                              "Providence, RI (PVD)",
	                              "Westwood - Route 128, MA", 
	                              "Worcester, MA (WOR)"
	                              ];

	// Radio button
	//$scope.tripType = 'One Way';

	$scope.user = {
			tripType: "One Way",
			departureStationValue: "",
			arrivalStationValue: "",
			departureDate: "",
			departureTime:"",
			adultsValue: 1,
			seniorsValue: 0,
			childrenValue: 0
	};

	$scope.users = [];
	$scope.canShow = false;
	//	core function
	$scope.submitData = function (user, resultVarName) {
		var params = $.param({ 	
			tripType: user.tripType,
			departureStationValue: user.departureStationValue,
			arrivalStationValue: user.arrivalStationValue,
			departureDate: user.departureDate,
			departureTime: user.departureTime,
			adultsValue: user.adultsValue,
			seniorsValue: user.seniorsValue,
			childrenValue: user.childrenValue
		});
		$http({
			method: "POST",
			url: "http://localhost:8080/RTSProject/rest/search",
			data: params,
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).success(function (data, status, headers, config) {
			$scope[resultVarName] = data;
			if(angular.isArray(data.user)){
				$scope.users = data.user;
			}
			
			else{
				$scope.users[0]=data.user;
			}
			//$scope.users = data.user;
			$scope.canShow = true;
		}).error(function (data, status, headers, config) {
			$scope[resultVarName] = "SUBMIT ERROR";
		});
	};
	
	$scope.transactions = [];
	$scope.getTransactionData = function (useridinput, resultVarName) {
		var params = $.param({ 	
			userid: useridinput
		});
		$http({
			method: "POST",
			url: "http://localhost:8080/RTSProject/rest/usertransaction",
			data: params,
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).success(function (data, status, headers, config) {
			$scope[resultVarName] = data;
			
			if(angular.isArray(data.transaction)){
				$scope.transactions = data.transaction;
			}
			
			else{
				$scope.transactions[0]=data.transaction;
			}
			
			//$scope.transactions = data.transaction;
			$scope.canShow = true;
		}).error(function (data, status, headers, config) {
			$scope[resultVarName] = "SUBMIT ERROR";
		});
	};
	
	$scope.getAlert = function () {
		$window.alert("hi");
	};
});


