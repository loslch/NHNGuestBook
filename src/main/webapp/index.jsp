<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html ng-app>
<head>
  <script src='<c:url value="/static/js/jquery-1.11.1.min.js" />'></script>
  <script src='<c:url value="/static/js/angular.min.js" />'></script>
</head>
<body>
    <div>
      <label>Name:</label>
      <input type="text" ng-model="yourName" placeholder="Enter a name here">
      <hr>
      <h1>Hello {{yourName}}!</h1>
    </div>
</body>
</html>
