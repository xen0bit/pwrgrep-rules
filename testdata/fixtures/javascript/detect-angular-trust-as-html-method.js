app.controller('MainCtrl', function($scope, $sce) {
  // ruleid: detect-angular-trust-as-html-method
  $scope.a = $sce.trustAsHtml($scope.x);
  // ruleid: detect-angular-trust-as-html-method
  $scope.b = $sce.trustAsHtml($scope.y);
  // ruleid: detect-angular-trust-as-html-method
  $scope.c = $sce.trustAsHtml($scope.z);
  // ok: detect-angular-trust-as-html-method
  $scope.safe = $sce.trustAsHtml('<b>static</b>');
  // ok: detect-angular-trust-as-html-method
  $scope.plain = $scope.x;
  // ok: detect-angular-trust-as-html-method
  $scope.text = 'static';
});
