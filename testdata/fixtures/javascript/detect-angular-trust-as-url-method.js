app.controller('MainCtrl', function($scope, $sce) {
  // ruleid: detect-angular-trust-as-url-method
  $scope.a = $sce.trustAsUrl($scope.x);
  // ruleid: detect-angular-trust-as-url-method
  $scope.b = $sce.trustAsUrl($scope.y);
  // ruleid: detect-angular-trust-as-url-method
  $scope.c = $sce.trustAsUrl($scope.z);
  // ok: detect-angular-trust-as-url-method
  $scope.safe = $sce.trustAsUrl('<b>static</b>');
  // ok: detect-angular-trust-as-url-method
  $scope.plain = $scope.x;
  // ok: detect-angular-trust-as-url-method
  $scope.text = 'static';
});
