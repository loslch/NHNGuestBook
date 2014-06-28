angular.module('NHNGuestBookApp', [
  'NHNGuestBookApp.controllers'
]);

angular.module('NHNGuestBookApp.controllers', []).
controller('articlesController', function($scope) {
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
});

