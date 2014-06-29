<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html ng-app="NHNGuestBookApp">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>Hun's Guest Book</title>
  
  <!-- Bootstrap -->
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
  
  <link rel="stylesheet" href="<c:url value="/static/css/style.css" />">

  <!-- JQuery and Angular.js -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/md5.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular-route.min.js"></script>
  
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body ng-app="NHNGuestBookApp">

  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <h1 class="text-center">Hun's Guest Book</h1>
        <hr>
        
        <div ng-view></div>
        <hr>
        
        <ul class="media-list" ng-controller="articleCtrl">
          <li class="media" ng-repeat="article in articles">
            <a class="pull-left">
              <img class="media-object article-author" src="http://www.gravatar.com/avatar/{{article.email | md5}}?d=mm&s=64">
            </a>
            <div class="media-body article">
              <div class="article-head">
                <h4 class="media-heading">
                {{article.email}}
                <a class="article-time" title="Modified by {{article.modtime}}">Created by {{article.regtime}}</a>
                <a class="article-modify" href="#/edit/{{article.no}}"><i class="glyphicon glyphicon-pencil"></i></a>
                </h4>
              </div>
              <div class="article-body">
                <p ng-bind-html="article.body | nohtml | newlines | unsafe"></p>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
  
  <script type="text/ng-template" id="/templates/new.html">
        <form role="form" class="" ng-controller="articleCtrl">
        <div class="share">
          <div class="arrow"></div>
          <div class="panel panel-default">
            <div class="panel-body">
              <div class="form-group col-md-8 email-form">
                <input type="email" name="email" placeholder="Email" class="form-control" autofocus ng-model="email" required>
              </div>
              <div class="form-group col-md-4 password-form">
                <input type="password" name="password" placeholder="Password" class="form-control" ng-model="password" required>
              </div>
              <div class="form-group">
                <textarea name="body" rows="3" class="form-control message" placeholder="Leave your message!" ng-model="body" required></textarea>
              </div>
            </div>
            <div class="panel-footer">
              <div class="row">
                <div class="col-md-12">
                  <button class="btn btn-primary pull-right" ng-click="postArticle()">Post</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        </form>
  </script>
  <script type="text/ng-template" id="/templates/edit.html">
        <form role="form" class="" ng-controller="articleCtrl">
        <div class="share">
          <div class="arrow"></div>
          <div class="panel panel-default">
            <div class="panel-body">
              <div class="form-group col-md-8 email-form">
                <input type="email" name="email" placeholder="Email" class="form-control" autofocus ng-model="email" required>
              </div>
              <div class="form-group col-md-4 password-form">
                <input type="password" name="password" placeholder="Password" class="form-control" ng-model="password" required>
              </div>
              <div class="form-group">
                <textarea name="body" rows="3" class="form-control message" placeholder="Leave your message!" ng-model="body" required></textarea>
              </div>
            </div>
            <div class="panel-footer">
              <div class="row">
                <div class="col-md-12">
                  <button class="btn btn-danger pull-left" ng-click="goPostArticle()">Cancel</button>
                  <button class="btn btn-primary pull-right" ng-click="modifyArticle()">Modify</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        </form>
  </script>
  
  <script src="<c:url value="/static/js/article.js" />"></script>
  <script src="<c:url value="/static/js/app.js" />"></script>
</body>
</html>
