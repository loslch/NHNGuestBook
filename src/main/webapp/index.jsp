<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html ng-app>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Hun's GuestBook</title>
  
  <!-- Bootstrap -->
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
  
  <link rel="stylesheet" href="<c:url value="/static/css/style.css" />">
  
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
        
        <form action="#" method="post" role="form" enctype="multipart/form-data" class="facebook-share-box">
          <div class="share">
            <div class="arrow"></div>
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="">
                  <textarea name="message" cols="40" rows="10" id="status_message" class="form-control message"
                  style="height: 62px; overflow: hidden;" placeholder="Leave your message!"></textarea>
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
        
        <ul class="media-list">
          <li class="media">
            <a class="pull-left" href="#">
              <img class="media-object article-author" src="http://placehold.it/64x64" alt="...">
            </a>
            <div class="media-body article">
              <div class="article-head">
                <h4 class="media-heading">Media heading <span class="article-time">August 24, 2012 at 20:18</span></h4>
              </div>
              <div class="article-body">
              <p>difajdfjasodjfasioidjfoaijeoifasjiofjsdiofasdfasdfasdfasdfasdfasdfasdfasdfasefasfasdfasdfasjdjdif difajdfjasodjfasioidjfoaijeoifasjiofjsdiofasdfasdfasdfasdfasdfasdfasdfasdfasefasfasdfasdfasjdjdif difajdfjasodjfasioidjfoaijeoifasjiofjsdiofasdfasdfasdfasdfasdfasdfasdfasdfasefasfasdfasdfasjdjdif</p>
              </div>
            </div>
          </li>
          
          <li class="media">
            <a class="pull-left" href="#">
              <img class="media-object article-author" src="http://placehold.it/64x64" alt="...">
            </a>
            <div class="media-body article">
              <div class="article-head">
                <h4 class="media-heading">Media heading <span class="article-time">August 24, 2012 at 20:18</span></h4>
              </div>
              <div class="article-body">
              <p>한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 한글로 </p>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular.min.js"></script>
</body>
</html>
