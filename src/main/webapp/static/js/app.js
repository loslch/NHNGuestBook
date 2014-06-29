angular.module('NHNGuestBookApp', [
  'NHNGuestBookApp.services',
  'NHNGuestBookApp.controllers',
  'NHNGuestBookApp.filter'
]);

angular.module('NHNGuestBookApp.services', []).
factory('guestbookAPIservice', function($http) {

  var guestbookAPI = {};

  guestbookAPI.getArticles = function() {
    return $http({
      method: 'GET',
      url: 'article?callback=JSON_CALLBACK'
    });
  };
  
  guestbookAPI.postArticle = function(article) {
    return $http({
        method: 'POST',
        url: 'article?callback=JSON_CALLBACK',
        data: article
      });
  };

  return guestbookAPI;
});

angular.module('NHNGuestBookApp.controllers', []).
controller('articleCtrl', function($scope, guestbookAPIservice) {
    $scope.articles = [];

    $scope.getArticles = function() {
        guestbookAPIservice.getArticles().success(function (response) {
            // this callback will be called asynchronously
            // when the response is available
    		if (response.status === 'success') {
    	        $scope.articles = response.articles;
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
});
