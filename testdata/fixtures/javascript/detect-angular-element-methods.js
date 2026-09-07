function link($scope) {
  // ruleid: detect-angular-element-methods
  angular.element('#out').html($scope.name);
}

function linkAgain($scope) {
  // ruleid: detect-angular-element-methods
  angular.element('#list').append($scope.items);
}

function linkStatic($scope) {
  // ok: detect-angular-element-methods
  angular.element('#out').html('<b>static</b>');
}

function linkPlain(x) {
  // ok: detect-angular-element-methods
  console.log(x);
}
