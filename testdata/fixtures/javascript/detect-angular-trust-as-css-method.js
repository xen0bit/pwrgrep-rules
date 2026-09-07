app.controller('MainCtrl', function($scope, $sce) {
  // ruleid: detect-angular-trust-as-css-method
  $scope.a = $sce.trustAsCss($scope.x);
  // ruleid: detect-angular-trust-as-css-method
  $scope.b = $sce.trustAsCss($scope.y);
  // ruleid: detect-angular-trust-as-css-method
  $scope.c = $sce.trustAsCss($scope.z);
  // ok: detect-angular-trust-as-css-method
  $scope.safe = $sce.trustAsCss('<b>static</b>');
  // ok: detect-angular-trust-as-css-method
  $scope.plain = $scope.x;
  // ok: detect-angular-trust-as-css-method
  $scope.text = 'static';
});
