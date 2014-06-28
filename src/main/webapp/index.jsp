<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html ng-app="NHNGuestBookApp">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Hun's Guest Book</title>
  
  <!-- Bootstrap -->
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
  
  <link rel="stylesheet" href="<c:url value="/static/css/style.css" />">

  <!-- JQuery and Angular.js -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular-route.min.js"></script>
  
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>

  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <h1 class="text-center">Hun's Guest Book</h1>
        <hr>
        
        <form action="/article" method="post" role="form" class="">
          <div class="share">
            <div class="arrow"></div>
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="form-group col-md-8" style="padding-left: 0px">
                  <input type="email" name="email" placeholder="Email" class="form-control" autofocus>
                </div>
                <div class="form-group col-md-4" style="padding-right: 0px">
                  <input type="password" name="password" placeholder="Password" class="form-control">
                </div>
                <div class="form-group">
                  <textarea name="body" rows="3" class="form-control message" placeholder="Leave your message!"></textarea>
                </div>
              </div>
              <div class="panel-footer">
                <div class="row">
                  <div class="col-md-12">
                    <input type="submit" name="submit" value="Post" class="btn btn-primary pull-right">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
        <hr>
        
        <ul class="media-list" ng-controller="articlesController">
          <li class="media" ng-repeat="article in articles">
            <a class="pull-left" href="{{article.email}}">
              <img class="media-object article-author" src="http://placehold.it/64x64" alt="...">
            </a>
            <div class="media-body article">
              <div class="article-head">
                <h4 class="media-heading">{{article.name}} <span class="article-time">{{article.regtime}}</span></h4>
              </div>
              <div class="article-body">
              <p>{{article.body}}</p>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
  
  <script src="<c:url value="/static/js/app.js" />"></script>
</body>
</html>
