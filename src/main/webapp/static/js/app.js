angular.module('NHNGuestBookApp', [
  'NHNGuestBookApp.services',
  'NHNGuestBookApp.controllers'
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

  return guestbookAPI;
});

angular.module('NHNGuestBookApp.controllers', []).
controller('articlesController', function($scope, guestbookAPIservice) {
    $scope.articles = [];

    guestbookAPIservice.getArticles().success(function (response) {
        // this callback will be called asynchronously
        // when the response is available
    	
        $scope.articles = response.articles;
    }).
    error(function(data, status, headers, config) {
        // called asynchronously if an error occurs
        // or server returns response with an error status.
    });
});

