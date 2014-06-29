angular.module('NHNGuestBookApp', [
  'NHNGuestBookApp.services',
  'NHNGuestBookApp.controllers',
  'NHNGuestBookApp.filter',
  'ngRoute'
])
.config(function($routeProvider){
  $routeProvider.when("/",
    {
      templateUrl: "/templates/new.html",
      controller: "articleCtrl"
    }
  );
  $routeProvider.when("/edit/:articleNo",
    {
      templateUrl: "/templates/edit.html",
      controller: "articleCtrl"
    }
  );
  $routeProvider.otherwise({
      redirectTo: '/'
  });
});

angular.module('NHNGuestBookApp.services', []).
factory('guestbookAPIservice', function($http) {

  var guestbookAPI = {};

  guestbookAPI.getArticles = function() {
    return $http({
      method: 'GET',
      url: 'article?callback=JSON_CALLBACK'
    });
  };

  guestbookAPI.getArticle = function(articleNo) {
    return $http({
      method: 'GET',
      url: 'article/'+articleNo+'?callback=JSON_CALLBACK'
    });
  };
  
  guestbookAPI.postArticle = function(article) {
    return $http({
        method: 'POST',
        url: 'article?callback=JSON_CALLBACK',
        data: article
      });
  };
  
  guestbookAPI.modifyArticle = function(article) {
    return $http({
        method: 'POST',
        url: 'article/'+article.no+'?callback=JSON_CALLBACK',
        data: article
      });
  };

  return guestbookAPI;
});

angular.module('NHNGuestBookApp.controllers', []).
controller('articleCtrl', function($scope, $location, $routeParams, guestbookAPIservice) {
    $scope.articles = [];

    $scope.getArticles = function() {
        guestbookAPIservice.getArticles().success(function (response) {
            // this callback will be called asynchronously
            // when the response is available
    		if (response.status === 'success') {
    	        $scope.articles = response.articles;
    	        
    	        if ($routeParams.articleNo) {
    	        	for (var i=0; i<$scope.articles.length; i++) {
    	        		if ($scope.articles[i].no == $routeParams.articleNo) {
    	        			$scope.no = $scope.articles[i].no;
    	        			$scope.email = $scope.articles[i].email;
    	        			$scope.body = $scope.articles[i].body;
    	        		}
    	        	}
    	        }
    		} else {
    			alert(response.message);
    		}
        }).
        error(function(data, status, headers, config) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
        });
    };
    
    $scope.postArticle = function() {
    	if (!$scope.email || !$scope.password || !$scope.body) {
    		return false;
    	}
    	
    	var article = new Article();
    	article.setEmail($scope.email);
    	article.setPassword($scope.password);
    	article.setBody($scope.body);
    	
    	guestbookAPIservice.postArticle(article).success(function (response) {
    		if (response.status === 'success') {
    			alert(response.message);
    			location.reload();
    		} else {
    			alert(response.message);
    		}
    	});
    };
    
    $scope.goPostArticle = function() {
    	$location.url('/');
    };
    
    $scope.modifyArticle = function() {
    	if (!$scope.no || !$scope.email || !$scope.password || !$scope.body) {
    		return false;
    	}
    	
    	var article = new Article();
    	article.setNo($scope.no);
    	article.setEmail($scope.email);
    	article.setPassword($scope.password);
    	article.setBody($scope.body);
    	
    	guestbookAPIservice.modifyArticle(article).success(function (response) {
    		if (response.status === 'success') {
    			alert(response.message);
    	    	location.href = location.href.replace(location.hash, '');
    		} else {
    			alert(response.message);
    		}
    	});
    };
    
    $scope.getArticles();
});

//to replace \n to <br/>
angular.module('NHNGuestBookApp.filter', [])
.filter('newlines', function () {
    return function(text) {
    	if(text)
        	return text.replace(/\n/g, '<br/>');
        return '';
    };
})
//to escape html tags
.filter('nohtml', function () {
    return function(text) {
        if(text)
	        return text
	            .replace(/&/g, '&amp;')
	            .replace(/>/g, '&gt;')
	            .replace(/</g, '&lt;');
	    return '';
    };
})
.filter('unsafe', function($sce) {
    return function(val) {
        return $sce.trustAsHtml(val);
    };
})
.filter('md5', function () {
    return function(text) {
    	if(text)
        	return CryptoJS.MD5(text).toString();
        return '';
    };
});