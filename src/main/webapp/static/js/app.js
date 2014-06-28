angular.module('NHNGuestBookApp', [
  'NHNGuestBookApp.services',
  'NHNGuestBookApp.controllers'
]);

angular.module('NHNGuestBookApp.services', []).
factory('guestbookAPIservice', function($http) {

  var guestbookAPI = {};

  guestbookAPI.getArticles = function() {
    return $http({
      method: 'JSONP',
      url: '/article?callback=JSON_CALLBACK'
    });
  };

  return guestbookAPI;
});

angular.module('NHNGuestBookApp.controllers', []).
controller('articlesController', function($scope, guestbookAPIservice) {
    $scope.articles = [
      {
    	  no: 1,
          name: "ChangHun Lee",
          email: "loslch@naver.com",
          body: "hello world!",
          regtime: "August 24, 2012 at 20:18",
          modtime: "August 24, 2012 at 20:18"
      },
      {
    	  no: 2,
          name: "ChangHun Lee",
          email: "loslch@naver.com",
          body: "hello world2!",
          regtime: "August 24, 2012 at 20:18",
          modtime: "August 24, 2012 at 20:18"
      }
    ];

    guestbookAPIservice.getArticles().success(function (response) {
        //Dig into the responde to get the relevant data
        $scope.articles = response;
    });
});

