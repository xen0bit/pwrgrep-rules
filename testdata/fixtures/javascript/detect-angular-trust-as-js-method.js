app.controller('MainCtrl', function($scope, $sce) {
  // ruleid: detect-angular-trust-as-js-method
  $scope.a = $sce.trustAsJs($scope.x);
  // ruleid: detect-angular-trust-as-js-method
  $scope.b = $sce.trustAsJs($scope.y);
  // ruleid: detect-angular-trust-as-js-method
  $scope.c = $sce.trustAsJs($scope.z);
  // ok: detect-angular-trust-as-js-method
  $scope.safe = $sce.trustAsJs('<b>static</b>');
  // ok: detect-angular-trust-as-js-method
  $scope.plain = $scope.x;
  // ok: detect-angular-trust-as-js-method
  $scope.text = 'static';
});
