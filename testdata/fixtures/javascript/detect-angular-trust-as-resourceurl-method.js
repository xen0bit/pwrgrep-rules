app.controller('MainCtrl', function($scope, $sce) {
  // ruleid: detect-angular-trust-as-resourceurl-method
  $scope.a = $sce.trustAsResourceUrl($scope.x);
  // ruleid: detect-angular-trust-as-resourceurl-method
  $scope.b = $sce.trustAsResourceUrl($scope.y);
  // ruleid: detect-angular-trust-as-resourceurl-method
  $scope.c = $sce.trustAsResourceUrl($scope.z);
  // ok: detect-angular-trust-as-resourceurl-method
  $scope.safe = $sce.trustAsResourceUrl('<b>static</b>');
  // ok: detect-angular-trust-as-resourceurl-method
  $scope.plain = $scope.x;
  // ok: detect-angular-trust-as-resourceurl-method
  $scope.text = 'static';
});
