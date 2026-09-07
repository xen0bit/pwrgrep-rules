app.controller('MainCtrl', function($scope, $sce) {
  // ruleid: detect-angular-trust-as-method
  $scope.a = $sce.trustAs('html', $scope.x);
  // ruleid: detect-angular-trust-as-method
  $scope.b = $sce.trustAs('html', $scope.y);
  // ruleid: detect-angular-trust-as-method
  $scope.c = $sce.trustAs('html', $scope.z);
  // ok: detect-angular-trust-as-method
  $scope.safe = $sce.getTrustedHtml('<b>static</b>');
  // ok: detect-angular-trust-as-method
  $scope.plain = $scope.x;
  // ok: detect-angular-trust-as-method
  $scope.text = 'static';
});
